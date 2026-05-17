# 📱 Flutter Portfolio App

A multi-screen personal portfolio mobile application built with Flutter. Navigate between four dedicated screens — Home, Profile, Details, and Contact — with smooth navigation, data passing, and a consistent dark theme throughout.

---

## 📸 Screenshots

| Home Screen | Navigation Cards |
|:-----------:|:----------------:|
| ![Home Screen](screenshots/ss1.png) | ![Nav Cards](screenshots/ss2.png) |

| Profile — About & Education | Profile — Skills |
|:---------------------------:|:----------------:|
| ![About](screenshots/ss3.png) | ![Skills](screenshots/ss4.png) |

| Details Screen | Contact Info |
|:--------------:|:------------:|
| ![Details](screenshots/ss5.png) | ![Contact](screenshots/ss6.png) |

| Message Form | Message Sent |
|:------------:|:------------:|
| ![Form](screenshots/ss7.png) | ![Sent](screenshots/ss8.png) |

---

## ✨ Features

- **4 Screens** — Home, Profile, Details, Contact
- **Flutter Navigation** — `Navigator.push` and `Navigator.pop` between all screens
- **Data Passing** — Student name, `ProjectData`, and `SkillData` objects passed via constructors
- **3-Screen Data Chain** — Data travels Home → Profile → Details
- **Dark Theme** — Consistent purple-accent dark UI across all screens
- **Reusable Widgets** — `NavCard`, `SkillProgressCard`, `SkillChip`, `SectionTitle` and more
- **Animated Entry** — Staggered slide-in and fade animations on Home Screen
- **Collapsible AppBar** — `SliverAppBar` on Home and Details screens
- **Clipboard Copy** — Copy contact details directly from the Contact Screen
- **Message Form** — Interactive form with success confirmation state

---

## 🗂️ Project Structure

```
lib/
├── main.dart                      # App entry point & global theme
├── constants/
│   └── app_constants.dart         # Colors, StudentData, SkillData, ProjectData models
├── widgets/
│   └── custom_widgets.dart        # Reusable: NavCard, SkillProgressCard, SkillChip, etc.
└── screens/
    ├── home_screen.dart           # Landing screen with animated navigation cards
    ├── profile_screen.dart        # Profile: bio, education, skills list
    ├── details_screen.dart        # Details for a project OR a skill (data passed in)
    └── contact_screen.dart        # Contact info + simulated message form
```

---

## 🧭 Navigation Flow

```
HomeScreen
  ├── → ProfileScreen     (passes: studentName)
  │       └── → DetailsScreen  (passes: SkillData + passThroughName)
  ├── → DetailsScreen     (passes: ProjectData)
  ├── → DetailsScreen     (passes: SkillData)
  └── → ContactScreen
```

All screens return via `Navigator.pop()`.

---

## 🔑 Key Concepts Demonstrated

| Concept | Where |
|---|---|
| `Navigator.push` | All nav cards in HomeScreen |
| `Navigator.pop` | AppBar back button on every screen |
| Pass data screen→screen | `studentName` String, `ProjectData`, `SkillData` objects |
| Pass data across 3 screens | Home → Profile → Details (`passThroughName`) |
| Reusable widgets | `NavCard`, `SkillProgressCard`, `SkillChip`, `SectionTitle` |
| Consistent UI theme | Single `ThemeData` in `main.dart` + `AppColors` constants |
| Animated entries | Staggered slide + fade in `HomeScreen` and `ContactScreen` |
| Stateful interaction | Message form with sent-confirmation state |
| Clipboard integration | Copy contact details in `ContactScreen` |

---

## 🛠️ Tech Stack

| Technology | Usage |
|------------|-------|
| Flutter | UI framework |
| Dart | Programming language |
| Navigator | Screen navigation |
| AnimationController | Entry animations |
| SliverAppBar | Collapsible headers |
| Clipboard API | Copy contact info |

---

## 🚀 Setup & Run

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/portfolio_app.git
cd portfolio_app

# Install dependencies
flutter pub get

# Run the app
flutter run
```

> Tested on Flutter 3.x / Dart 3.x. Works on Android, iOS, and Chrome.

---

## ⚡ Optional Enhancements Implemented

- Animated nav cards (scale on tap + staggered slide-in)
- Reusable `NavCard` and `SkillProgressCard` widgets
- `SliverAppBar` with collapsible header on Home and Details screens
- Simulated message form with success state
- Clipboard copy on Contact screen

---

## 📁 Adding Screenshots

Create a `screenshots/` folder in the root of the repo and add images named `ss1.png` through `ss8.png`.

```
portfolio_app/
└── screenshots/
    ├── ss1.png   ← Home Screen header
    ├── ss2.png   ← Home Screen nav cards
    ├── ss3.png   ← Profile about & education
    ├── ss4.png   ← Profile skills
    ├── ss5.png   ← Details screen
    ├── ss6.png   ← Contact info
    ├── ss7.png   ← Message form
    └── ss8.png   ← Message sent confirmation
```
