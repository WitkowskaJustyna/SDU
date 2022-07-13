global class DeleteTelemetryDataSchedulable implements Schedulable  {
    
    global void execute(SchedulableContext ctx){
        
       
        
        List<Telemetry__c> telemetryToDelete = [SELECT Id, CreatedDate  
                                                FROM Telemetry__c 
                                                WHERE CreatedDate = N_MONTHS_AGO:3];
        
        while(!telemetryToDelete.isEmpty()){
        
            System.enqueueJob(new DeleteTelemetryDataQueueable());
        } 
        
        System.debug('Telemetry data have been deleted');
     }

 }      
        
      
	//	System.schedule('Delete telemetry', '0 0 2 1 * ?', new DeleteTelemetryDataSchedulable());