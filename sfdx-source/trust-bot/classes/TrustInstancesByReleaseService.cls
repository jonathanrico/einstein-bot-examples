public with sharing class TrustInstancesByReleaseService {

    @InvocableMethod(label='Get Instance By Release Name / Version' description='Get a list of instances that matched the specified release number / version')
    public static List<String> getInstancesByRelease(List<String> releaseIndicator) {
        List<String> results = new List<String>();
        for(String r : releaseIndicator){
            List<String> matchedInstances = TrustAPI.getInstancesByRelease(r);
            if(matchedInstances == null){ continue; }
            results.addAll(matchedInstances);
        }
        results.sort();
        return new List<String>{String.join(results, ' , ')};
    }

}