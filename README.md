Readme · MDCopy📱 Portfolio App
Flutter Navigation & Multi-Screen Application
Abdanix Solutions Internship – Week 3
A multi-screen personal portfolio mobile application built with Flutter. Navigate between four dedicated screens — Home, Profile, Details, and Contact — with smooth navigation, data passing, and a consistent dark theme.

📸 Screenshots
Home ScreenNavigation CardsShow ImageShow Image
Profile — About & EducationProfile — SkillsShow ImageShow Image
Details ScreenContact InfoShow ImageShow Image
Message FormMessage SentShow ImageShow Image

✨ Features

4 Screens — Home, Profile, Details, Contact
Flutter Navigation — Navigator.push & Navigator.pop
Data Passing — studentName, ProjectData, SkillData
3-Screen Data Flow — Home → Profile → Details
Dark Theme UI
Reusable Widgets
Animated Entry Effects
Collapsible AppBar — SliverAppBar
Clipboard Copy — Contact Screen
Interactive Message Form


🗂️ Project Structure
lib/
├── main.dart
├── constants/
│   └── app_constants.dart
├── widgets/
│   └── custom_widgets.dart
└── screens/
    ├── home_screen.dart
    ├── profile_screen.dart
    ├── details_screen.dart
    └── contact_screen.dart

🧭 Navigation Flow
HomeScreen
  ├── → ProfileScreen   (passes: studentName)
  │       └── → DetailsScreen (passes: SkillData + passThroughName)
  ├── → DetailsScreen   (passes: ProjectData)
  ├── → DetailsScreen   (passes: SkillData)
  └── → ContactScreen
Back navigation using Navigator.pop()

🔑 Key Concepts
ConceptDetailNavigator.pushOpens a new screenNavigator.popReturns to previous screenData PassingVia constructor argumentsAnimationControllerStaggered entry animationsThemeDataConsistent dark theme across all screensStateful InteractionsMessage form with confirmation state

🛠️ Tech Stack
TechnologyUsageFlutterUI frameworkDartProgramming languageNavigator APIScreen navigationAnimationControllerEntry animationsSliverAppBarCollapsible headersClipboard APICopy contact info

🚀 Setup & Run
bashflutter pub get
flutter run

Tested on Flutter 3.x / Dart 3.x


⚡ Optional Enhancements Implemented

Animated navigation cards (scale on tap + staggered slide-in)
Reusable NavCard and SkillProgressCard widgets
Collapsible headers with SliverAppBar
Message form with success confirmation state
Clipboard copy functionality on Contact Screen


👩‍💻 Author
Haleema Saadia Chaudhary
Mobile App Development — Flutter
Abdanix Solutions
