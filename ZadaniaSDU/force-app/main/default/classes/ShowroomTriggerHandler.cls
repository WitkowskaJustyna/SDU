public class ShowroomTriggerHandler {
   
    
  public static void createListOfCases(Map<Id,Showroom__c> updatedShowroomsMap, Map<Id,Showroom__c> oldShowroomsMap ){
        
        List<Case> caseList = new List<Case>();
        //Set<Id> updatedCloseShowroomIds = new Set<Id>();
        List<Showroom__c> updatedClosedShowrooms = new List<Showroom__c>();
      Set<Id> showroomsForCasesIds = new Set<Id>();
      Set<Id> caseIds = new Set<Id>();
        
      
      for(Showroom__c updatedShowroom : updatedShowroomsMap.values())
      {
          if(updatedShowroom.Status__c == 'Close' && updatedShowroom.Status__c != oldShowroomsMap.get(updatedShowroom.Id).Status__c)
          {
              updatedClosedShowrooms.add(updatedShowroom);
          }
      }
      
      if(!updatedClosedShowrooms.isEmpty())
      {
          for(Showroom__c showroom : updatedClosedShowrooms)
          {
              Case caseToInsert = new Case(Subject='Renovation Case' + showroom.Showroom_Name__c, Showroom__c = showroom.Id);
              caseList.add(caseToInsert);
              showroomsForCasesIds.add(showroom.Id);
          }
      }
        

      if(!caseList.isEmpty()){
          insert caseList;
          List<Case>insertedCases= [SELECT Id FROM Case WHERE Showroom__c IN: showroomsForCasesIds] ;
          if(!insertedCases.isEmpty())
          {
              for(Case singleCase  :insertedCases)
              {
                  caseIds.add(singleCase.Id);
              }
              sendRequest(caseIds);
          }
      }
               
        
      else{
          System.debug('There is no new Closed Showrooms');
      }
         }
   
    @future(callout=true)
    public static void sendRequest(Set<Id> caseIds){
        
        List<Case> caseList = [SELECT Id,  Showroom__c, Status  FROM Case WHERE Showroom__r.Status__c = 'Close'  AND Id IN :caseIds];
        
        for(Case c :caseList) {
        
                Http server = new Http();
                HttpRequest req = new HttpRequest();
                req.setEndpoint('https://jsonplaceholder.typicode.com/posts');
                req.setMethod('POST');
                req.setBody(JSON.serialize(c)); 
                HttpResponse resp = server.send(req);
                if(resp.getStatusCode() == 201)
                   
                {
                    c.Status = 'Closed';
                }else
                {
                    c.Status = 'Faild';
                    System.debug(LoggingLevel.ERROR,'Connection error');
                }

        }
        update caseList;
        
    
    }
             
}