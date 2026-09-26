@isTest
public class DailyOppProcessorTest {
    
    @isTest
    public static void testScheduleApex(){
        String sch ='0 0 0 ? * * *';
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i=0; i<500; i++){
            if(i<250){
                oppList.add(new Opportunity(Name='Test'+i,
                                           StageName='Prospecting', CloseDate=System.today()));
            }
            else{
                oppList.add(new Opportunity(Name='Test'+i,
                                           StageName='Prospecting', CloseDate=System.today(),
                                           LeadSource='Email'));
            }
        }
        insert oppList;
        Test.startTest();
        
        String JobId = system.schedule('Process opps',sch , new DailyOppProcessor());
        Test.stopTest();
        
        List<Opportunity> updateOpps = new List<Opportunity>();
        updateOpps=[select Id, LeadSource from Opportunity
                   where LeadSource='Web'];
        
        system.assertEquals(200,updateOpps.size());
        
    }
}