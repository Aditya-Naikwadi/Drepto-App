# Drepto Healthcare App

A Flutter healthcare application with role-based authentication for Patients, Doctors, and Nurses.

## Features

- **Landing Page**: Professional landing page with responsive navigation bar
  - Company logo
  - Navigation menu: Home, Medicine, Lab tests, Features, About Us, Contact
  - Login/Registration button

- **Login Page**: User authentication with role selection
  - Role dropdown (Patient, Doctor, Nurse)
  - Email or Phone input
  - Password field
  - Form validation
  - Link to registration page

- **Registration Page**: Complete user registration
  - First Name and Last Name
  - Email ID and Phone Number
  - Gender and Age selection
  - Role selection dropdown (Register as Patient, Doctor, Nurse)
  - Password and Confirm Password
  - Form validation
  - Link to login page

## Design Features

- Teal/Cyan color scheme
- Rounded input fields
- Responsive design for mobile and desktop
- Clean and modern UI
- Google Fonts (Poppins) for typography

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone or navigate to the project directory:
```bash
cd "c:/Users/naikw/OneDrive/Desktop/Drepto App"
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── constants/
│   ├── app_colors.dart      # Color constants
│   └── app_strings.dart     # String constants
├── widgets/
│   ├── custom_text_field.dart   # Reusable text field
│   ├── custom_button.dart       # Reusable button
│   └── custom_dropdown.dart     # Reusable dropdown
└── screens/
    ├── landing_page.dart        # Landing page with navbar
    ├── login_page.dart          # Login screen
    └── registration_page.dart   # Registration screen
```

## User Roles

The application supports three user roles:
- **Patient**: End users seeking healthcare services
- **Doctor**: Medical professionals
- **Nurse**: Healthcare support staff

## Next Steps

- Implement backend authentication
- Add database integration
- Create role-specific dashboards
- Add more features (Medicine catalog, Lab tests, etc.)
- Implement actual navigation for menu items

## Technologies Used

- Flutter
- Dart
- Google Fonts package
- Material Design 3

## License

This project is created for Drepto Healthcare.
