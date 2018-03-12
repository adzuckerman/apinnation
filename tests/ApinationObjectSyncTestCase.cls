/*
  This generic test case can be used for any SalesForce object. 'Object' is used
  throughout this test case, please change 'Object' to the specific SalesForce object.
  I.E. ApinationObjectSyncTestCase --> ApinationOpportunitySyncTestCase
*/

@isTest
private class ApinationObjectSyncTestCase {
    static @isTest void testSync() {
        Object object = new Object(Name = 'Test');
        insert object;

        List<Id> objectIds = new List<Id>();
        objectIds.add(object.Id);

        if (test.isRunningTest()) Test.setMock(HttpCalloutMock.class, new ApinationWebhookMock());

        // Replace ApinationObjectSync with real SalesForce class i.e. ApinationOpportunitySync
        ApinationObjectSync.sync(objectIds);
    }
}
