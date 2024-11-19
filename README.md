Knavator Assignment - Flutter App
This is a Flutter application that fetches posts from an API, stores them locally using SQLite, and displays them in a simple UI. The app uses third-party packages such as Dio for network requests, Sqflite for local storage, and Flutter Launcher Icons for app icon customization.

Features
Fetches posts from a remote API using Dio.
Stores posts locally using Sqflite for offline access.
Displays posts in a scrollable list with separation between each item.
Custom app icon using flutter_launcher_icons.
Prerequisites
Before you begin, ensure you have the following installed on your machine:

Flutter: Make sure Flutter SDK is installed on your machine. You can follow the installation guide from the official Flutter documentation here.
Dart: Dart is the programming language used by Flutter. It comes bundled with the Flutter SDK.
Android Studio or VS Code: Install either of these IDEs for Flutter development. Android Studio is recommended for full Flutter development experience.
Getting Started
Follow these steps to get the application up and running on your local machine:

1. Clone the Repository
Clone this repository to your local machine using the following command:

bash
Copy code
git clone https://github.com/your-username/knavator_assignment.git
cd knavator_assignment
2. Install Dependencies
Install the required packages for your Flutter app:

bash
Copy code
flutter pub get
This will install all the necessary dependencies specified in the pubspec.yaml file.

3. Set Up an Emulator or Device
Ensure you have either an Android or iOS emulator running, or a physical device connected.

To check if a device is connected, run:
bash
Copy code
flutter devices
To run the app on your connected device or emulator, use:
bash
Copy code
flutter run
4. Run the App
To launch the app on the connected device or emulator:

bash
Copy code
flutter run
Third-Party Packages Used
This application uses several third-party packages to streamline development and add functionality:

1. dio
Used for making HTTP requests to fetch posts from a remote API.
Installation:
yaml
Copy code
dependencies:
  dio: ^5.0.0
Usage: The ApiService class uses Dio to fetch posts from the remote API. The fetched data is then saved locally in a database.
2. sqflite
Used for local storage to persist posts on the device using SQLite.
Installation:
yaml
Copy code
dependencies:
  sqflite: ^2.0.0+4
Usage: The DBHelper class provides methods for interacting with the SQLite database to store and retrieve posts.
3. flutter_launcher_icons
Used to customize the app's launcher icon for both Android and iOS.
Installation:
yaml
Copy code
dev_dependencies:
  flutter_launcher_icons: ^0.9.2
Usage: Configure the app icon in the pubspec.yaml file and then run:
bash
Copy code
flutter pub run flutter_launcher_icons:main


This will generate the appropriate icons for the app.
How the App Works
API Service: The app fetches posts from an external API using Dio (handled by ApiService).
Local Storage: Posts are stored locally in an SQLite database via the DBHelper class using the sqflite package.
UI: The posts are displayed in a scrollable list with some separation between each post using ListView.separated. A FutureBuilder is used to asynchronously load the data from the database, showing a loading spinner while the data is being fetched.

Troubleshooting
If you encounter any issues during setup or running the app, make sure:
Your Flutter environment is set up correctly (flutter doctor).
All dependencies are installed with flutter pub get.
You have a valid device or emulator set up to run the app.
Contribution
Feel free to contribute to this project by opening issues or creating pull requests. If you find any bugs or would like to request new features, please open an issue.

License
This project is licensed under the MIT License - see the LICENSE file for details.


