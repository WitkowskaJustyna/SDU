@isTest
private class TestVehicleTriggerHandler {
    
    @isTest static void testcreateNewRecordOfDeletedVehicle(){
        
        Vehicle__c vehicle = TestDataFactory.getVehicle('1234qwer');
        insert vehicle;
        
        Telemetry__c telemetry = TestDataFactory.getTelemetry(vehicle);
        insert telemetry;
        
        Test.startTest();
        
        delete(vehicle);
        
        Test.stopTest();
    
        System.assertEquals(1, [select count() from DeletedVehicle__c where Serial_number__c = '1234qwer']);
        System.assertEquals(0, [select count() from Telemetry__c where Vehicle__r.Serial_number__c = '1234qwer']);
    }
    
    @isTest static void testcreateNewRecordOfDeletedVehicleWithTelemetry() {
        
        Vehicle__c vehicle = TestDataFactory.getVehicle('1234qwer');
        insert vehicle;
        
        Telemetry__c telemetry = TestDataFactory.getTelemetry(vehicle);
        insert telemetry;
        
        Test.startTest();
        
        delete(vehicle);
        
        Test.stopTest();
    
        System.assertEquals(1, [select count() from DeletedVehicle__c where Serial_number__c = '1234qwer']);               
        System.assertEquals(0, [select count() from Telemetry__c where Vehicle__r.Serial_number__c = '1234qwer']);
    }
    
    @isTest static void testcreateNewRecordOfDeletedVehicleDeleteAllVehicles(){
        
        Vehicle__c vehicle1 = TestDataFactory.getVehicle('1234qwer');
        Vehicle__c vehicle2 = TestDataFactory.getVehicle('12345qwe');
        Vehicle__c vehicle3 = TestDataFactory.getVehicle('123456qw');
        Vehicle__c vehicle4 = TestDataFactory.getVehicle('1234567q');
        
             
        insert vehicle1;
        insert vehicle2;
        insert vehicle3;
        insert vehicle4;
        
        Telemetry__c telemetry1 = TestDataFactory.getTelemetry(vehicle1);
        Telemetry__c telemetry2 = TestDataFactory.getTelemetry(vehicle2);
        Telemetry__c telemetry3 = TestDataFactory.getTelemetry(vehicle3);
        Telemetry__c telemetry4 = TestDataFactory.getTelemetry(vehicle4);
        
        insert telemetry1;
        insert telemetry2;
        insert telemetry3;
        insert telemetry4;
        
        Test.startTest();
        
        delete(vehicle1);
        delete(vehicle2);
        delete(vehicle3);
        delete(vehicle4);
        
        Test.stopTest();
    
        System.assertEquals(4, [select count() from DeletedVehicle__c where Serial_number__c = '1234qwer' 
                                or Serial_number__c = '12345qwe'
                                or Serial_number__c = '123456qw'
                                or Serial_number__c = '1234567q']);
                                
                    
        System.assertEquals(0, [select count() from Telemetry__c where Vehicle__r.Serial_number__c = '1234qwer'
                                or Vehicle__r.Serial_number__c = '12345qwe'
                                or Vehicle__r.Serial_number__c = '123456qw'
                                or Vehicle__r.Serial_number__c = '1234567q']);
                                              
    }
    
    @isTest static void testcreateNewRecordOfDeletedVehicleDeletePartOfVehicles(){
        
        Vehicle__c vehicle1 = TestDataFactory.getVehicle('1234qwer');
        Vehicle__c vehicle2 = TestDataFactory.getVehicle('12345qwe');
        Vehicle__c vehicle3 = TestDataFactory.getVehicle('123456qw');
        Vehicle__c vehicle4 = TestDataFactory.getVehicle('1234567q');
        
        insert vehicle1;
        insert vehicle2;
        insert vehicle3;
        insert vehicle4;
        
        Telemetry__c telemetry1 = TestDataFactory.getTelemetry(vehicle1);
        Telemetry__c telemetry2 = TestDataFactory.getTelemetry(vehicle2);
        Telemetry__c telemetry3 = TestDataFactory.getTelemetry(vehicle3);
        Telemetry__c telemetry4 = TestDataFactory.getTelemetry(vehicle4);
        
        insert telemetry1;
        insert telemetry2;
        insert telemetry3;
        insert telemetry4;
        
        Test.startTest();
        
        delete(vehicle1);
        delete(vehicle2);
        
        Test.stopTest();
    
        System.assertEquals(2, [select count() from DeletedVehicle__c where Serial_number__c = '1234qwer' 
                                or Serial_number__c = '12345qwe']);
        
       
        System.assertEquals(0, [select count() from Telemetry__c where Vehicle__r.Serial_number__c = '1234qwer'
                                or Vehicle__r.Serial_number__c = '12345qwe']);
                                
                                              
    }


}