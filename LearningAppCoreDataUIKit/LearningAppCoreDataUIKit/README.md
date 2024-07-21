# Learning App CoreData UIKit


## Data Migration

### Lightweight Data Migration

A lightweight core data migration was performed on this project. Full changes required
for successfull migration are part of pull request :
https://github.com/saurabh1088/ios/pull/9

Goal : For this lightweight core data migration attempt was made to update entity
`Movie` attribute name from `yearOfRelease` to `year`.

Following are the steps to make migration successfull

1. Update the core data stack such that it is configured to perform automatic migration.
This required to add below changes to creation of core data stack.

```
        let description = NSPersistentStoreDescription()
        description.shouldMigrateStoreAutomatically = true
        description.shouldInferMappingModelAutomatically = true
        container.persistentStoreDescriptions.append(description)
```

2. Add new version to core data model the `LearningAppCoreDataUIKit.xcdatamodel` file. New version added is `LearningAppCoreDataUIKit_v2.xcdatamodel`.

3. Select `LearningAppCoreDataUIKit.xcdatamodel` in Xcode, and then in right bar
menu select file inspector. File inspector in Xcode for this file will show an
option to select `Model Version`. This is a dropdown showing all versions added
to data model files. Choose the model version `LearningAppCoreDataUIKit_v2.xcdatamodel`.
Once choosen, a checkmark appears against this new model in Xcode file navigator
confirming that it is now the choosen model.

4. Add required changes to `LearningAppCoreDataUIKit_v2.xcdatamodel`. Updated
attribute for `Movie` and rename `yearOfRelease` to `year`.

5. When an attribute is renamed, Core data migrates data by creating a new attribute
for the new name and then migrating data from previous named attribute. Hence one
need to tell core data what was the previous name of the renamed attribute so that
data can be migrated. To do so, select the renamed attribute in data model file
and open the inspector menu on the righ side menu bar. There under `Renaming ID`
mentione `yearOfRelease`.

6. Data migration required changes are completed with these steps, launch the app
and check for previous data if it's reflected and try CRUD operations to perform
basic sanity.
