public class UpdateParentAccount implements Queueable {
    //Variable
    Private List<Account> accList;
    private Id parentAccIds;
    
    //Constructor
    public UpdateParentAccount(List<Account> accRecords, Id AccIds){
        this.accList = accRecords;
        this.ParentAccIds=accIds;
    }
    //Method
    public void execute(QueueableContext context){
        for(Account acc : accList){
            acc.ParentId = ParentAccIds;
        }
        update accList;
    }
}