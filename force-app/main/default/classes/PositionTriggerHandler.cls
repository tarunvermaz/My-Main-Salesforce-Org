public class PositionTriggerHandler {
    public static void populateData(List<Position__c> posList){
        for(Position__c pos : posList){
            if(pos.status__c =='New Position'){
                if(pos.Open_date__c==null){
                    pos.Open_date__c=system.today();
                }
                if(pos.Min_pay__c==null){
                    pos.Min_pay__c=10000;
                }
                if(pos.Max_pay__c==null){
                    pos.Max_pay__c=15000;
                }
            }
        }
    }
    public static void createTask(List<Position__c> posList){
        List<Task> taskList = new List<Task>();
        
        for(Position__c pos : posList){
            Task t = new Task();
            t.Subject='Follow up';
            t.ActivityDate=system.today()+7;
            t.WhatId=pos.Id;
            t.OwnerId=userInfo.getUserID();
            t.Status='Not Started';
            
            taskList.add(t);
        }
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
}