{!REQUIRESCRIPT("/soap/ajax/26.0/connection.js")}
{!REQUIRESCRIPT("/soap/ajax/26.0/apex.js")}

sforce.apex.execute('ApinationOpportunitySync', 'sync', {opportunityIds: ['{!Opportunity.Id}']});
alert('Successful Synced');
