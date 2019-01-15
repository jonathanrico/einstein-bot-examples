public with sharing class TrustInstanceStatusService {

    @InvocableMethod(label='Get Instance Status Summary' description='Get status summary for the specified instance')
    public static List<String> getInstanceStatus(List<String> instance) {
        List<String> results = new List<String>();
        for(String instanceName : instance){
            TrustInstanceStatusResult trustStatsResult = TrustAPI.getInstanceStatus(instanceName);
            if(trustStatsResult == null){ continue; }
            results.add(trustStatsResult.getSummary());
        }
        return results;
    }

}