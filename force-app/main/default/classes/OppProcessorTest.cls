@isTest
public class OppProcessorTest {
    @isTest
    private static void testBatchClass(){
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i=0; i<200; i++){
            Opportunity opp = new Opportunity();
            opp.Name='Test' +i;
            opp.CloseDate=System.today();
            opp.StageName='Prospecting';
            oppList.add(opp);
            
        }
        Test.startTest();
        
        insert oppList;
        oppProcessor oppProcess = new oppProcessor();
        Id batchId = Database.executeBatch(oppProcess);
        
        Test.stopTest();
        
        List<Opportunity> updateOpp =[select Id from Opportunity
                                     where LeadSource ='Web'];
        System.assertEquals(200, updateOpp.size());
    }
}