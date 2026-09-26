public class AccountRecord {
    public static Id insertAccount(String name,String rating){
      Account acc = new Account();
      acc.Name = name;
      acc.Rating= rating;
        
      insert acc;
      return acc.Id;
    }
    public static void insertContact(){
        ID accId;
        accId=insertAccount('New Test','Hot');
        Contact con = new Contact(FirstName ='new Contact',LastName ='101');
        con.AccountId = accId;
        insert con;
        
    }
     public static void insertAccountWithConOppCase(){
      Account acc = new Account();
      acc.Name = 'new Account via apex';
      acc.Rating= 'Hot';
        
      insert acc;
         
      Contact con = new Contact(FirstName ='new Contact',LastName ='via apex');
      con.AccountId = acc.Id;
      insert con;
         
      Opportunity opp = new Opportunity();
      opp.Name='New opp via apex';
      opp.CloseDate=System.today();
      opp.StageName='prospecting';
      opp.AccountId=acc.Id;
      insert opp;
         
     Case cs =new Case();
         cs.status='New';
         cs.Origin='Phone';
         cs.AccountId=acc.Id;
         
         insert cs;
             
    }
}