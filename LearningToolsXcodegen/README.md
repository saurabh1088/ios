# LearningToolsXcodegen

A SwiftUI iOS application project configured for XcodeGen.

## Project Overview

This project demonstrates the migration from a traditional Xcode project to an XcodeGen-managed project. The project structure is defined in `project.yml`, which allows for version-controlled, human-readable project configuration.

## Migration to XcodeGen - Step-by-Step Guide

This guide documents the steps taken to migrate this project to XcodeGen. Follow these steps when migrating other projects in the future.

### Prerequisites

1. **Install XcodeGen**
   ```bash
   # Using Homebrew (recommended)
   brew install xcodegen
   
   # Or using Mint
   mint install yonaskolb/XcodeGen
   
   # Verify installation
   xcodegen --version
   ```

2. **Ensure Xcode Command Line Tools are installed**
   ```bash
   xcode-select --install
   ```

### Step 1: Analyze Current Project Structure

Before creating `project.yml`, analyze your existing Xcode project:

1. **Identify Project Settings:**
   - Open the `.xcodeproj` file in Xcode
   - Note down:
     - Project name
     - Bundle identifier
     - Deployment target (iOS version)
     - Swift version
     - Marketing version and build number
     - Supported device families (iPhone/iPad)

2. **List All Targets:**
   - Main app target
   - Unit test target
   - UI test target
   - Any other targets (frameworks, extensions, etc.)

3. **Document Source Files:**
   - List all source directories
   - Note any excluded files or special file groups
   - Identify asset catalogs and resources

4. **Review Build Settings:**
   - Check build configurations (Debug/Release)
   - Note any custom build settings
   - Document code signing settings (if applicable)

### Step 2: Create project.yml File

1. **Create `project.yml` in the project root directory** (same level as `.xcodeproj`)

2. **Define Basic Project Structure:**
   ```yaml
   name: YourProjectName
   options:
     bundleIdPrefix: com.yourcompany
     deploymentTarget:
       iOS: "XX.0"
   ```

3. **Add Targets:**
   - Main app target (type: `application`)
   - Unit test target (type: `bundle.unit-test`)
   - UI test target (type: `bundle.ui-testing`)

4. **Configure Each Target:**
   - Set `sources` paths
   - Configure `settings` (bundle identifier, version, Swift version, etc.)
   - Add `dependencies` for test targets
   - Configure `info` plist settings if needed

5. **Define Schemes:**
   - Create schemes for each target
   - Configure build, run, test, profile, analyze, and archive actions

### Step 3: Generate Xcode Project

1. **Backup Current Project** (optional but recommended):
   ```bash
   # Create a backup of your .xcodeproj
   cp -R YourProject.xcodeproj YourProject.xcodeproj.backup
   ```

2. **Generate the project:**
   ```bash
   xcodegen generate
   ```

3. **Verify Generation:**
   - Check that `.xcodeproj` was created/updated
   - Open the project in Xcode
   - Verify all targets are present
   - Check that source files are included correctly

### Step 4: Validate Project

1. **Build the Project:**
   ```bash
   xcodebuild -project LearningToolsXcodegen.xcodeproj \
             -scheme LearningToolsXcodegen \
             -sdk iphonesimulator \
             -destination 'platform=iOS Simulator,name=iPhone 15' \
             clean build
   ```

2. **Run Tests:**
   ```bash
   xcodebuild test -project LearningToolsXcodegen.xcodeproj \
                  -scheme LearningToolsXcodegen \
                  -sdk iphonesimulator \
                  -destination 'platform=iOS Simulator,name=iPhone 15'
   ```

3. **Open in Xcode and manually verify:**
   - All files are visible in the project navigator
   - Build settings match expectations
   - Schemes are configured correctly
   - App runs successfully in simulator

### Step 5: Clean Up (Optional)

1. **Add to .gitignore:**
   ```
   # XcodeGen
   *.xcodeproj/xcuserdata/
   *.xcodeproj/project.xcworkspace/xcuserdata/
   *.xcodeproj/project.xcworkspace/xcshareddata/swiftpm/
   ```

2. **Consider adding a script to regenerate:**
   Create a script or add to your build process:
   ```bash
   #!/bin/bash
   xcodegen generate
   ```

### Step 6: Version Control

1. **Commit `project.yml` to version control:**
   ```bash
   git add project.yml
   git commit -m "Add XcodeGen configuration"
   ```

2. **Consider whether to commit `.xcodeproj`:**
   - Some teams commit it for easier onboarding
   - Others prefer to generate it from `project.yml` (requires adding to `.gitignore`)

### Common Issues and Solutions

1. **Missing Files:**
   - Ensure source paths in `project.yml` match actual directory structure
   - Check for typos in file paths

2. **Build Errors:**
   - Verify all build settings are correctly migrated
   - Check Swift version compatibility
   - Ensure deployment target is valid

3. **Test Target Issues:**
   - Verify test targets have proper dependencies on main target
   - Check that test files are included in correct target

4. **Asset Catalog Issues:**
   - Ensure asset catalogs are referenced correctly
   - Check `ASSETCATALOG_COMPILER_*` settings

### Best Practices

1. **Keep `project.yml` in version control** - This is your source of truth
2. **Document custom build settings** - Add comments in `project.yml` for clarity
3. **Use consistent naming** - Follow naming conventions across targets
4. **Regular regeneration** - Regenerate project after major changes
5. **Team alignment** - Ensure all team members have XcodeGen installed

### Useful XcodeGen Commands

```bash
# Generate project
xcodegen generate

# Generate and open in Xcode
xcodegen generate && open LearningToolsXcodegen.xcodeproj

# Validate project.yml without generating
xcodegen dump

# Show project structure
xcodegen dump --type json
```

### Additional Resources

- [XcodeGen Documentation](https://github.com/yonaskolb/XcodeGen)
- [XcodeGen Examples](https://github.com/yonaskolb/XcodeGen/tree/master/Docs/Examples)
- [project.yml Specification](https://github.com/yonaskolb/XcodeGen/blob/master/Docs/ProjectSpec.md)

## Project Structure

```
LearningToolsXcodegen/
├── LearningToolsXcodegen/          # Main app source files
│   ├── Assets.xcassets/            # Asset catalog
│   ├── ContentView.swift           # Main view
│   └── LearningToolsXcodegenApp.swift  # App entry point
├── LearningToolsXcodegenTests/     # Unit tests
├── LearningToolsXcodegenUITests/   # UI tests
├── project.yml                     # XcodeGen configuration
└── README.md                       # This file
```

## Getting Started

1. **Install XcodeGen** (if not already installed):
   ```bash
   brew install xcodegen
   ```

2. **Generate the Xcode project:**
   ```bash
   xcodegen generate
   ```

3. **Open the project:**
   ```bash
   open LearningToolsXcodegen.xcodeproj
   ```

4. **Build and run** the project in Xcode

## Notes

- The project uses iOS 26.0 as deployment target (as configured in original project)
- Swift version: 5.0
- Bundle identifier prefix: `com.saurabh`
- The project includes unit tests using Swift Testing framework and UI tests using XCTest
