public class SetDemo {
    public static void demoSObjectWithSet(){
        Set<Id> accIds = new Set<Id>();
        set<string> accNames = new Set<String>();
        List<Account> accList = new list<Account>();
        
        accList =[SELECT Id, Name FROM Account LIMIT 5];
        for(Account acc : accList){
            accIds.add(acc.Id);
            accNames.add(acc.Name);
        }
        System.debug('Set contains = '+ accIds);
        System.debug('Set contains = '+ accNames);
    }
    public static void demo(){
        Set<Integer> intSet = new Set<Integer>();
        List<Integer> intList = new List<Integer>();
        Set<Integer> clonedSet = new Set<Integer>();
  
        intSet.add(10);
        intSet.add(20);
        intSet.add(30);
        intSet.add(10);
        
        intList.add(50);
        intList.add(60);
        intList.add(30);
        
        intSet.addAll(intList);
        
        System.debug('Set contains= '+ intSet);
        
        //intSet.clear();
        //System.debug('Set contains= '+ intSet);
        
        clonedSet = intSet.clone();
        System.debug('cloned Set contains= '+ clonedSet);
        
        System.debug('Element Available= '+ intSet.contains(100));
        
        System.debug('Element Available= '+ intSet.containsAll(intList));
        
        System.debug('Empty = '+ intSet.isEmpty());
        System.debug('Equals = '+ intSet.equals(clonedSet));
        intSet.remove(20);
        System.debug('Set contains = '+ intSet);
        //intSet.removeAll(intList);
        //System.debug('Set contains = '+ intSet);
        
        intSet.retainAll(intList);
        System.debug('Set contains = '+ intSet);
        
        System.debug('Size = '+ intSet.size());
    }
    
}