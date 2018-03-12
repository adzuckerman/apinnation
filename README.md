# Apination + SalesForce Development

This repo contains the necessary Apex classes, triggers, and tests to send data to API Nation.

Every file in this repo is *explicitly generic* and will require at least some
modification to properly work. Instructions for those modifications are found in comments in each file.

#### :file_folder: classes
  * `ApinationObjectSync.cls`
    Apex class file containing instructions to send data to API Nation for a specified SF object.

  * `ApinationWebhook.cls`
    **Required.** Contains functions used in ApinationObjectSync.cls

#### :file_folder: staticresources
  * `ApinationObjectSyncBtn.resource`
    Contains code for a 'Sync to API Nation' generic button.

#### :file_folder: tests
  * `ApinationObjectSyncTestCase.cls`
    A generic test template for ApinationObjectSync.

  * `ApinationObjectTriggerTestCase.cls`
    A generic test template for ApinationObjectSyncTrigger.

#### :file_folder: triggers
  * `ApinationObjectSyncTrigger.trigger`
    Apex trigger file containing instructions to call ApinationObjectSync for a specified SF object.
