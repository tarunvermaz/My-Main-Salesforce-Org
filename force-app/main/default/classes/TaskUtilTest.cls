@isTest
public class TaskUtilTest {
    @isTest
    static void testTaskPriorty(){
        String pri = TaskUtil.getTaskPriority('NY');
        system.assertEquals('Normal',pri);
    }
    @isTest
    static void testTaskHighPriorty(){
        String pri = TaskUtil.getTaskPriority('CA');
        system.assertEquals('High',pri);
    }
    @isTest
    static void testTaskPriortyInvalid(){
        String pri = TaskUtil.getTaskPriority('Montana');
        system.assertEquals(null,pri);
    }
}