public class AccountTriggerHandler {
    
    //isExecuting
    
    public static boolean handleAccount(List<Account> accList){
        if(Trigger.isExecuting){
            system.debug('Trigger is Excuting ' + Trigger.isExecuting);
        }
        else{
            System.debug('Without Trigger');
        }
        return Trigger.isExecuting;
    }
    
    public static void updateAccount(List<Account> accList, Map<Id,Account> accOldMap){
        List<Account> accToBeUpdated = new List<Account>();
        
        for(Account acc : accList){
            Account a = new Account();
            a.id =acc.Id;
            a.Description='Test Recursion';
            
            accToBeUpdated.add(a);
            
        }
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }
    }
    
    public static void preventionDeletion(List<Account> accList){
        
        Profile p =[select Id from Profile
                   where Name ='System Administrator'];
        
        for(Account acc : accList){
            if(UserInfo.getProfileId() != p.Id || acc.Active__c =='Yes'){
                acc.addError(Label.Prevent_Account_Deletion);
            }
        }
    }
    
    public static void updateRelatedContacts(List<Account> accList, Map<Id, Account> accOldMap){
        List<Contact> conList = new List<Contact>();
        Map<Id, Account> accMap = new Map<Id, Account>();
        Set<Id> accIds = new Set<Id>();
        
        for(Account acc : accList){
            //Map will store only those Account whose phone is updated
            if(acc.Phone != accOldMap.get(acc.Id).Phone){
                accMap.put(acc.Id,acc);
                //accIds.add(acc.Id);
            }
        }
        for(Contact con : [select Id, HomePhone, AccountId from Contact
                           where AccountId IN: accMap.keySet()]){
                               if(accMap.containsKey(con.AccountId)){
                                   con.HomePhone =accMap.get(con.AccountId).Phone;
                                   conList.add(con);
                               }
                           }
        /*for(Account acc : [select Id,Phone, (select HomePhone from Contacts)
                           from Account where Id IN: accIds]){
                               if(acc.Contacts != null){
                                   for(Contact con : acc.Contacts){
                                       con.HomePhone = acc.Phone;
                                       conList.add(con);
                                   }
                               }
                           }*/
        if(!conList.isEmpty()){
            update conList;
        }
    }
    
    public static void populateRating(List<Account> accList, Map<Id, Account> accOldMap){
        for(Account acc :accList){
            if((accOldMap==null && acc.Industry != null && acc.Industry=='Media')
              || (accOldMap!=null && acc.Industry!=null && acc.Industry != accOldMap.get(acc.Id).Industry && acc.Industry=='Media')){
                acc.Rating='Hot';
            }
        }
    }
    public static void updatePhone(List<Account> accList, Map<Id,Account> accOldMap){
        for(Account acc : accList){
            if(acc.Phone != accOldMap.get(acc.Id).Phone){
                acc.Description='Phone is Updated | Old Values = ' 
                    + accOldMap.get(acc.Id).Phone  +  'New Value is = ' + acc.Phone;
            }
        }
    }
    Public static void updateDesc(List<Account> accList){
        for(Account acc: accList){
            acc.Description = 'New account is Created Again';
        }
    }
    public static void createOpp(List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Account acc : accList){
            Opportunity opp = new Opportunity();
            opp.Name=acc.Name;
            opp.CloseDate= system.today();  //store todays Date
            opp.StageName='Prospecting';
            opp.AccountId=acc.Id;
            oppList.add(opp);
            
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
    
}