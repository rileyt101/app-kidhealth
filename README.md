# KidHealth (Riley Tran)
 
A prototype for logging children's allergies. Developed as part of iPSE course in RMIT.
 
## Overview
 
This app allows parents/caregivers to record their children's known allergies, including severity and any details regarding their child's allergy that they might want to record. 
 
## Project Structure
 
```
a1-s4092817/
├── App/
│   └── a1_s4092817App.swift
│
├── Data/
│   └── Children.swift 
│
├── Models/
│   ├── Allergy.swift
│   └── Child.swift
│
├── ViewModels/
│   └── AppViewModel.swift
│
├── Views/
│   ├── Subviews/                     # Contains reusable subviews + custom Layout
│   │   ├── AllergyListItem.swift
│   │   ├── CustomSplash.swift
│   │   ├── InputFieldStyling.swift
│   │   └── SeverityGrading.swift 
│   │
│   ├── AllergiesView.swift           # Screens that are part of App flow
│   ├── AllergyCreateView.swift 
│   ├── AllergyDetailView.swift
│   ├── HomeView.swift
│   └── SplashView.swift
│
└── Assets.xcassets
```

## App Flow
```
SplashView
    │
HomeView
    │
AllergiesView ───────────────┐
    │                        │
AllergyDetailView     AllergyCreateView
```

## Screen Summary
*SplashView*
- First page upon app entry; contains custom Layout.

*HomeView*
- Displays the user's children as a list.
- A list element (I.e. a child) can be tapped to view their recorded allergies.

*AllergiesView*
- Displays a child's recorded allergies as a list.
- An allergy's details can be further investigated upon tapping its list element.
- An allergy can be added using the "+ Add Allergy" button.

*AllergyDetailView*
- Displays all logged information about the child's selected allergy.

*AllergyCreateView*
- Presents input fields to the user for creating a new allergy entry for a particular child.
