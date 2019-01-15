public with sharing class TrustInstanceSearchByDomainService {

    @InvocableMethod(label='Search Instance by Domain Name' description='Get the instance for the specified domain name (e.g. org62)')
    public static List<String> searchInstance(List<String> domainName) {
        List<String> results = new List<String>();
        for(String dn : domainName){
            String matchedInstance = TrustAPI.searchInstanceByDomainName(dn);
            if(matchedInstance == null){ continue; }
            results.add(matchedInstance);
        }
        return results;
    }

}