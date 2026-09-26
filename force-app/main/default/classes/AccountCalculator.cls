public class AccountCalculator {
    @future
    public static void countContacts(List<Id> accIDs){
        List<Account> accList=[select Id,Count_Total_Number_Of_Contact__c,
                               (select Id from Contacts)
                              from Account 
                              where Id IN : accIds];
        for(Account acc : accList){
            acc.Count_Total_Number_Of_Contact__c = acc.Contacts.size();
            
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}
//how to execute
/*List<Account> accList =[select Id 
                        from Account 
                       limit 10];
List<Id> accIds = new List<Id>();
for(Account acc : accList){
    accIds.add(acc.Id);
}
AccountCalculator.countContacts(accIds);
*/