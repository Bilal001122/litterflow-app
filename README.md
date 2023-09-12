# README for litterflow app 

## Introduction

This project aims to combat marine pollution by empowering citizens to effectively report floating marine debris. Our mobile application, called "Litterflow," enables users to capture images of marine debris using their smartphones and report them in real-time, specifying their precise location via GPS coordinates. Furthermore, users have the option to classify the debris based on their type, ranging from plastic bottles to cigarette butts..

## Key Features

- Real-Time Reporting: Citizens can instantly report the presence of floating debris by taking photos through the application.

- Precise Geolocation: The application integrates GPS technology to accurately record the locations of reported debris.

- Debris Classification: Users can specify the type of encountered debris, facilitating cleanup planning.

- Image Database: Captured images feed into a crucial database for future studies on marine pollution.

## Technologies

- Flutter: The core framework for developing cross-platform mobile applications. Flutter allows for the creation of a single codebase that works on both Android and iOS platforms, ensuring consistency and efficiency.

- Dart: The programming language used with Flutter. Dart is known for its fast execution and is specifically designed for building modern, high-performance applications.

- Firebase: Firebase is a comprehensive mobile and web application development platform provided by Google. It offers a suite of tools and services, including real-time databases, authentication, cloud storage, and more. Firebase is commonly used for backend services in Flutter apps.

- Shared Preferences: Shared Preferences is a local storage solution in Flutter for storing simple key-value pairs persistently on a device. It's often used to store user settings and small amounts of data locally.

- BLoC (Business Logic Component) State Management: BLoC is a state management pattern and library for Flutter. It helps manage the state of your application by separating the presentation layer from the business logic. BLoC is known for its scalability and maintainability, making it a popular choice for Flutter app development.

## Installation

- Clone the Repository.

- Set Up Firebase Project
  
- Navigate to the project directory and run the following command to install the required dependencies: `flutter pub get`

- Connect your Android or iOS device to your computer, or use an emulator/simulator. Run the app using: `flutter run`
