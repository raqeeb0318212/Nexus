# NEXUS - The Nexus of Alumni

## 📱 About

**NEXUS** is a comprehensive social networking platform designed specifically for university students and alumni. It provides a unified space for students to connect, share experiences, discover job opportunities, stay updated with campus events, and build meaningful professional relationships.

### ✨ Key Features

- 🔐 **Secure Authentication** - Email/password authentication with email verification
- 👥 **Social Feed** - Share posts, images, and updates with the community
- 💬 **Real-time Chat** - Private messaging with emoji support and media sharing
- 💼 **Job Board** - Post and discover internships, part-time jobs, and career opportunities
- 📅 **Event Calendar** - Stay updated with campus events, workshops, and activities
- 🎨 **Customizable Themes** - Multiple theme options including colorblind-friendly modes
- 🔍 **Advanced Search** - Search users, posts, and events easily
- 👤 **User Profiles** - Detailed profiles with bio, university, major, and online status
- 🌙 **Dark Mode** - Full dark mode support
- 📱 **Cross-platform** - Works on Android, iOS, Web, Windows, macOS, and Linux

## 🛠️ Tech Stack

### Frontend
- **Flutter 3.9.2+** - UI framework
- **Dart** - Programming language
- **Provider** - State management

### Backend & Services
- **Firebase Authentication** - User authentication
- **Cloud Firestore** - Real-time database
- **Firebase Storage** - File and image storage
- **Firebase Messaging** - Push notifications

### Key Packages
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  firebase_core: ^3.15.1
  firebase_auth: ^5.5.4
  cloud_firestore: ^5.6.8
  firebase_storage: ^12.4.10
  image_picker: ^1.1.2
  cached_network_image: ^3.4.1
  uuid: ^4.5.1
  shared_preferences: ^2.3.4
  share_plus: ^10.1.4
  url_launcher: ^6.3.1
  provider: ^6.1.2
  firebase_messaging: ^15.2.5
  emoji_picker_flutter: ^3.1.0
  file_picker: ^8.1.7
```

## 📂 Project Structure

```
nexus/
├── android/                 # Android platform files
├── ios/                     # iOS platform files
├── lib/
│   ├── models/              # Data models
│   │   ├── user_model.dart
│   │   ├── post_model.dart
│   │   ├── job_model.dart
│   │   ├── event_model.dart
│   │   ├── message_model.dart
│   │   ├── conversation_model.dart
│   │   └── comment_model.dart
│   ├── services/            # Business logic
│   │   ├── auth_service.dart
│   │   ├── firestore_service.dart
│   │   ├── chat_service.dart
│   │   └── theme_provider.dart
│   ├── utils/               # Utilities
│   │   ├── animations.dart
│   │   ├── page_transitions.dart
│   │   └── app_colors.dart
│   ├── screens/             # UI screens
│   │   ├── splash_screen.dart
│   │   ├── welcome_screen.dart
│   │   ├── onboarding_screen.dart
│   │   ├── login_screen.dart
│   │   ├── signup_screen.dart
│   │   ├── email_verification_screen.dart
│   │   ├── home_screen.dart
│   │   ├── menu_screen.dart
│   │   ├── user_details_screen.dart
│   │   ├── edit_profile_screen.dart
│   │   ├── create_post_screen.dart
│   │   ├── chat_list_screen.dart
│   │   ├── chat_conversation_screen.dart
│   │   ├── new_chat_screen.dart
│   │   ├── jobs_feed_screen.dart
│   │   ├── job_details_screen.dart
│   │   ├── create_job_screen.dart
│   │   ├── event_calendar_screen.dart
│   │   ├── event_details_screen.dart
│   │   ├── create_event_screen.dart
│   │   ├── notification_screen.dart
│   │   ├── search_screen.dart
│   │   ├── color_change_screen.dart
│   │   ├── settings_screen.dart
│   │   ├── contact_screen.dart
│   │   ├── about_app_screen.dart
│   │   └── ...
│   ├── comments_bottom_sheet.dart
│   ├── firebase_options.dart
│   └── main.dart            # Entry point
├── assets/
│   ├── logo.png
│   └── icon.jpg
├── pubspec.yaml
└── README.md
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Firebase account
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/nexus.git
   cd nexus
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**

   a. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com)
   
   b. Enable the following services:
   - Authentication (Email/Password)
   - Firestore Database
   - Firebase Storage
   - Firebase Messaging (optional)
   
   c. Set up Firestore Security Rules:
   ```javascript
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       match /users/{userId} {
         allow read: if true;
         allow write: if request.auth != null && request.auth.uid == userId;
       }
       match /posts/{postId} {
         allow read: if true;
         allow create: if request.auth != null;
         allow update, delete: if request.auth != null && request.auth.uid == resource.data.authorId;
       }
       match /comments/{commentId} {
         allow read: if true;
         allow create: if request.auth != null;
         allow delete: if request.auth != null && request.auth.uid == resource.data.authorId;
       }
       match /conversations/{conversationId} {
         allow read, write: if request.auth != null && request.auth.uid in resource.data.participants;
       }
       match /jobs/{jobId} {
         allow read: if true;
         allow create: if request.auth != null;
         allow update, delete: if request.auth != null && request.auth.uid == resource.data.authorId;
       }
       match /events/{eventId} {
         allow read: if true;
         allow create: if request.auth != null;
         allow update, delete: if request.auth != null && request.auth.uid == resource.data.organizerId;
       }
     }
   }
   ```
   
   d. Set up Firebase Storage Rules:
   ```javascript
   rules_version = '2';
   service firebase.storage {
     match /b/{bucket}/o {
       match /profiles/{userId}/{allPaths=**} {
         allow read: if true;
         allow write: if request.auth != null && request.auth.uid == userId;
       }
       match /posts/{userId}/{allPaths=**} {
         allow read: if true;
         allow write: if request.auth != null && request.auth.uid == userId;
       }
     }
   }
   ```
   
   e. Download configuration files:
   - **Android**: `google-services.json` → place in `android/app/`
   - **iOS**: `GoogleService-Info.plist` → place in `ios/Runner/`
   
   f. Run FlutterFire CLI:
   ```bash
   # Install FlutterFire CLI
   dart pub global activate flutterfire_cli
   
   # Configure Firebase for your project
   flutterfire configure
   ```

4. **Run the app**
   ```bash
   # Run on connected device/emulator
   flutter run
   
   # Run on specific device
   flutter run -d <device_id>
   
   # Run in debug mode
   flutter run --debug
   
   # Run in release mode
   flutter run --release
   ```

### Building for Production

**Android APK:**
```bash
flutter build apk --release
```

**Android App Bundle (for Play Store):**
```bash
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web --release
```

**Windows:**
```bash
flutter build windows --release
```

**macOS:**
```bash
flutter build macos --release
```

**Linux:**
```bash
flutter build linux --release
```

## 🎨 Features in Detail

### Authentication System
- Email/password registration with username validation
- Username uniqueness check
- Email verification requirement
- Password reset via email
- Secure session management
- Account deletion option

### Social Feed
- Create posts with images and captions
- Like and unlike posts
- Comment on posts with emoji support
- Real-time updates
- Follow/unfollow users
- User post galleries
- Report inappropriate content
- Share posts to other apps
- Delete own posts and comments

### Real-time Messaging
- One-on-one private conversations
- Send text messages
- Emoji picker integration
- Image sharing (camera & gallery)
- Audio file sharing
- Video file sharing
- Read receipts
- Online status indicators
- Last seen timestamps
- Message search by username
- Conversation history

### Job Board
- Post job opportunities
- View job listings
- Job details (title, company, location, salary)
- Search and filter jobs
- Delete own job posts
- Job poster information

### Events Calendar
- Monthly calendar view
- Date selection
- Create events with details
- Event information (title, date, time, location, department)
- View events by date
- Delete own events
- Event organizer profiles

### User Profiles
- Customizable profile pictures
- Bio, university, and major information
- Profile editing
- View own and other users' profiles
- Follow/unfollow functionality
- Online status (Discord-style green dot)
- Last seen information
- Post count, followers, and following stats
- User post galleries
- Message user directly from profile

### Themes & Customization
- **Default Theme** - Original Nexus color scheme
- **Protopia** - Red-Green colorblind friendly (Blue accent)
- **Deutropia** - Blue-Yellow colorblind friendly (Purple accent)
- **Custom Color** - Choose from 10+ accent colors
- **Dark Mode** - Full dark theme support
- Theme preview before applying

### Search & Discovery
- Search users by name or username
- Search posts by caption or author
- Search events by title
- Tab-based search interface
- Recent search results

### Notifications
- Recent job postings
- Upcoming events
- Push notification support (Firebase Messaging)
- Notification preferences in settings

### Settings & Privacy
- Change password
- Email verification status
- Push notification toggle
- Show/hide online status
- Dark mode toggle
- Terms of Service
- Privacy Policy
- Help & Support
- App version info
- Account deletion

## 🔒 Security & Privacy

- Email verification required before app access
- Secure Firebase Authentication
- Firestore security rules for data protection
- Storage security rules for file uploads
- User data privacy controls
- Online status privacy setting
- Report system for inappropriate content
- Account deletion with complete data removal

## 📱 Supported Platforms

- ✅ Android (API 21+)
- ✅ iOS (iOS 12+)
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🧪 Testing

Run tests:
```bash
flutter test
```

Run integration tests:
```bash
flutter test integration_test
```

## 🐛 Known Issues

- None currently reported

## 🗺️ Roadmap

- [ ] Group chat functionality
- [ ] Video calling
- [ ] Alumni verification system
- [ ] Job application tracking
- [ ] Event RSVP system
- [ ] News feed algorithm
- [ ] Hashtag support
- [ ] Story feature
- [ ] In-app notifications

## 🤝 Contributing

This is a private project. For any inquiries or collaboration requests, please contact the developer.

## 📧 Contact

**Developer:**  Muhammad Raqeeb  
**Email:** raqeeb0318212@gmail.com  
**Project:** NEXUS - The Nexus of Alumni

## 📄 License

This project is private and not licensed for public use or distribution.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend infrastructure
- Material Design Icons
- Community packages:
  - `provider` for state management
  - `cached_network_image` for image caching
  - `emoji_picker_flutter` for emoji support
  - `image_picker` for media selection
  - All other amazing open-source contributors

## 📊 Project Status

**Version:** 1.0.0  
**Status:** Active Development  
**Last Updated:** January 2026  
**Minimum Flutter Version:** 3.9.2  
**Minimum Dart Version:** 3.9.2

---

<div align="center">
  <b>Made with ❤️ by Muhammad Raqeeb for the University Student Community</b>
  
  © 2024-2026 NEXUS. All rights reserved.
</div>
