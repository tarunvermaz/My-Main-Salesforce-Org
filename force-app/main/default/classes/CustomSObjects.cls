public class CustomSObjects {
    public static void createPosition(){
 
        Candidate__c can = new 	Candidate__c();
        can.First_Name__c='Candidate new';
        can.Last_Name__c='003';
        insert can;
 
        Job_application__c job = new Job_application__c();
        job.Candidate_id__c=can.Id;
        job.Status__c='New';
        insert job;
        
        Position__c pos = new Position__c();
        pos.Name='SFDC Developer';
        pos.RecordTypeId='012gK0000012Er7QAE';
        pos.Candidate__c=can.Id;
        pos.Job_application__c=job.Id;
        insert pos;
        
        Review__c rv = new Review__c();
        rv.Job_application_number__c=job.Id;
        rv.Rating__c=5;
        insert rv;
        
    }
}