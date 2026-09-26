public class SoqlDemo {
    //Relationship queries parent to child
    public static void ParentToChildDemo(){
        List<Account> accList = new List<Account>();
        accList=[select Id,Name ,(select Id,FirstName,LastName from Contacts) 
                 from Account where Rating='Hot'];
        for(Account acc : accList){
            System.debug('Accountyt Name :' + acc.Name);
            for(Contact con : acc.Contacts){
                system.debug(con.FirstName +' '+con.LastName);
            }
        }
    }
   
    
    //like keyword 
    
    public static void likeDemo(){
        String s ='test';
        s='%' + s + '%';
        List<Account> accList =[select Id,Name from Account where Name like :s];
        for(Account acc : accList){
            system.debug(acc);
        }
    }
    
    public static void queryDemo(){                                     //AND ,OR,IN
        List<Account> accList=[select ID , Name,Industry ,Rating 
                               from Account 
                               where Industry IN ('Media','Energy')];
        for(Account acc : accList){
            system.debug(acc);
        }
    }
    public static void queryDemo2(){                                       //ASC,DESC,NULLS FIRST
        List<Account> accList=[select ID , Name,Industry ,Rating 
                               from Account 
                               where Industry ='Media' 
                               order by Name Nulls first];
        for(Account acc : accList){
            system.debug(acc);
        }
    }
    public static void queryVariable(){                                       //variable string integer
        Integer AR = 10000;
        List<Account> accList=[select ID , Name,Industry ,AnnualRevenue
                               from Account 
                               where AnnualRevenue >=:AR];
        for(Account acc : accList){
            system.debug(acc);
        }
    }
    public static void queryCollection(){                                       //List set Map
        Integer AR = 10000;
        Set<Id> accIds = new Set<Id>();
        
        List<Account> accList=[select Id
                               from Account 
                               limit 10];
        for(Account acc : accList){
            accIds.add(acc.Id);
        }
        List<Account> accList1=[select ID , Name,Industry ,AnnualRevenue
                                from Account 
                                where ID IN: accIds];
        System.debug(accList1);
        
        
        //Agregate Function
        system.debug([select count(Industry) from Account]);
        system.debug([select count_distinct(Industry) from Account]);
        system.debug([select max(AnnualRevenue) from Account]);
        system.debug([select min(AnnualRevenue) from Account]);
        system.debug([select avg(AnnualRevenue) from Account]);
        system.debug([select sum(AnnualRevenue) from Account]);
    }
    //Agregate function
    public static void aggDemo(){
        AggregateResult[] groupedResults =[select Account.Name, sum(Amount) amt
                                           from Opportunity
                                           Group by Account.Name];
        system.debug(groupedResults);
        for(AggregateResult ar : groupedResults){
            system.debug('Account ID =' + ar.get('Name'));
            system.debug('sum of Amount ='+ar.get('amt'));
        }
    }
}