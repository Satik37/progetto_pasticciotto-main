# Progetto Pasticciotto – Dark Situational Puzzles

Progetto Pasticciotto is a small Flutter mobile game inspired by short horror stories:
short, twisted situational puzzles designed to be played in a group.  
One player reads the story, the others try to deduce what really happened by asking yes/no questions.

> This project is part of my preparation for Vinted's Engineering Academy and showcases my Flutter, UI, and app-architecture skills.

---

## Features

- **Curated dark situational puzzles** with atmospheric illustrations  
- **Category-based navigation** (e.g. Logic & Deduction, Historical – WIP)  
- **Puzzle detail view** with full story and a revealable answer dialog  
- **Responsive layout** using `flutter_screenutil`, tuned for mobile screens  
- **Typography and visuals** built with Google Fonts and custom imagery  
- **Data-driven content**: puzzles loaded from JSON instead of hard-coded in widgets (easy to extend and localize)

---

## Tech Stack

- **Framework:** Flutter  
- **Language:** Dart  
- **UI & UX:** Material, custom gradients, Google Fonts, responsive layout  
- **Packages:**
  - `flutter_screenutil` – responsive sizing and typography
  - `google_fonts` – custom fonts
  - `flutter_advanced_drawer` – navigation drawer (used in other sections of the app)

---

## Architecture Overview

The app is structured to separate **data**, **models**, and **presentation**:

- `lib/models/puzzle.dart`  
  Defines the `Puzzle` model with id, category, image path, title, description and answer, plus JSON serialization helpers.

- `assets/data/logic_puzzles_en.json`  
  Contains the Logic & Deduction puzzles in JSON format (one array of puzzle objects).  
  This makes it easy to:
  - add more puzzles,
  - support multiple languages with `logic_puzzles_it.json`, `logic_puzzles_xx.json`, etc.,
  - keep UI widgets clean and focused on presentation.

- `lib/services/puzzle_repository.dart`  
  Loads puzzle data from JSON assets using `rootBundle` and converts them into `Puzzle` instances.

- `lib/pages/logic_page.dart`  
  Displays the Logic & Deduction category, loading puzzles via `PuzzleRepository` and showing them in a grid.

- `lib/pages/logic_puzzles_details.dart`  
  Shows a single puzzle in detail, with the full story and a dialog to reveal the answer.

- `lib/components/`  
  Shared UI components such as `PuzzlesTile`, buttons, navigation bar, etc.

This structure is intentionally simple but clean, reflecting a pragmatic approach suitable for a small game and for an entry-level portfolio project.

---

## Getting Started

### Prerequisites

- Flutter SDK installed and configured  
- A running emulator or a physical device connected  

For details, see the official Flutter documentation.  

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

The default entry point is `lib/main.dart`, which starts the intro screen and then lets you navigate into the puzzle categories.

---

## Data & Localization (WIP)

Currently, the Logic & Deduction puzzles are loaded from:

- `assets/data/logic_puzzles_en.json`

The app is designed so that adding support for other languages only requires:

1. Creating additional JSON files, e.g.  
   - `assets/data/logic_puzzles_it.json`  
   - `assets/data/logic_puzzles_xx.json`  
2. Extending `PuzzleRepository` to pick the correct file based on the app’s locale or user settings.  

This makes the content layer future-proof and easy to extend without touching the UI code.

---

## Screenshots

> TODO: add 2–3 screenshots from a device or emulator once the UI is finalized.

Suggested screenshots:

- Intro screen  
- Logic & Deduction grid  
- Puzzle detail + answer dialog  

---

## Roadmap / Future Improvements

- Add more puzzle categories (Historical, Logic vs. Intuition, etc.)  
- Track which puzzles have already been solved and show a visual indicator  
- Persist puzzle progress locally (e.g. SharedPreferences)  
- Add localization (English, Italian, and more)  
- Polish animations and micro-interactions  
- Publish an Android build on the Play Store

---

## Credits

- Illustrations are based on various dark / historical themes (internal assets).  
- Fonts provided via [Google Fonts](https://fonts.google.com/).  
- Built with [Flutter](https://docs.flutter.dev/).