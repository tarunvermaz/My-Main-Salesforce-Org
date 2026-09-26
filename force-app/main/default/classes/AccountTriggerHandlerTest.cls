@isTest
public class AccountTriggerHandlerTest {
    @isTest
    static void populateRatingInsert(){
        List<Account> accList = new List<Account>();
        
        for(Integer i=1; i<=10; i++){
            Account acc = new Account();
            
            acc.Name ='Test ' +i;
            acc.Active__c ='Yes';
            acc.Industry='Media';
            accList.add(acc);
            
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Account> updateAccList = [select Rating
                                      from Account
                                      where Id =: accList[0].Id];
        system.assertEquals('Hot', updateAccList[0].Rating);
    }
    @isTest
    static void populateRatingUpadte(){
        List<Account> accList = new List<Account>();
        
        for(Integer i=1; i<=10; i++){
            Account acc = new Account();
            
            acc.Name ='Test ' +i;
            acc.Active__c ='Yes';
            acc.Industry='Chemicals';
            accList.add(acc);
            
        }
        Test.startTest();
        insert accList;
        for(Account acc: accList){
            acc.Industry='Media';
        }
        update accList;
        Test.stopTest();
        
        List<Account> updateAccList = [select Rating
                                      from Account
                                      where Id =: accList[0].Id];
        system.assertEquals('Hot', updateAccList[0].Rating);
    }
    
}