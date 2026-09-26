public class LoopDemo {
    //For Each Loop... Most Imp Topic We will use evrything
    public static void showList(){
        
        List<Account> accList = new List<Account>();
        Set<Id> accIDs = new Set<Id>();
        Map<Id, Account> accMap = new Map<Id,Account>();
        
        
        accList= [select Id,Name from Account limit 5];
        
        // Iteration on account list to display data and create set and map
        system.debug('Display data through  List');
        if(accList.size()>0){
            for(Account acc : accList){
                System.debug(acc.Id + '-' + acc.Name);
                accIds.add(acc.Id); //set
                accMap.put(acc.Id, acc);//map
            }
        }
       //Display accids through set
       system.debug('Display data through  Set');
        if(!accIds.isEmpty()){
            for(Id accId :accIds){
                system.debug(accId);
            }
        }
        //Iterate Map based on Keys
        system.debug('Display data through  MapKeys');
        if(!accMap.isEmpty()){
            for(Id accId: accMap.keySet()){
                System.debug(accId);
            }
        }
        //Iterate Map based on Values
        system.debug('Display data through  mapValues');
        if(!accMap.isEmpty()){
            for(Account acc : accMap.values()){
                system.debug(acc);
            }
        }
    }

    //While Loop
    public static void tableWithWhile(Integer n){
        Integer i=1;
        while(i<=10){
            system.debug(n + '*' + i + '=' + n*i);
            i++;
        }
    }
    //for Loop
    public static void sumOfNaturalNumbers(Integer n){
        Integer i,sum=0;
        for(i=1;i<=n;i++){
            sum=sum+i;
        }
        system.debug('sum = '+sum);
    }
    public static void forDemo(){
        for(Integer i=1; i<=10;i++){
            system.debug(i);
        }
    }
    public static void table(Integer n){
        for(Integer i=1; i<=10;i++){
            system.debug(n*i);
        }
    }
    public static void evenNum(Integer n){
        for(Integer i=1;i<=n;i++){
            if(math.mod(i,2)==0){
                system.debug(i);
            }
        }
    }
    public static void oddNum(Integer n){
        for(Integer i=1;i<=n;i++){
            if(math.mod(i,2)!=0){
                system.debug(i);
            }
        }
    }
}