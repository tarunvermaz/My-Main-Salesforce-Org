public class ContactTriggerHandler {
    public static void totalContactCount(List<Contact> conList){
        List<Account> accList = new List<Account>();
        Set<id> accIds = new Set<id>();
        
        for(Contact con : conlist){
            if(con.AccountId != null){
                //collect all account Ids
                accIds.add(con.AccountId);
            }
        }
        for(Account acc :[select Id,(select Id from Contacts)
                          from Account where Id IN: accIds]){
                              acc.Total_Contact_Count__c = acc.Contacts.size();
                              accList.add(acc);
                          }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}