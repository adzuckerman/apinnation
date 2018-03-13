{!REQUIRESCRIPT("/soap/ajax/26.0/connection.js")}
{!REQUIRESCRIPT("/soap/ajax/26.0/apex.js")}

// This button is to be used on a page where the user wants to sync data from that
// page to API Nation.

// Replace ObjectName with correct SalesForce object
sforce.apex.execute('ApinationObjectNameSync', 'sync', {ObjectNameIds: ['{!ObjectName.Id}']});
alert('Successful Synced');
