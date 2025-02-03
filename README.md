# QA Interview Task - Mobile App Testing

## 1. Introduction

This document outlines the test plan for the fintech mobile wallet application [Download here](https://i.diawi.com/p6w66P):. The objective is to ensure that the app functions correctly by performing manual and automated testing of its core features.

## 2. Scope

This test plan covers functional and UI testing for the mobile wallet app, focusing on:

- Account Details
- View Transactions
- UI validation

## 3. Testing Approach

### 3.1 Manual Testing

Manual test cases will be created in an Excel sheet to verify core functionalities, UI consistency, and error handling.

### 3.2 Automated Testing

Automation will be performed using Appium with Java or Python for the following workflows:

- Account Details
- View Transactions

## 4. Test Scenarios

### 4.1 UI Testing

- Ensure all UI elements are properly aligned and responsive.
- Validate error messages and alerts are displayed correctly.
- Verify that the app adapts to different screen sizes.

## 5. Test Environment

### 5.1 Tools

- Excel for manual test cases
- Screen recording tools for bug reporting

## 6. Bug Reporting

Bugs and inconsistencies will be documented with:

- Description of the issue
- Steps to reproduce
- Expected vs. actual behavior
- Device details
- Screenshots/videos

## 7. Deliverables

1. Test Plan Document (this document)
2. Manual Test Cases (Excel file)
3. Automated Test Scripts
4. Bug Report with device details and screenshots

# Setting Up and Running a Flutter App Locally Using Flutter Environment Manager (FVM)

## Prerequisites

Ensure you have the following installed on your system:

- [Flutter](https://flutter.dev/docs/get-started/install) (if not using `fvm` initially)
- [FVM (Flutter Version Manager)](https://fvm.app/docs/getting_started/installation)
- Git (for version control)
- IDE (VS Code, Android Studio, or IntelliJ)
- Emulator or a physical device

## Step 1: Install FVM

```sh
# Install FVM globally
flutter pub global activate fvm
```

## Step 2: Install a Specific Flutter Version

```sh
# Install a specific Flutter version (replace 3.13.0 with your required version)
fvm install 3.13.0
```

## Step 3: Set the Flutter Version for the Project

```sh
# Navigate to your Flutter project directory
cd my_flutter_project

# Set the Flutter version for the project
fvm use 3.13.0
```

This will create an `.fvm` folder and a `.fvmrc` file inside your project directory.

## Step 4: Configure IDE to Use FVM (Optional)

### VS Code

- Install the [Flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter).
- Add the following settings to VS Code:
  ```json
  {
    "dart.flutterSdkPath": ".fvm/flutter_sdk"
  }
  ```

### Android Studio / IntelliJ

- Open **Preferences > Languages & Frameworks > Flutter**.
- Set the Flutter SDK path to `my_flutter_project/.fvm/flutter_sdk`.

## Step 5: Install Dependencies

```sh
# Install dependencies
fvm flutter pub get
```

## Step 6: Run the Flutter App

```sh
# Run the app on a connected device or emulator
fvm flutter run
```

## Step 7: Managing Flutter Versions with FVM

```sh
# List installed versions
fvm list

# Remove an installed version
fvm remove 3.10.5

# Set global Flutter version (optional)
fvm global 3.13.0
```

## Additional Tips

- Use `fvm flutter doctor` to check the Flutter installation.
- Create a `fvm` alias for convenience:
  ```sh
  alias flutter="fvm flutter"
  ```
  Add this to your `.bashrc` or `.zshrc` for persistence.

Now you are all set to develop your Flutter app using `fvm`! 🚀
