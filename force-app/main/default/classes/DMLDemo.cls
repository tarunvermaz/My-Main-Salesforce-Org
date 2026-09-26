public class DMLDemo {
    //database class example for inserting data and those failed remain others are inserted
    public static void databaseClassDemo(){
        List<Contact> conList = new List<Contact>{     
        new Contact(FirstName='joe',LastName='Smith',Department='Finance'),
          new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
            new Contact(FirstName='Caroline',LastName='roth',Department='Finance'),
            new Contact()};
                
                Database.SaveResult[] srList = database.insert(conList,false);
        //iterate through each returned result
        for(Database.SaveResult sr :srList){
            if(sr.isSuccess()){
                //operation was succesfull, so get the Id of the record that was processed
                System.debug('Successfully inserted contact. Contact ID :' +sr.getId());
            }
            else{
                //operation failed,so get all errors 
                for(Database.Error err : sr.getErrors()){
                    system.debug('The following error has occured.');
                    system.debug(err.getStatusCode()+ ':' + err.getMessage());
                    system.debug('Contact field that affacted this error :'+ err.getFields());
                }
            }
        }
    }
    
    //used to exception handlling if one piece broke other one will be executed
    public static void tryAndCatchDemo(){
        List<Account> accList =new List<Account>();
        
        accList=[select Id,Name,Rating from Account
                where Rating ='Hot'];
        if(!accList.isEmpty()){
            for(Account acc :accList){
                acc.Industry='Energy';
                acc.Active__c='Yes';
            }
        }
        update accList;
        
        try{
            for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Active__c='Yes';
            accList.add(acc); 
        }
            if(!accList.isEmpty()){
            upsert accList;
        }
        }
        catch(DMLException e){
            system.debug(e);
        }
    }
    
    //It will restore data from the recycle bin
    public static void unDeleteDemo(){
        List<Account> accList = new List<Account>();
        accList=[select Id,Name,Rating from Account
                where Name like 'Test DML %' ALL ROWS];
        if(!accList.isEmpty()){
            undelete accList;
        }
    }
    
    //It will delete all the records which contains Test DML
    public static void deleteDemo(){
        List<Account> accList = new List<Account>();
        accList=[select Id,Name,Rating from Account
                where Name like 'Test DML %'];
        if(!accList.isEmpty()){
            delete accList;
        }
    }
    
    //Records which Have ID will be updated and without ID will be inserted
    public static void upsertDemo(){
        List<Account> accList =new List<Account>();
        accList=[select Id,Name,Rating from Account
                where Rating ='Hot'];
        if(!accList.isEmpty()){
            for(Account acc :accList){
                acc.Industry='Energy';
                acc.Active__c='Yes';
            }
        }
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Test Upsert' +i;
            acc.Active__c='Yes';
            accList.add(acc); 
        }
        if(!accList.isEmpty()){
            upsert accList;
        }
    }
    //update record exapmle
    public static void updateDemo(){
        List<Account> accList =new List<Account>();
        accList=[select Id,Name,Rating from Account
                where Rating ='Hot'];
        if(!accList.isEmpty()){
            for(Account acc :accList){
                acc.Industry='Media';
                acc.Active__c='Yes';
            }
            update accList;
        } 
    }
    //insert multiple record using for loop cross governor limit of 150 in 1 statment
    public static void insertDemo(){
        List<Account> accList =new List<Account>();
        for(Integer i=1;i<=200;i++){
            Account acc=new Account();
            acc.Name='Test DML Many' +i;
            acc.Active__c='Yes';
            accList.add(acc); 
        }
        insert accList;
    }
    
    //insert related record
    /*
    public static void insertDemo(){
        List<Account> accList =new List<Account>();
        List<Contact> conList =new List<Contact>();
        Account acc=new Account();
        acc.Name='Test DML 106';
        acc.Active__c='Yes';
        accList.add(acc);
        
        Account acc1=new Account();
        acc1.Name='Test DML 107';
        acc1.Active__c='Yes';
        accList.add(acc1);
        
        insert accList;
        
        Contact con =new Contact();
        con.FirstName=acc.Name;
        con.LastName=acc.Name;
        con.AccountId=acc.Id;
        conList.add(con);
        
        Contact con1 =new Contact();
        con1.FirstName=acc1.Name;
        con1.LastName=acc1.Name;
        con1.AccountId=acc1.Id;
        conList.add(con1);
        
        insert conList;
    }
    */
    //Insert bulk record through List
   /*
    public static void insertDemo(){
        List<Account> accList =new List<Account>();
        Account acc=new Account();
        acc.Name='Test DML 104';
        acc.Active__c='Yes';
        accList.add(acc);
        
        Account acc1=new Account();
        acc1.Name='Test DML 105';
        acc1.Active__c='Yes';
        accList.add(acc1);
        
        insert accList;
    }*/
    
    //single record insert
    
   /* public static void insertDemo(){
        Account acc=new Account();
        acc.Name='Test DML 101';
        acc.Active__c='Yes';
        insert acc;
        
        System.debug('Account ID :'+ acc.Id);
    }*/
}