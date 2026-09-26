trigger OpportunityTrigger on Opportunity (before insert, after update) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            //OpportunityTriggerHandler.validateAmount(Trigger.New);
        }
    }
    if(Trigger.isUpdate){
        if(Trigger.isAfter){
            if(!PreventRecursion.firstCall){
                PreventRecursion.firstCall=true;
                OpportunityTriggerHandler.updateDesc(Trigger.New, Trigger.oldMap);
            }
        }
    }
}