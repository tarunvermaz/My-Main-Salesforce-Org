public class ListDemo{
    public static void sObjectListDemo(){
        List<Account> accList = new List<Account>();
        Account acc1 = new Account(Name='List 01',Active__c='Yes');
        accList.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name='List 02';
        acc2.Active__c='Yes';
        accList.add(acc2);
        
        insert accList;
    }
    public static void listDemoMethod(){
        List<String> colors = new List<String>();
        colors.add('red');
        colors.add('Green');
        colors.add('Blue');
        colors.add('Yellow');
        System.debug('colors list contains'+colors);
        
        colors.add(1,'black');
        System.debug('colors list contains'+colors);
        
        List<String> colorsList2 = new List<String>();
        colorsList2.add('white');
        colorsList2.add('purple');
        
        colors.addAll(colorsList2);
        System.debug('colorsList2 list contains'+colorsList2);
        
        colorsList2.clear();
        System.debug('colorsList2 list contains'+colorsList2);
        
        List<String> clonedList = new List<String>();
        clonedList=colors.clone();
        System.debug('clonedList list contains'+clonedList);
        
        System.debug('clonedList list contains '+colors.contains('Pink'));
        System.debug('clonedList list contains '+colors.equals(clonedList));
        System.debug('clonedList list contains'+colors.get(3));                
        System.debug('clonedList list contains'+colors.indexOf('Green'));
        System.debug('empty ' +colors.isEmpty());
        System.debug('empty ' + colorsList2.isEmpty());
        colors.remove(3);
        System.debug('colors List Contains = ' + colors);
        System.debug('Size ='+ colors.size());
        System.debug('Size ='+ colorsList2.size());
        colors.sort();
        System.debug('Sorted values are' + colors);
    }
}