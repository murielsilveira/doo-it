# doo it
>Simple to do app with a lot of future features 🚀

### 📖 Description
This project's mission is to create and publish an iOS app for managing tasks. Similar to Reminders app, but better.

#### Design and Architecture
This project is based on MVVM design pattern where the Model and ViewModel layers are created using TDD (Test Driven Development). The View layer is tested with UI tests.

#### Objective-C
Swift is awesome, but I believe Objective-C projects still need care. Besides, Objective-C reminds me C, my first programming language, which I love 💙.

#### Files Structure

##### doo it
- Model
   - Gateways
   - Gateway Doubles _(Will be moved to 'doo it Tests' target)_
- View
   - Assets, Storyboards, Custom Views and View Controllers (UIKit stuff)
- ViewModel
   - ViewModels
   - Presenters Protocols
- Supporting Files

##### doo it Tests
- Doubles
- ViewModel Tests
- Gateway Tests
- Supporting Files

---
### ✅ Tests
- [x] TDD for Gateway and ViewModels implementation
- [ ] UI Tests
- [ ] Continuous Integration
- [ ] Test Doubles

---

### 🗄 Data Model

#### Entities
- [x] Task
- [ ] Category
- [ ] Alarm
- [ ] Account

#### Persistence
- [ ] Core Data
- [ ] SQLite

---

### 😍 UI and UX

#### Used storyboards concepts
- [x] Segues
- [ ] Launchscreen
- [ ] Auto Layout
- [ ] Size Classes

#### Used UIKit components
- [x] UISplitViewController
- [ ] UIPresentationController
- [ ] UITableViewController
- [ ] UITableViewCell
- [x] UINavigationController
- [ ] UIGestureRecognizer
- [ ] UIVisualEffectView
- [ ] UIView (customization and reuse)

#### Notifications
- [ ] Notification for alarms
- [ ] Actions for notifications

---

### 📲 Publishing
- [ ] Apple Account $
- [ ] App Icon
- [ ] Screenshots
- [ ] Apple Account for publishing
- [ ] Provisioning
- [ ] iTunes Connect configuration
- [ ] TestFlight configuration
- [ ] Analytics

---

#### 🚠 Migration to Swift

_soon_

---

#### ⌚️ Apple Watch

_soon_

---

### 📚 References
- <a href="https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)">📄 SOLID</a>
- [📽 MVVM](https://www.youtube.com/watch?v=eP_0O5QeYnc)
- [📄 MVVM](https://www.objc.io/issues/13-architecture/mvvm/)
