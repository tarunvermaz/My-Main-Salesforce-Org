@RestResource(urlMapping = '/accountmngmt/')
global class AccountMngmt {
    @httpGet
    
    // 1st example
    global static List<Account> getTopAccounts(){
        
        //toget parameter in api
        /*Map<String, String> paramsMap = RestContext.request.params;
        string accIndustry = paramsMap.get('industry');*/
        
        List<Account> accList = [select id,Industry,Rating,AnnualRevenue from Account 
                                 where AnnualRevenue != null 
                                 order by annualrevenue desc limit 10];
        return accList;
    }
    // 2nd example
    /*
    global static AccountWrapper getTopAccounts(){
        set<Id> accountIdSet = new set<Id>();
        List<Account> accList = [select id,Industry,Rating,AnnualRevenue from Account 
                                 where AnnualRevenue != null 
                                 order by annualrevenue desc limit 10];
        for(Account acc: accList){
            accountIdSet.add(acc.Id);
        }
        List<Contact> conList= [select Id,lastname,firstname,email from Contact 
                                where AccountId in :accountIdSet];
        List<Case> caseList = [select id, priority,subject from case 
                               where accountId in : accountIdSet];
        AccountWrapper accWrapper = new AccountWrapper();
        accWrapper.accList=accList;
        accWrapper.conList=conList;
        accWrapper.caseList=caseList;
        
        return accWrapper;
    }
*/
    
    @httpPost
    //3rd example
    /*
     global static string createAccount(string accName, string accRating, string accIndustry){
        Account acc = new Account();
        acc.Name=accName;
        acc.Rating=accRating;
        acc.Industry=accIndustry;
        try{
            insert acc;
            return 'Account created succesfully.';
                }catch(exception ex){
                    return ex.getMessage();
                }
    }*/
    //4th example
    global static string createAccountAndContact(AccountInformation Information){
        Account accrecord = Information.accountRecord;
        Contact conrecord = Information.contactRecord;
        try{
            insert accrecord;
            conrecord.accountId = accrecord.Id;
            insert conrecord;
            return 'Account And Contact Are Created Succesfully.';
                }catch(exception ex){
                    return ex.getMessage();
                }
    }
    
    global class AccountWrapper{
        global List<Account> accList;
        global List<Contact> conList;
        global List<Case> caseList;
    }
    
    @httpDelete
    global static string deleteAccount(){
        Map<String, String> paramsMap = RestContext.request.params;
        String accountId = paramsMap.get('accid');
        List<Account> accList = [select id from account where id = :accountId ];
        if(!accList.isEmpty()){
            try{
                delete accList;
                return 'Account DEleted SuccesFully.';
            }catch(exception ex){
                return ex.getMessage();
            }
        }else{
                return 'Record Not Found';
            }
    }
    
    global class AccountInformation{
        global Account accountRecord{get;set;}
        global Contact contactRecord{get;set;}
    }
}