@isTest
private class TestTrustServices {

    @isTest
    private static void testGetInstanceStatusService(){
        Test.setMock(HttpCalloutMock.class, new TestTrustAPICalloutMockImpl());
        List<String> result = TrustInstanceStatusService.getInstanceStatus(new List<String>{'NA45'});
        System.assert(result.size() > 0);
    }


    @isTest
    private static void testGetInstancesByReleaseService(){
        Test.setMock(HttpCalloutMock.class, new TestTrustAPICalloutMockImpl());
        List<String> result = TrustInstancesByReleaseService.getInstancesByRelease(new List<String>{'218'});
        System.assert(result.size() > 0);
    }

    @isTest
    private static void testGetInstancesWithIssuesService(){
        Test.setMock(HttpCalloutMock.class, new TestTrustAPICalloutMockImpl());
        List<String> result = TrustInstancesWithIssuesService.getInstancesWithIssues();
        System.assert(result.size() > 0);
    }

    @isTest
    private static void testSearchInstanceByDomain(){
        Test.setMock(HttpCalloutMock.class, new TestTrustAPICalloutMockImpl());
        List<String> result = TrustInstanceSearchByDomainService.searchInstance(new List<String>{'org62'});
        System.assert(result.size() > 0);
        System.assertEquals('NA44', result.get(0));
    }

}