/**
 * Created by unsav on 25.09.17.
 */
@IsTest
private class ApinationOpportunitySyncTestCase {
	static @isTest void testSync() {
		Opportunity opportunity = new Opportunity(CloseDate = date.today(), Name = 'TestOpportunity',
				StageName = 'Needs Analysis');
		insert opportunity;

        List<Id> opportunityIds = new List<Id>();
        opportunityIds.add(opportunity.Id);
        if (test.isRunningTest()) Test.setMock(HttpCalloutMock.class, new ApinationWebhookMock());
        ApinationOpportunitySync.sync(opportunityIds);

    }
}
