#  Learning App Storages SwiftUI

## AppStorage

`AppStorage` is a property wrapper which reflects a value from `UserDefaults` with
a key behaviour that when this value is updated, it will also invalidate the view
using property and thereby calls view's body again.
In this sample project `AppStorage` is used to save a theme for application like below:

```
@AppStorage("appTheme") var appTheme: String = Theme.red.rawValue
```

Now one can access `UserDefaults` directly instead of using `AppStorage`, but
then one will need to implement some custom logic to have the view also get updated
once the value in `UserDefaults` changes if the requirement is to ask for such a
behaviour. So in this sample example application as the theme color of the app is
stored in `UserDefaults`, it's important when user switches to a different theme
color, it should get reflected instantly and update whatever views are visible.
Now had `AppStorage` not being used, then a possible approach would have been to
create a class conforming to `ObservableObject` and using a published property to
reflect changes in the `UserDefaults` property, and then use the published property
withing the views. It is doable, but then `AppStorage` will provide this functionality
in a single line of code.

`AppStorage` by default works with `UserDefaults.standard`, however it can be
configured to be used with a particular app group. 

```
@AppStorage("appTheme") var appTheme: String = Theme.red.rawValue

    is same as

@AppStorage("appTheme", store: .standard) var appTheme: String = Theme.red.rawValue

For a particular app group

@AppStorage("appTheme", store: UserDefaults(suiteName: "app.group.com.saurabh")) var appTheme: String = Theme.red.rawValue
```


## SceneStorage

`SceneStorage` is a property wrapper which provides a per scene storage. It functions
very much similar to @State, but it's value is restored by system if it was previously
saved. Each scene has its own notion of `SceneStorage`, hence it can be used to
restore each scene to a different state.
For example, in this sample app, user has option to choose a hero out of several
heroes available from Justice League and Avengers. The selected hero is then displayed
on home screen. This selected hero information is saved to `SceneStorage`, hence
running two instances of app on iPad, one can opt to have different selected hero
for both instances. 
