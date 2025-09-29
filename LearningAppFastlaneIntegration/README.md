# iOS Fastlane Integration


## Pre-requisites

### 1. Ruby should be installed and match the minimum required version

### 2. Install rbenv for managing ruby versions
```
brew install rbenv
```

### 3. Install specific ruby version if required
```
rbenv install 3.1.2
```

### 4. Check if pointing to correct ruby version
```
ruby --version
```

- If still not pointing to correct version, try changing either global or local one
```
rbenv global 3.1.2   # set the default Ruby version for this machine
```

```
rbenv local 3.1.2    # set the Ruby version for this directory
```

### 5. Initialise rbenv, place below in .bash_profile or .zshrc
```
eval "$(rbenv init -)"
```

### 6. Install Bundler
```
gem install bundler
```

### 7. Create Gemfile in the project's root directory with below starting content
```
source "https://rubygems.org"

gem "fastlane"
```

### 8. Create folder fastlane and add file Fastfile inside it

### 9. Execute command to run added lane
- Note : Because the lane is defined under platform :ios, one must include ios in the command

```
fastlane ios try_it
```
