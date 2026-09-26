public class Calculator {
    //using static method 
    public static void addition(){
        Integer var1=10,var2=5,sum;
        sum= var1+var2;
        system.debug('Addition is '+sum);
    }
    public static void subtraction(){
        Integer var1=10,var2=5,sub;
        sub= var1-var2;
        system.debug('Subtraction is '+sub);
    }
    //using static method with passing parameter
    
    public static void multiplication(Integer var1,Integer var2){
        Integer multi;
        multi= var1*var2;
        system.debug('Multiplication is '+multi);
    }
    public static void division(Integer var1,Integer var2){
        Integer div;
        div= var1/var2;
        system.debug('Addition is '+div);
    }

}