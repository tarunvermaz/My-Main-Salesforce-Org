public class LinkedinIntegration {
    public static void postOnLinkedin(string Message){
        string loginId = loginToLinkedin();
        postMessage(loginId,Message);
    }
    public static string loginToLinkedin(){
        Http http = new Http();
        Httprequest request  = new Httprequest();
        
        request.setMethod('GET');
        request.setEndpoint('callout:LinkedIn/v2/userinfo');
        
        Httpresponse response = http.send(request);
        //system.debug('response '+response.getBody());
        //system.debug('response '+response.getStatusCode());
        
        Map<String, Object> result =
            (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        
        String loginId = (String) result.get('sub');
        System.debug('Login Id = ' + loginId);
        return loginId;
    }
    
    public static void postMessage(string loginId,string postMessage){
        Http http = new Http();
        Httprequest request  = new Httprequest();
        
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Restli-Protocol-Version', '2.0.0');
        request.setHeader('X-RestLi-Method', 'create');
        String authorId = 'urn:li:person:' + loginId;
        
        String linkedinPostBody ='{'+
            '"author": "'+authorId+'",'+
            '"lifecycleState": "PUBLISHED",'+
            '"specificContent": {'+
            '"com.linkedin.ugc.ShareContent": {'+
            '"shareCommentary": {'+
            '"text": "'+postMessage+'"'+
            ' },'+
            '"shareMediaCategory": "NONE"'+
            '  }'+
            '},'+
            '"visibility": {'+
            '"com.linkedin.ugc.MemberNetworkVisibility": "PUBLIC"'+
            '}'+'}';
        
        request.setBody(linkedinPostBody);
        request.setEndpoint('callout:LinkedIn/v2/ugcPosts');
        
        Httpresponse response = http.send(request);
        system.debug('response '+response.getBody());
        system.debug('response Status Code'+response.getStatusCode());
    }
}