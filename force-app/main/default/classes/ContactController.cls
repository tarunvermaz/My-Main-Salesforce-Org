public class ContactController {
    private string sortorder ='FirstName';
    
    public List<Contact> getContacts(){
        List<Contact> results = Database.query(
        'select Id, FirstName, LastName, Email '+
        'From Contact ' +
        'Order by ' + sortOrder + ' ASC '+
        'LIMIT 10');
        
        return results;
    }
    public void sortbyLastName(){
        this.sortOrder ='LastName';
    }
    public void sortbyFirstName(){
        this.sortOrder ='FirstName';
    }
}