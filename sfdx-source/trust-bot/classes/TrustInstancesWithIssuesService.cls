public with sharing class TrustInstancesWithIssuesService {

    @InvocableMethod(label='Get Instance With Issues' description='Get a list of instances that have issues')
    public static List<String> getInstancesWithIssues() {
        List<String> results = new List<String>();

        List<String> matchedInstances = TrustAPI.getInstancesWithIssues();
        if(matchedInstances != null){
            results.addAll(matchedInstances);
        }
        results.sort();
        return new List<String>{String.join(results, ' , ')};
    }

}