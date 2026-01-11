# Release Notes

## Version 1.1.0 - Todo Details & Editing

**Release Date:** January 10, 2025

### 🎉 New Features

#### Todo Details & Editing
- **Detail View**: Tap any todo item to view and edit its full details in a dedicated screen
- **Edit Mode**: Toggle between view and edit modes with a single tap
- **Description Field**: Add optional descriptions or notes to your todos
- **Swipe Actions**: Swipe left on any todo to quickly access:
  - ✏️ **Edit** - Open detail view in edit mode
  - ✅ **Complete/Incomplete** - Toggle completion status
  - 🗑️ **Delete** - Remove todo item

### ✨ Improvements

- Enhanced user experience with dedicated detail screen for better todo management
- Improved keyboard handling with automatic scroll adjustments
- Real-time validation ensures todos always have a title
- Automatic list refresh after making changes

### 🔧 Technical Changes

- Added `todoDescription` field to Core Data model
- Created `TodoDetailViewController` with view/edit mode support
- Implemented swipe actions in table view
- Added notification system for data synchronization

### 📱 User Experience

- **Before**: Users could only toggle completion and delete todos
- **After**: Full editing capabilities with descriptions, dedicated detail view, and quick swipe actions

---

## Version 1.0.0 - Initial Release

**Release Date:** December 11, 2025

### Features

- ✅ Basic CRUD operations (Create, Read, Update via toggle, Delete)
- ✅ Core Data persistence
- ✅ Simple table view with navigation controller
- ✅ Basic error handling

