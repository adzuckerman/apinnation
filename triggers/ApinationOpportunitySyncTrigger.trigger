trigger ApinationOpportunitySyncTrigger on Opportunity (before insert, after update) {
    List<Id> opportunityIds = new List<Id>();

    for (Opportunity opportunity: Trigger.new) {
        opportunityIds.add(opportunity.Id);
    }


    if (!opportunityIds.isEmpty()) {
        ApinationOpportunitySync.sync(opportunityIds);
    }
}
