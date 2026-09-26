@isTest
public class TempratureConverterTest {
    @isTest 
    static void testWarmTemp(){
        Decimal celsius = TempratureConverter.FahrenheitToCelsius(70);
        system.assertEquals(21.11,celsius);
    }
    @isTest 
    static void testFreezingPoint(){
        Decimal celsius = TempratureConverter.FahrenheitToCelsius(32);
        system.assertEquals(0,celsius);
    }
    @isTest 
    static void testBoilingPoint(){
        Decimal celsius = TempratureConverter.FahrenheitToCelsius(212);
        system.assertEquals(100,celsius, 'Boiling Point Temprature is Not expected.');
    }
    @isTest 
    static void testNegativeTemp(){
        Decimal celsius = TempratureConverter.FahrenheitToCelsius(-10);
        system.assertEquals(-23.33,celsius);
    }
}