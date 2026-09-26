public class MapDemo{
    public static void sObjectdemoWithoutLoop(){
        List<Account> accList = new List<Account>();
        accList =[SELECT Id,Name,Phone FROM Account LIMIT 5];
        
        Map<Id,Account> accMap = new Map<Id,Account>(accList); 

        System.debug('Map Contains...'+ accMap);
        System.debug('Map Contains...'+ accMap.keySet());
        System.debug('Map Contains...'+ accMap.values());
        
    }
    public static void sObjectdemoWithLoop(){
        List<Account> accList = new List<Account>();
        accList =[SELECT Id,Name,Phone FROM Account LIMIT 5];
        
        Map<Id,Account> accMap = new Map<Id,Account>(); 
        
        for(Account acc : accList){
            accMap.put(acc.id,acc);
        }

        System.debug('Map Contains...'+ accMap);
        System.debug('Map Contains...'+ accMap.keySet());
        System.debug('Map Contains...'+ accMap.values());
        
    }
    
    public static void demo(){
        Map<Integer,String> colors = new Map<Integer,String>();
        Map<Integer,String> moreColors = new Map<Integer,String>();
        Map<Integer,String> clonedMap = new Map<Integer,String>();
        colors.put(1,'Green');
        colors.put(2,'Blue');
        colors.put(3,'Red');
        colors.put(4,'Blue');
        System.debug('Map Contains....='+ colors);
        colors.put(2,'Yellow');
        System.debug('Map contains....='+colors);
        moreColors.put(10,'Black');
        moreColors.put(20,'White');
        colors.putAll(moreColors);
        System.debug('Map contains....='+colors);
        colors.remove(1);
        System.debug('Map contains....='+colors);
        System.debug('Map keys....='+colors.size());
        System.debug('Map values....='+colors.values());
        //colors.clear();
        //System.debug('Map contains....='+colors);
        clonedMap=colors.clone();
        System.debug('Map contains....='+clonedMap.containsKey(50));
        System.debug('Map contains....='+clonedMap.containsKey(10));
        
        System.debug('Map contains....='+clonedMap.equals(colors));
        System.debug('Map contains....='+clonedMap.equals(moreColors));
        System.debug('Map contains....='+clonedMap.get(10));
        System.debug('Map contains....='+clonedMap.isEmpty());
        System.debug('Map Keys....='+clonedMap.keySet());
        
    }
    
}