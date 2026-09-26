public class Rectanglewithconstructor {
    decimal length , breadth;
    //constructor
    public Rectanglewithconstructor(decimal l,decimal b){
        length=l;
        breadth=b;
    }   
    //method 1
    public void area(){
        Decimal a= length*breadth;
        System.debug('Area ='+a);
    }
    //method 2
    public void perimeter(){
        Decimal p= 2*(length+breadth);
        System.debug('perimeter ='+p);
    }


}