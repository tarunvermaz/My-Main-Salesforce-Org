public class ApexScenario {
    public static void scenario1(){
        List<Account> accList = new List<Account>();
        accList=[select Id,Name ,(select Id from Contacts)
                 from Account where Phone != null];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                System.debug(acc.Name + ' has ' + acc.Contacts.size() + ' Contacts Related ');
            }
        }
    }
    
    public static void scenario2(){
        List<Account> accList = new List<Account>();
        accList=[select Id,Name ,(select Id,Amount from Opportunities)
                 from Account where Phone != null];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                Decimal total=0;
                for(Opportunity opp : acc.Opportunities){
                    if(opp.amount != null){
                        total = total+opp.amount;
                    }                  
                }
                system.debug(acc.Name + ' has ' + total + ' worth opportunities');
            }
        }
    }
    
    public static void scenario3(){
        List<Opportunity> oppList = new List<Opportunity>();
        oppList=[select Id,StageName from Opportunity
                 where createdDate = THIS_YEAR];
        if(!oppList.isEmpty()){
            for(Opportunity opp : oppList){
                if(opp.StageName=='Closed Won'){
                    opp.Description = 'Opportunity is Closed Won';
                }
                else if(opp.StageName=='Closed Lost'){
                    opp.Description='Opportunity is Closed Lost';
                }
                else{
                    opp.Description='Opportunity is Open';
                }
                update oppList;
            }
        }
    }
    public static void scenario4(){
        List<Account> accList = new List<Account>();
        accList=[select Id,Total_Contact_Count__c,(select Id from Contacts)
                from Account where CreatedDate = THIS_YEAR];
        if(!accList.isEmpty()){
            for(Account acc:accList){
                acc.Total_Contact_Count__c= acc.Contacts.size();
            }
            update accList;
        }
        }
    
    public static void scenario5(){
        List<Contact> conList = new List<Contact>();
        conList=[select Id, MobilePhone,Account.Phone from Contact
                where CreatedDate = THIS_YEAR];
        if(!conList.isEmpty()){
            for(Contact con : conList){
                if(con.MobilePhone== null && con.Account.Phone !=null){
                    con.MobilePhone=con.Account.Phone;
                }
            }
            update conList;
        }
    }
}