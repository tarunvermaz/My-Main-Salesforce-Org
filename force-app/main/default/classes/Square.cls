//calculate area and perimeter of square
public class Square {
   //using non static method 

    /*public void area(){
        decimal a=5, area;
        area = a*a;
        system.debug('area is '+ area);
    }
    public void perimeter(){
        decimal a=5, peri;
        peri = 4*a;
        system.debug('perimeter is '+ peri);
    }*/
    
    //using non static method with constructor
    
    /*decimal a;
    public Square(){
        a=6;
    }
    public void area(){
        decimal area;
        area = a*a;
        system.debug('area is '+ area);
    }
    public void perimeter(){
        decimal peri;
        peri = 4*a;
        system.debug('perimeter is '+ peri);
    }*/
    //using static method
    
    /*
    public static void area(){
        decimal a=5, area;
        area = a*a;
        system.debug('area is '+ area);
    }
    public static void perimeter(){
        decimal a=5, peri;
        peri = 4*a;
        system.debug('perimeter is '+ peri);
    }*/
    
    //Using static method by passing parameter to method
    
    public static void area(decimal a){
        decimal area;
        area = a*a;
        system.debug('area is '+ area);
    }
    public static void perimeter(decimal a){
        decimal peri;
        peri = 4*a;
        system.debug('perimeter is '+ peri);
    }
}