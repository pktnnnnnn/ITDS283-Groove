# Groove 🎵

Groove is a music player and live streaming radio application developed with [Flutter](https://flutter.dev/). It offers comprehensive features for listening to music, searching, creating playlists, and managing user profiles. It is integrated with Firebase for real-time database and user authentication.

## 🌟 Key Features
- **Authentication:** Login and account creation screens (integrated with Firebase Authentication).
- **Home:** Displays recommended or trending music.
- **Search:** Quickly and easily search for your favorite songs.
- **Song Player:** A dedicated screen featuring song duration, playback controls (play/pause), and a smooth progress bar.
- **Radio:** Listen to live streaming radio.
- **My List (Personal Playlist):** Save your favorite songs to your personal playlist.
- **Profile Management:** View and configure user information, with support for uploading or updating profile pictures within the app.

## 🛠 Tech Stack & Dependencies
This project is built using the following core technologies:
- **`flutter`**: The main framework.
- **`firebase_core` & `cloud_firestore`**: Used for NoSQL database connection and backend services.
- **`just_audio`**: A powerful and stable tool for streaming and playing audio files.
- **`audio_video_progress_bar`**: A ready-to-use UI component for creating playback time indicators and progress bars.
- **`image_picker`**: Used for picking images from the device gallery or camera.

## 📁 Project Structure
Key directories and files within the `lib/` folder:
```text
lib/
├── pages/
│   ├── AppBar.dart       # Custom App Bar used throughout the application
│   ├── Home.dart         # Main home screen
│   ├── Mylist.dart       # Favorite songs or playlist screen
│   ├── Profile.dart      # User profile screen
│   ├── Radio.dart        # Radio screen
│   ├── Search.dart       # Song search screen
│   └── Song.dart         # Audio player and controls screen
├── firebase_options.dart # Auto-generated Firebase connection settings
└── main.dart             # Application entry point, handles login screen and Firebase initialization
```

## 🚀 Getting Started

1. **Clone the repository**
   Open your terminal and run:
   ```bash
   git clone <your-repository-url-here>
   cd ITDS283-Groove
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   Since this project relies on Firebase, you need to configure your own Firebase project using the [FlutterFire CLI](https://firebase.google.com/docs/flutter/setup) if the configuration is missing or needs to be updated.
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```

4. **Run the application**
   Once dependencies are installed and Firebase is configured, run the app:
   ```bash
   flutter run
   ```

## 🔒 Security Recommendations
Before pushing this project to a public GitHub repository:
- Ensure that sensitive Firebase configuration files (such as `google-services.json`, `GoogleService-Info.plist`, or `firebase_options.dart`) are properly excluded in your `.gitignore` to prevent exposing your api keys and credentials.
- Set up secure Cloud Firestore security rules in your `firestore.rules` file suitable for a production environment to restrict unauthorized access to your database.

---

*If you would like to improve this documentation, add contributing guidelines, or include a license, feel free to update this file!*
