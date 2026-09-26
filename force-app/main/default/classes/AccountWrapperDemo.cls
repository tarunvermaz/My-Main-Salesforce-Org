public with sharing class AccountWrapperDemo {
    public static List<AccountWrapper> getAccountWithContact(){
        List<AccountWrapper> wrapList = new List<AccountWrapper>();
        List<Account> accList =[select Id,Name,(select Id,FirstName,LastName from Contacts)
                               from Account Limit 10];
        if(!accList.isEmpty()){
            for(Account acc:accList){
                wrapList.add(new AccountWrapper(acc,acc.Contacts));
            }
        }
        return wrapList;
    }
    public class AccountWrapper{
        public Account accRecord{get;set;}
        public List<Contact> contactList{get;set;}
        
        public AccountWrapper(Account accRecord, List<Contact> contactList){
            this.accRecord = accRecord;
            this.contactList=contactList;
        }
    }
}