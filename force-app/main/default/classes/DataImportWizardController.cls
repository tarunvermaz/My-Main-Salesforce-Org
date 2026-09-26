
public with sharing class DataImportWizardController {

    //ye method Salesforce ke objects ki list banakar LWC dropdown ko return karta hai.
    @AuraEnabled(cacheable=true)
    public static List<Map<String, String>> getSalesforceObjects() {
        List<Map<String, String>> objects = new List<Map<String, String>>();
        for (Schema.SObjectType obj : Schema.getGlobalDescribe().values()) {
            Schema.DescribeSObjectResult d = obj.getDescribe();
            if (d.isCreateable() && d.isQueryable()) {
                objects.add(new Map<String, String>{
                    'label' => d.getLabel(),
                    'value' => d.getName()
                });
            }
        }
        return objects;
    }

    //ye method selected Salesforce object ke fields laata hai aur unhe LWC field-mapping dropdown me bhejta hai.
    @AuraEnabled(cacheable=true)
    public static List<Map<String, String>> getObjectFields(String objectApiName) {
        List<Map<String, String>> fields = new List<Map<String, String>>();
        Schema.SObjectType objType =
            Schema.getGlobalDescribe().get(objectApiName);
        if (objType == null) {
            throw new AuraHandledException('Invalid object.');
        }
        for (Schema.SObjectField f : objType.getDescribe().fields.getMap().values()) {
            Schema.DescribeFieldResult fd = f.getDescribe();
            if (fd.isCreateable() && !fd.isCalculated()) {
                fields.add(new Map<String, String>{
                    'label' => fd.getLabel(),
                    'value' => fd.getName()
                });
            }
        }
        return fields;
    }

    // ye method CSV data ko Salesforce records me convert karke database me insert karta hai.
    @AuraEnabled
    public static String importRecords(
        String objectApiName,
        String csvData,
        String fieldMappings
    ) {
        if (String.isBlank(csvData) || String.isBlank(fieldMappings)) {
            throw new AuraHandledException('CSV or mapping is missing.');
        }
        Map<String, String> mappings =
            (Map<String, String>) JSON.deserialize(
                fieldMappings,
                Map<String, String>.class
            );
        List<String> lines = csvData.split('\r?\n');
        List<String> headers = lines[0].split(',');
        Map<String, Integer> headerIndex = new Map<String, Integer>();

        for (Integer i = 0; i < headers.size(); i++) {
            headerIndex.put(headers[i].trim(), i);
        }
        Schema.SObjectType objType =
            Schema.getGlobalDescribe().get(objectApiName);
        List<SObject> records = new List<SObject>();

        for (Integer i = 1; i < lines.size(); i++) {
            if (String.isBlank(lines[i])) continue;
            List<String> values = lines[i].split(',');
            SObject record = objType.newSObject();

            for (String salesforceField : mappings.keySet()) {
                String csvColumn = mappings.get(salesforceField);
                Integer index = headerIndex.get(csvColumn);
                if (index != null && index < values.size()) {
                    record.put(
                        salesforceField,
                        values[index].trim()
                    );
                }
            }
            records.add(record);
        }
        if (records.isEmpty()) {
            throw new AuraHandledException('No records found.');
        }
        insert records;
        return records.size() + ' records imported successfully.';
    }
}