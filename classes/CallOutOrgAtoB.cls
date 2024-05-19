/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-17-2024
 * @last modified by  : vkm
**/
public class CallOutOrgAtoB {
    @future(callout=true)
    public static void ConnectingOrg(String name , String Phone, String Email) {
        HTTP h = new HTTP();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Connected_App/services/apexrest/Candidate/CandidateServices');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        req.setBody('{"Name" :"'+name+'", "Phone" :"'+Phone+'", "Email" :"'+Email+'"}');
        //req.setBody('{"Name" : "Vishal" , "Phone" : "7890","Email":"v@gmail.com"}');
        HttpResponse response = h.send(req);
        system.debug(response.getBody());
        if(response.getStatusCode() == 200 || response.getStatusCode() == 201) {
            System.debug(response.getBody());
          }
        else {
    		System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
		}

    }
}