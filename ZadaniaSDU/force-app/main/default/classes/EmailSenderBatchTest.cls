@isTest
private class EmailSenderBatchTest{
    
    @testSetup
    static void setup() {
        
        List<Offer__c> newOffers = new List<Offer__c>();
        Account account = TestDataFactory.getAccount();
        insert account;
        
        Showroom__c showroom = TestDataFactory.getShowroom(account, 'Test');
        insert showroom;
        Vehicle__c vehicle = TestDataFactory.getVehicle('testtest');
        insert vehicle;
        
        User user = TestDataFactory.getStandartUser('justyna.witkowska@gmail.com', '1234qwer@qwer.com');
        insert user;
        
        for (Integer i=0;i<5;i++) {                       
            
            Offer__c offer = TestDataFactory.getOffer(showroom, vehicle, 'virtual');
            newOffers.add(offer);
        }
        insert newOffers;  
    }
    @isTest static void test() {
        Test.startTest();
        try {
            EmailSenderBatch newEmail = new EmailSenderBatch();
            Id batchId = Database.executeBatch(newEmail);
        } catch (Exception e) {
            System.assertEquals('The following exception has occurred:', e.getMessage());
        }
       
        Test.stopTest();
      
    }
}