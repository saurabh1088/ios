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

### 8. LearningAppiPadUIKit
Sample project supporting iPad using UIKit. This app explores UI options and designs
one can implement considering more real state on larger iPad screens.

### 9. LearningAppStartupUIKit
Sample project using UIKit to explore app startup. This app explores various startup
scenarios and app states delegate callbacks.

### 10. LearningAppStoryboardSegueOptionsUIKit
Sample project using UIKit to explore storyboard segue options.

### 11. LearningAppFrameBoundCenterUIKit
Sample project using UIKit to explore UIView properties like frame, bound and center.

### 12. LearningAppRestCountriesUIKit
Sample project using UIKit and APIs from restcountries.com.

### 12. LearningAppCoreMLSwiftUI
Sample project using SwiftUI to explore Apple's Core ML framework.

### 13. LearningAppFastlaneIntegration
Sample project demonstrating how to integrate fastlane in an iOS project.
- More details at project's README
    - https://github.com/saurabh1088/ios/blob/main/LearningAppFastlaneIntegration/README.md
    
### 14. LearningAppUsingCursorUIKit
Sample project build using cursor.

### 15. LearningToolsXcodegen
Sample project demonstrating how to use xcodegen in an iOS project.

### 16. LearningKeychainAPIsSwiftUI
Sample project demonstrating sqlite usage in iOS app.

#### TODOs
- [x] Add unwind segues from all example views.
- [ ] Add Unit tests.
- [ ] Add UI tests.
