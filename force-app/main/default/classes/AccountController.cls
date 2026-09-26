public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    
        public static List<Account> getHighRevenueAccountRecords(Integer count){
        try {
            return[select Id, Name, AnnualRevenue from Account
                ORDER BY AnnualRevenue DESC NULLS LAST LIMIT: count];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        }
    
        @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        List<Account> accList = new List<Account>();
        // Integer x = 5 / 0;
        accList = [select Id, Name,Phone from Account LIMIT 5];
        return accList;
        }
}