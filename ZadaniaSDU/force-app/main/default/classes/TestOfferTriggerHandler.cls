@isTest
private class TestOfferTriggerHandler {
    
    // method check if is more than one physical offer for the same vehicle, test create 2 physical offers of the same vehicle  in 2 different showrooms.
    @isTest public static void testcheckIsMoreThanOnePhysicalOfferForVehicle_1() {
      
        
        Account account = TestDataFactory.getAccount();
        insert account;
        
        Showroom__c showroom1 = TestDataFactory.getShowroom(account, 'ExtraCars');
        Showroom__c showroom2 = TestDataFactory.getShowroom(account, 'SuperCars');
        
        insert showroom1;
        insert showroom2;
        
        Vehicle__c vehicle = TestDataFactory.getVehicle('1234qwer');
        
        insert vehicle;
        
        Offer__c offer1 = TestDataFactory.getOffer(showroom1, vehicle, 'physical');
        Offer__c offer2 = TestDataFactory.getOffer(showroom2, vehicle, 'physical');
        
        insert offer1;
        
        Test.startTest();
        Database.SaveResult result = Database.insert(offer2, false);
        Test.stopTest();    
    
        System.assertEquals('Vehicle can have only one physical offer. Vehicle is aviable in showroom ' + showroom1.Showroom_Name__c,
                             result.getErrors()[0].getMessage());
        
    }
    
    // method check if is more than one physical offer for the same vehicle, test create 2 physical offers of the same vehicle  in the same showroom.
    @isTest public static void TestcheckIsMoreThanOnePhysicalOfferForVehicle_2() {
      
        
        Account account = TestDataFactory.getAccount();
        insert account;
        
        Showroom__c showroom = TestDataFactory.getShowroom(account, 'ExtraCars');
        
        insert showroom;
        
        Vehicle__c vehicle = TestDataFactory.getVehicle('1234qwer');
        
        insert vehicle;
        
        Offer__c offer1 = TestDataFactory.getOffer(showroom, vehicle, 'physical');
        Offer__c offer2 = TestDataFactory.getOffer(showroom, vehicle, 'physical');
        
        insert offer1;
        
        Test.startTest();
        Database.SaveResult result = Database.insert(offer2, false);
        Test.stopTest();    
    
        System.assertEquals('Vehicle can have only one physical offer. Vehicle is aviable in showroom ' + showroom.Showroom_Name__c,
                             result.getErrors()[0].getMessage());

    }
    
    @isTest public static void TestcheckIsMoreThanOnePhysicalOfferForVehicle_3() {
      
        
        Account account = TestDataFactory.getAccount();
        insert account;
        
        Showroom__c showroom1 = TestDataFactory.getShowroom(account, 'ExtraCars');
        Showroom__c showroom2 = TestDataFactory.getShowroom(account, 'SuperCars');
        
        insert showroom1;
        insert showroom2;
        
        Vehicle__c vehicle1 = TestDataFactory.getVehicle('1234qwer');
        Vehicle__c vehicle2 = TestDataFactory.getVehicle('123qwert');
        
        //You shouldn't be able to insert both vehicles, because they have the same serial number (which should be unique)
        insert vehicle1;
        insert vehicle2;
        
        Offer__c offer1 = TestDataFactory.getOffer(showroom1, vehicle1, 'physical');
        Offer__c offer2 = TestDataFactory.getOffer(showroom1, vehicle2, 'physical');
        Offer__c offer3 = TestDataFactory.getOffer(showroom2, vehicle1, 'physical');
        Offer__c offer4 = TestDataFactory.getOffer(showroom2, vehicle2, 'physical');
        
        insert offer1;
        insert offer2;
        
        Test.startTest();
        Database.SaveResult result1 = Database.insert(offer3, false);
        Database.SaveResult result2 = Database.insert(offer4, false);
        Test.stopTest();    
    
        System.assertEquals('Vehicle can have only one physical offer. Vehicle is aviable in showroom ' + showroom1.Showroom_Name__c,
                             result1.getErrors()[0].getMessage());
        System.assertEquals('Vehicle can have only one physical offer. Vehicle is aviable in showroom ' + showroom1.Showroom_Name__c,
                             result2.getErrors()[0].getMessage());
        
        
    }
    
    @isTest public static void TestcheckIsMoreThanOnePhysicalOfferForVehicle_4() {
        
        Account account = TestDataFactory.getAccount();
        insert account;
        
        Showroom__c showroom1 = TestDataFactory.getShowroom(account, 'ExtraCars');
        Showroom__c showroom2 = TestDataFactory.getShowroom(account, 'SuperCars');
        
        insert showroom1;
        insert showroom2;
        
        Vehicle__c vehicle1 = TestDataFactory.getVehicle('1234qwer');
        Vehicle__c vehicle2 = TestDataFactory.getVehicle('123qwert');
        
       
        insert vehicle1;
        insert vehicle2;
        
        Offer__c offer1 = TestDataFactory.getOffer(showroom1, vehicle1, 'physical');
        Offer__c offer2 = TestDataFactory.getOffer(showroom1, vehicle2, 'physical');
        Offer__c offer3 = TestDataFactory.getOffer(showroom2, vehicle1, 'physical');
        Offer__c offer4 = TestDataFactory.getOffer(showroom2, vehicle2, 'physical');
        
        List<Offer__c> listOfOffers = new List<Offer__c>();
        listOfOffers.add(offer1);
        listOfOffers.add(offer2);
        listOfOffers.add(offer3);
        listOfOffers.add(offer4);
        
        
        Test.startTest();
      
        Database.SaveResult[] resultList = Database.insert(listOfOffers, false);
       
        Test.stopTest();    
    
      //  System.assertEquals('Vehicle can have only one physical offer. Vehicle is aviable in showroom '
       //                      resultList.getErrors()[0].getMessage());
        
        
    }
    
    //Prepare test for scenario when you are trying to isert few offers in the same time (insert list of offers).
    //What should happen then?
    
    
       
}