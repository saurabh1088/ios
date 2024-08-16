# iOS

Collection of projects aimed at learning various capabilities and frameworks for
iOS app development world.

## Projects

### 1. LearningAppSwiftData
Sample project which was created first with a simple use case create and save some
data on UI, all in-memory so that it isn't persisted over app re-launches(from quit)
https://github.com/saurabh1088/ios/tree/main/LearningAppSwiftData

Project is then updated to use SwiftData for persistence. The changes required for
a simple project to start using SwiftData can be observed as part of below pull request.
https://github.com/saurabh1088/ios/pull/5

### 2. LearningAppCoreDataInMemoryUIKit
Sample project demonstrating how to use Core Data to save data in-memory only.
The project set ups two persistent containers:
- One for in-memory data storage `inMemoryPersistentContainer`
- One for on disk data storage `onDiskPersistentContainer`

### 3. LearningAppCoreDataUIKit
Sample project demonstrating how to set up core data stack while working in a UIKit
based project. Also uses a simple use case of creating an on disk movies database
backed completely by core data.

Project also utilised light-weight core data migration feature. 
More details can be seen in:
- project's [README](LearningAppCoreDataUIKit/LearningAppCoreDataUIKit/README.md) file
- Pull request for changes https://github.com/saurabh1088/ios/pull/9

### 4. LearningAppStoragesSwiftUI
Sample project using SwiftUI to demonstrate the capabilities and differences between
`AppStorage` and `SceneStorage`.
Refer to app's [README](LearningAppStoragesSwiftUI/LearningAppStoragesSwiftUI/README.md) file for more detailed discussion.

### 5. LearningKeychainAPIsSwiftUI
Sample project demonstrating how to use Keychain services to store and retrieve
data.

### 6. LearningMultiplatformPlusSwiftDataSwiftUIApp
Sample project with capability for multiple platforms using Swift Data and SwiftUI.

### 7. LearningAppiPadSwiftUI
Sample project supporting iPad using SwiftUI. This app will explore UI options which
can be used exclusively for iPad form factor.
