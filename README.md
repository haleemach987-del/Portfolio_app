#Multi-Screen Personal Portfolio App

**Flutter Navigation & Multi-Screen Applications**  


---

## Project Structure

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

## Screens & Navigation Flow

```
HomeScreen
  ├── → ProfileScreen   (passes: studentName)
  │       └── → DetailsScreen (passes: SkillData + passThroughName)
  ├── → DetailsScreen   (passes: ProjectData)
  ├── → ContactScreen
  └── → DetailsScreen   (passes: SkillData)
```

All screens return to the previous screen via `Navigator.pop()`.

---

## Key Concepts Demonstrated

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

## Setup & Run

```bash
flutter pub get
flutter run
```

Tested on Flutter 3.x / Dart 3.x.

---

## Optional Enhancements Implemented
- Animated nav cards (scale on tap + staggered slide-in)
- Reusable `NavCard` and `SkillProgressCard` widgets
- `SliverAppBar` with collapsible header on Home and Details screens
- Simulated message form with success state
- Clipboard copy on Contact screen
