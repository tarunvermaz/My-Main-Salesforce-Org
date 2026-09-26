@isTest
public class CommonTestSetup {
    @testSetup
    static void setup(){
        //create common test accounts
        List<Account> testAcc = new List<Account>();
        for(Integer i=0;i<2;i++){
            testAcc.add(new Account(Name ='TestAcc' +i));
        }
        insert testAcc;
    }
    @isTest
    static void testMethod1(){
        //get the first account by using a soql query
        Account acct =[select Id from Account 
                      where Name='TestAcc0' limit 1];
        //modify first account
        Acct.Phone='5555-1212';
        //this update is local to this test method only.
        update acct;
        
        //delete second account
        Account acct2 =[select Id from Account 
                       where Name='TestAcc1' limit 1];
        //tHIS DELETION IS LOCAL TO THIS TEST METHOD ONLY.
        delete acct2;
       
    }
    //perform some testing
    @isTest
    static void testMethod2(){
        //The changes made by testmethod1 are rolled back and
        //are not visible to this test method.
        //get the first account by using a soql query
        Account acct =[select Phone from Account
                      where Name='TestAcc0' limit 1];
        //varify that test account created by test setup method is unaltered.
        System.assertEquals(null,acct.Phone);
        
        //Get the second account by using soql query.
        Account acct2 =[select Id from Account
                       where Name = 'TestAcc1' limit 1];
        //verify test account created by test setup method is anAlterd.
        System.assertNotEquals(null,acct2);
    }
}