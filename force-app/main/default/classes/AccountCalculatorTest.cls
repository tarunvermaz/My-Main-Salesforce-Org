@isTest
public class AccountCalculatorTest {
  @isTest
    private static void countContactsTest(){
        List<Account> accList = new List<Account>();
        
        for(Integer i=0; i<=250; i++){
            accList.add(New Account(Name='Testing' +i));
        }
        
        Test.startTest();
        insert accList;
        
        List<Contact> conList = new List<Contact>();
        List<Id> accIds = new List<Id>();
        
        for(Account acc : accList){
            Contact con = new Contact();
            con.FirstName='Testing';
            con.LastName=acc.Name;
            con.AccountId =acc.Id;
            conlist.add(con);
            accIds.add(acc.Id);
            
            
        }
        insert conList;
        AccountCalculator.countContacts(accIDs);
        
        Test.stopTest();
        
        List<Account> accs =[select Id, Count_Total_Number_Of_Contact__c
                            from Account];
        system.assertEquals(1,accs[0].Count_Total_Number_Of_Contact__c,
                           'Contacts are not created successfully');
        
        
    }
}