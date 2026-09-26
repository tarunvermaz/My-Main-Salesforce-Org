//Also called DataFactory , TestUtility class

public class TestUtilityClass {
    public static List<Account> createAccountRecord(String Name , Integer Count , Boolean isInsert){
        
        List<Account> accList = new List<Account>();
        for(Integer i=1; i<=Count; i++){
            Account acc = new Account();
            acc.Name= Name+i;
            acc.Active__c='Yes';
            accList.add(acc);
            
        }
        if(isInsert){
            insert accList;
        }
        return accList;
    }
        
}
//we can call this method in our test class
//List<Account> accList = new List<Account>();
//accList = TestUtilityClass.createAccountRecord('Test',10,true);