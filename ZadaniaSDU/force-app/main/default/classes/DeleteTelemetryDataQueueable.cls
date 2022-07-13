global without sharing class DeleteTelemetryDataQueueable implements Queueable {
    
    global void execute(QueueableContext context){
               
      	
        List<Telemetry__c> telemetryToDelete = [SELECT Id, CreatedDate  
                                                FROM Telemetry__c 
                                                WHERE CreatedDate = N_MONTHS_AGO:3 
                                                LIMIT 10000];
        delete telemetryToDelete;

        
        
    }
    
    
}