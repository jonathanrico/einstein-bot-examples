@isTest
private class TestTrustAPI {

    @isTest
    private static void testGetInstanceStatus(){
        Test.setMock(HttpCalloutMock.class, new TestTrustAPICalloutMockImpl());
        TrustInstanceStatusResult res = TrustAPI.getInstanceStatus('NA45');
        System.assertEquals('NA45', res.getKey());
    }

    @isTest
    private static void testGetInstancesByRelease(){
        Test.setMock(HttpCalloutMock.class, new TestTrustAPICalloutMockImpl());
        List<String> res = TrustAPI.getInstancesByRelease('218');
        System.assert(res.size() > 0);
    }

    @isTest
    private static void testGetInstancesWithIssues(){
        Test.setMock(HttpCalloutMock.class, new TestTrustAPICalloutMockImpl());
        List<String> res = TrustAPI.getInstancesWithIssues();
        System.assert(res.size() == 1);
    }

}