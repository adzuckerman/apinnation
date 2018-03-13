/*
  When object trigger is fired, send object ids to the specified object sync class.

  This generic trigger can be used for any SalesForce object. 'Object' is used
  throughout this trigger, please change 'Object' to the specific SalesForce object.
  I.E. ApinationObjectSyncTrigger --> ApinationOpportunitySyncTrigger
*/

trigger ApinationObjectSyncTrigger on Object (before insert, after update) {
    List<Id> objectIds = new List<Id>();

    for (Object object: Trigger.new) {
        objectIds.add(object.Id);
    }

    if (!objectIds.isEmpty()) {
        // Replace ApinationObjectSync with real Apex class i.e. ApinationOpportunitySync
        ApinationObjectSync.sync(objectIds);
    }
}
