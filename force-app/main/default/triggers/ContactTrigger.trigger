trigger ContactTrigger on Contact (After insert, after delete , after undelete) {
    
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            ContactTriggerHandler.totalContactCount(Trigger.New);
        }
    }
    if(Trigger.isDelete){
        if(Trigger.isAfter){
            ContactTriggerHandler.totalContactCount(Trigger.old);
        }
    }
    if(Trigger.isUndelete){
        if(Trigger.isAfter){
            ContactTriggerHandler.totalContactCount(Trigger.New);
        }
    }
}