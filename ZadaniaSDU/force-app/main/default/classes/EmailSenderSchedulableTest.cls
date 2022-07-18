@isTest
private class EmailSenderSchedulableTest {
    static testMethod void executeTest() {
        
        test.startTest();
        EmailSenderSchedulable testClass = new EmailSenderSchedulable();
        String chron = '0 59 23 * * ?';
        System.schedule('Test ', chron, testClass);
        test.stopTest();
    }
    

}