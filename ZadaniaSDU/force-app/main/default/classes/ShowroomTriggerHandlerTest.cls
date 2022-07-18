//wiem, że powinno być więcej scenariuszy, ale dopiszę je jak rozwiąże się zagadka nieprzechodzącego pierwszego testu :)
@isTest
private class ShowroomTriggerHandlerTest {
    
    @isTest  static void createListOfCasesTest(){
       
        Account account = TestDataFactory.getAccount();
        insert account; 
        
    	Showroom__c showroomOld1 = TestDataFactory.getShowroomWithStatus(account, 'Showroom1', 'Open');
        Showroom__c showroomOld2 = TestDataFactory.getShowroomWithStatus(account, 'Showroom2', 'Open');
        Showroom__c showroomOld3 = TestDataFactory.getShowroomWithStatus(account, 'Showroom3', 'Close');
        
        List<Showroom__c> listOfOldShowrooms = new List<Showroom__c>();
        listOfOldShowrooms.add(showroomOld1);
        listOfOldShowrooms.add(showroomOld2);
        listOfOldShowrooms.add(showroomOld3);
            
        insert listOfOldShowrooms;
        
        List<Showroom__c> listOfShowroomsToUpdate = listOfOldShowrooms;
        for(Showroom__c showroom : listOfShowroomsToUpdate) {
            
            showroom.Status__c = 'Close';
        }
        
        update listOfShowroomsToUpdate;
              
        Map<Id, Showroom__c> oldMap = new Map<Id, Showroom__c>(listOfOldShowrooms);
        Map<Id, Showroom__c> newMap = new Map<Id, Showroom__c>(listOfShowroomsToUpdate);
        
        Set<Id> showroomsId = new Set<Id>();
        showroomsId.add(showroomOld1.Id);
        showroomsId.add(showroomOld2.Id);
        
        Test.startTest();
        ShowroomTriggerHandler.createListOfCases( newMap, oldMap );
        Test.stopTest();
        System.assertEquals(2, [select count() from Case where Showroom__c IN :showroomsId] );
        
       
  }
    @isTest
    static void sendRequestFutureTest() {
        
        Account account = TestDataFactory.getAccount();
        insert account;
        
        Showroom__c showroom1 = TestDataFactory.getShowroomWithStatus(account, 'Showroom1', 'Open');
        Showroom__c showroom2 = TestDataFactory.getShowroomWithStatus(account, 'Showroom2', 'Close');
        Showroom__c showroom3 = TestDataFactory.getShowroomWithStatus(account, 'Showroom3', 'Close');
        
        insert showroom1;
        insert showroom2;
        insert showroom3;
        
        Case newCase2 = TestDataFactory.getRenovationCase(showroom2 );
        Case newCase3 = TestDataFactory.getRenovationCase(showroom3 );
        
        insert newCase2;
        insert newCase3;
        
        Set<Id> caseId = new Set<Id>();
        caseId.add(newCase2.Id);
        caseId.add(newCase3.Id);
        
        
        Test.setMock(HttpCalloutMock.class, new ShowroomTriggerHandlerHttpCalloutMock());
        Test.startTest();
        ShowroomTriggerHandler.sendRequest(caseId);
    	Test.stopTest();
        System.assertEquals(2, [select count() from Case where Case.Status = 'Closed']);
    }
}