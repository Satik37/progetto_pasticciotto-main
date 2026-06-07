# Noctis Aenigmata

```
 ███▄    █  ▒█████   ▄████▄  ▄▄▄█████▓ ██▓  ██████     ▄▄▄      ▓█████  ███▄    █  ██▓  ▄████  ███▄ ▄███▓ ▄▄▄     ▄▄▄█████▓ ▄▄▄      
 ██ ▀█   █ ▒██▒  ██▒▒██▀ ▀█  ▓  ██▒ ▓▒▓██▒▒██    ▒    ▒████▄    ▓█   ▀  ██ ▀█   █ ▓██▒ ██▒ ▀█▒▓██▒▀█▀ ██▒▒████▄   ▓  ██▒ ▓▒▒████▄    
▓██  ▀█ ██▒▒██░  ██▒▒▓█    ▄ ▒ ▓██░ ▒░▒██▒░ ▓██▄      ▒██  ▀█▄  ▒███   ▓██  ▀█ ██▒▒██▒▒██░▄▄▄░▓██    ▓██░▒██  ▀█▄ ▒ ▓██░ ▒░▒██  ▀█▄  
▓██▒  ▐▌██▒▒██   ██░▒▓▓▄ ▄██▒░ ▓██▓ ░ ░██░  ▒   ██▒   ░██▄▄▄▄██ ▒▓█  ▄ ▓██▒  ▐▌██▒░██░░▓█  ██▓▒██    ▒██ ░██▄▄▄▄██░ ▓██▓ ░ ░██▄▄▄▄██ 
▒██░   ▓██░░ ████▓▒░▒ ▓███▀ ░  ▒██▒ ░ ░██░▒██████▒▒    ▓█   ▓██▒░▒████▒▒██░   ▓██░░██░░▒▓███▀▒▒██▒   ░██▒ ▓█   ▓██▒ ▒██▒ ░  ▓█   ▓██▒
░ ▒░   ▒ ▒ ░ ▒░▒░▒░ ░ ░▒ ▒  ░  ▒ ░░   ░▓  ▒ ▒▓▒ ▒ ░    ▒▒   ▓▒█░░░ ▒░ ░░ ▒░   ▒ ▒ ░▓   ░▒   ▒ ░ ▒░   ░  ░ ▒▒   ▓▒█░ ▒ ░░    ▒▒   ▓▒█░
░ ░░   ░ ▒░  ░ ▒ ▒░   ░  ▒       ░     ▒ ░░ ░▒  ░ ░     ▒   ▒▒ ░ ░ ░  ░░ ░░   ░ ▒░ ▒ ░  ░   ░ ░  ░      ░  ▒   ▒▒ ░   ░      ▒   ▒▒ ░
   ░   ░ ░ ░ ░ ░ ▒  ░          ░       ▒ ░░  ░  ░       ░   ▒      ░      ░   ░ ░  ▒ ░░ ░   ░ ░      ░     ░   ▒    ░        ░   ▒   
         ░     ░ ░  ░ ░                ░        ░           ░  ░   ░  ░         ░  ░        ░        ░         ░  ░              ░  ░
                    ░                                                                                                                
```

Noctis Aenigmata is a small Flutter mobile game inspired by dark situational puzzles and short horror stories.

It started from a very personal idea: creating something I could actually play with my girlfriend, who loves writing and inventing stories. Because of that, the project became both a technical exercise and a small creative space built around a real person, not just around the idea of “making a portfolio project”.

## How the game works

The game is designed for 2 or more players.

- One player selects a puzzle and reads the hidden solution.
- The other players try to reconstruct what happened by asking yes-or-no questions.
- When they feel ready, they give their final explanation and check the real answer.

The structure is simple on purpose. The goal is not mechanical complexity, but atmosphere, tension, and curiosity.

## Features

- Dark situational puzzles inspired by short horror-story logic
- Category-based navigation
- Puzzle detail view with a dedicated answer reveal dialog
- Custom dark UI with gradients, subtle motion, and animated particles
- Responsive layout tuned for mobile screens
- JSON-driven content, so puzzles are easier to extend and maintain
- Italian and English language support
- Project structure prepared for future multilingual expansion
- Sidebar navigation for extra sections like credits, language selection, and settings

## Visual direction

I wanted the app to feel dark and recognisable without becoming visually heavy.  
The UI uses a small and coherent colour palette, with each main section having its own visual identity. This makes navigation feel a bit more intuitive and also helps give each category its own tone.

Because the gameplay is naturally quite static, I added subtle animated particles and soft background movement to make the app feel more alive without turning it into noise. I also chose dedicated imagery for the puzzles to give each scenario a little more personality.

## Tech stack

- **Framework:** Flutter
- **Language:** Dart
- **Data layer:** JSON
- **UI:** Material components, custom gradients, dark theme, responsive layout
- **Packages:**
  - `flutter_screenutil` for responsive sizing
  - `google_fonts` for typography
  - `flutter_advanced_drawer` for navigation in secondary sections

## Project structure

The app is intentionally structured in a simple but clean way, separating content, models, loading logic, and UI.

### Main pieces

- `lib/models/puzzle.dart`  
  Defines the puzzle model, including fields such as id, category, image path, title, description, and answer, plus JSON serialization helpers.

- `assets/data/*****_puzzles_en.json`  
  Stores puzzle content as JSON data instead of hardcoding it inside widgets. This makes it easier to add puzzles, support multiple languages, and keep the UI layer cleaner.

- `lib/services/puzzle_repository.dart`  
  Loads puzzle data from JSON assets and maps it into `Puzzle` objects.

- `lib/pages/*****_page.dart`  
  Displays a puzzle category and shows the available puzzles in a grid.

- `lib/pages/*****_puzzles_details.dart`  
  Shows a single puzzle in detail and handles the answer reveal flow.

- `lib/components/`  
  Contains reusable UI pieces such as puzzle tiles, buttons, navigation elements, and shared visual components.

## Current status

This project is still in progress.

At the moment I’m mainly working on:
- improving the visual polish of the interface
- adding more puzzle content
- completing extra screens like settings
- refining the overall flow of the game

Part of what matters to me about this project is exactly that it is still evolving. It started from a real idea, for a real person, and that gives it a kind of honesty that I want to preserve while improving the technical side.

## Getting started

### Prerequisites

- Flutter SDK installed and configured
- An emulator or a physical device connected

For setup details, see the official [Flutter documentation](https://docs.flutter.dev/).

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

The default entry point is `lib/main.dart`.

## Localization and content

Puzzle content is currently loaded from JSON files, which makes the project much easier to extend.

Right now the structure already supports the idea of adding more files such as:
- `logic_puzzles_it.json`
- `logic_puzzles_en.json`
- future language-based datasets

This means new content and future localization work can be added without rewriting the UI layer.

## Roadmap

- Add more puzzle categories
- Expand puzzle database and improve writing consistency
- Add local progress tracking
- Improve settings and extra screens
- Polish transitions and micro-interactions
- Prepare a public Android build

## Screenshots

TODO: add screenshots once the UI is more polished.

Good candidates:
- main screen
- category grid
- puzzle detail view
- answer reveal dialog

## Credits

- Built with [Flutter](https://docs.flutter.dev/)
- Fonts via [Google Fonts](https://fonts.google.com/)
- Stories and concepts by Saturnas Costantini Miliauskas & Marina