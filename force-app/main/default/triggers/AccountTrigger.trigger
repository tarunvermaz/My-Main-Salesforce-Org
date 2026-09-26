trigger AccountTrigger on Account (before insert,after insert, before update,after update, before delete) {
    if(Trigger.isinsert){
        if(Trigger.isBefore){
            AccountTriggerHandler.updateDesc(Trigger.New);
            AccountTriggerHandler.populateRating(Trigger.New,null);
        }
        else if(Trigger.isAfter){
            AccountTriggerHandler.createOpp(Trigger.New);
            Boolean b= AccountTriggerHandler.handleAccount(Trigger.new);
            //In after insert Trigger.New is read only
        }
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            AccountTriggerHandler.updatePhone(Trigger.New, Trigger.oldMap);
            AccountTriggerHandler.populateRating(Trigger.New, Trigger.oldMap);
        }
        else if(Trigger.isAfter){
           AccountTriggerHandler.updateRelatedContacts(Trigger.New, Trigger.oldMap);
            if(!PreventRecursion.firstCall){
                PreventRecursion.firstCall=true;
                AccountTriggerHandler.updateAccount(Trigger.New, Trigger.oldMap);
            }      
        }
    }
     if(Trigger.isDelete){
        if(Trigger.isBefore){
            AccountTriggerHandler.preventionDeletion(Trigger.old);
        }
        else if(Trigger.isAfter){
           
        }
    }
}