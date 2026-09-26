public class OpportunityTriggerHandler {
    
    public static void validateAmount(List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            if(opp.Amount==null){
                opp.addError('Please Populate Amount on Opportunity');
            }
        }
    }
    public static void updateDesc(List<Opportunity> oppList, Map<id,Opportunity> oldMap){
        List<Opportunity> oppListToBeUpdated = new List<Opportunity>();
        for(Opportunity opp : oppList){
            Opportunity o = new Opportunity();
            o.Id=opp.id;
            
            If(opp.StageName != oldMap.get(opp.Id).StageName){
                if(opp.StageName == 'Closed Won'){
                    o.Description='Opportunity is closed won';
                }
                else if(opp.StageName == 'Closed Lost'){
                    o.Description='Opportunity is closed Lost';
                }
                oppListToBeUpdated.add(o);
            }
        }
        if(!oppListToBeUpdated.isEmpty()){
            update oppListToBeUpdated;
        }
    }
}