public class ConditionalStatements {
    public static void nullCheckdemo(){
        List<Account> accList = new List<Account>();
        accList= [select ID from Account Limit 5];
        
        if(!accList.isEmpty()){
            System.debug('List contains...'+ accList);
        }
        //or
        if(accList.size()>0){
            System.debug('List Contains....' +accList);
        }
    } //Same null check we can do for set and Map
    
    public static void logicalOperators(){
        Integer num1=100; Integer num2=30;
        if(num1>20 && num2>100){ 			//if both are true than return true
            system.debug('True');
        }else{
            system.debug('False');
        }
        if(num1>20 || num2>100){ 			//if One is true than return true
            system.debug('True');
        }else{
            system.debug('False');
        }
    }
    
    public static void nestedIfDemo(Integer num){
        If(num>=0){
            if(num>0){
                system.debug('number is positive');
            }else{
                system.debug('number is zero');
            }
        }else{
            system.debug('Number is Negative');
        }
    }
    
    public static void elseifLadder(Integer num){
        if(num>0){
            system.debug('Number is Positive');
        }else if(num==0){
            system.debug('Number is zero');
        }else{
            System.debug('Number is negative');
        }
    } 
    
    public static void checkEvenOdd(Integer num){
        if(Math.mod(num,2)==0){
            system.debug('Number is even');
        }else{
            system.debug('Number is Odd');
        }
    }
    
    public static void max(Integer num1, Integer num2){
        //Integer num1=20, num2=40;
        if(num1>num2){
            System.debug('num1 is max than num2');
        }else{
            system.debug('num2 is max than num1');
        }
    }
    //Conditional Operator
    public static void maxWithTurnaryOpp(Integer num1, Integer num2){
        Integer result;
        result=num1>num2 ? num1:num2; //turnary Operator
        System.debug('Maximum = '+result);
    }
    
    public static void checkVotingAge(Integer age){
        if(age>=18){
            system.debug('you are eligible to vote');
        }
        else{
            system.debug('you are not eligible');
        }
    }
    
}