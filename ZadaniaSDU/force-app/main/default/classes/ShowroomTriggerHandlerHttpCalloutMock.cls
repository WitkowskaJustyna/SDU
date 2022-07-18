@isTest
public class ShowroomTriggerHandlerHttpCalloutMock implements HttpCalloutMock {
    

    public static HttpResponse respond(HttpRequest req) {    	
         
        System.assertEquals('https://jsonplaceholder.typicode.com/posts', req.getEndpoint());
        System.assertEquals('POST', req.getMethod());
        
        HttpResponse res = new HttpResponse();
        res.setBody('{"example":"test"}');
        res.setStatusCode(201);
        return res;
        
    }
}