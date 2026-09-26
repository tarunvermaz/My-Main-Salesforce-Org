public with sharing class ContactControllers {

	@AuraEnabled(cacheable=true)
	public static List<Contact> getContacts(String accId) {
		try{
			return[
				SELECT AccountId, Id,FirstName,LastName 
				FROM Contact 
				WHERE AccountId =:accId 
				
			];
		} catch(Exception e){
			throw new AuraHandledException(e.getMessage());
		}
	}

}