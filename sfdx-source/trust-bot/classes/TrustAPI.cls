public with sharing class TrustAPI {

    private final static String TRUST_ENDPOINT_URL = 'https://api.status.salesforce.com/v1';

    public static TrustInstanceStatusResult getInstanceStatus(String instanceName){
        
        TrustInstanceStatusResult trustRes  = null;

        HttpResponse res = makeCallout('GET', '/instances/'+instanceName+'/status/preview');
        if(res.getStatusCode() == 200){
            Map<String, Object> bodyMap = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            trustRes  = new TrustInstanceStatusResult(
            (String)bodyMap.get('key'),
            (String)bodyMap.get('location'),
            (String)bodyMap.get('environment'),
            (String)bodyMap.get('releaseVersion'),
            (String)bodyMap.get('releaseNumber'),
            (String)bodyMap.get('status'),
            (Boolean)bodyMap.get('isActive'));
        } else {
            System.debug(res.getStatusCode() +' : '+res.getBody());
        }
        
        return trustRes;
    }

    public static List<String> getInstancesByRelease(String releaseIdentifer){
        List<String> matchedInstances = new List<String>();

        HttpResponse res = makeCallout('GET', '/instances/status/preview');
        if(res.getStatusCode() == 200){
            List<Object> instanceList = (List<Object>)JSON.deserializeUntyped(res.getBody());
            for(Object o : instanceList){
                Map<String, Object> valueMap = (Map<String, Object>)o;
                String releaseVersion = (String)valueMap.get('releaseVersion');
                String releaseNumber = (String)valueMap.get('releaseNumber');
                if(releaseVersion.contains(releaseIdentifer) || releaseNumber.contains(releaseIdentifer)){
                    matchedInstances.add((String)valueMap.get('key'));
                }
            }
        } else {
            System.debug(res.getStatusCode() +' : '+res.getBody());
        }
        return matchedInstances;
    }

    public static List<String> getInstancesWithIssues(){
        List<String> matchedInstances = new List<String>();

        HttpResponse res = makeCallout('GET', '/instances/status/preview');
        if(res.getStatusCode() == 200){
            List<Object> instanceList = (List<Object>)JSON.deserializeUntyped(res.getBody());
            for(Object o : instanceList){
                Map<String, Object> valueMap = (Map<String, Object>)o;
                String status = (String)valueMap.get('status');
                if(status != 'OK'){
                    matchedInstances.add((String)valueMap.get('key'));
                }
            }
        } else {
            System.debug(res.getStatusCode() +' : '+res.getBody());
        }
        return matchedInstances;
    }

    public static String searchInstanceByDomainName(String domainName){
        HttpResponse res = makeCallout('GET', '/search/'+domainName);
        String instanceKey = null;
        if(res.getStatusCode() == 200){
            List<Object> instanceList = (List<Object>)JSON.deserializeUntyped(res.getBody());
            for(Object o : instanceList){
                Map<String, Object> valueMap = (Map<String, Object>)o;
                instanceKey = (String)valueMap.get('instanceKey');
            }
        } else {
            System.debug(res.getStatusCode() +' : '+res.getBody());
        }
        return instanceKey;
    }

    private static HttpResponse makeCallout(String method, String path){
        Http h = new Http();

        HttpRequest req = new HttpRequest();
        req.setEndpoint(TRUST_ENDPOINT_URL+path);
        req.setMethod(method == null? 'GET' : method);
        
        return h.send(req);
    }
    
}