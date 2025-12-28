# Person App 🚀

A modern, responsive Flutter application designed for managing user profiles. This project demonstrates high-performance cross-platform development with a focus on clean architecture, responsive design, and real-time API integration.

## 📱 Features

- **Responsive Navigation:**
  - **Mobile:** Adaptive Top AppBar + Bottom Navigation Bar.
  - **Tablet/Web:** Collapsible Sidebar  for optimized screen usage.
- **Dynamic User Directory:**
  - Fetches real-time data from the [JSONPlaceholder API](https://jsonplaceholder.typicode.com/users).
  - Multi-parameter search: Filter users by **Name**, **Username**, or **Company Name**.
  - Optimized Search: Only searches within the first 5 records (custom constraint).
- **Profile Management:**
  - Dynamic Routing using `go_router` (`/profile/:id`).
  - Full details view (Email, Phone, Address, Company).
  - Responsive Edit Form with field validation (Email, Phone length, Required fields).
- **Web-First Optimization:**
  - Syncs app state with the browser address bar.
  - Responsive GridView for desktop views.

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** [Dart](https://dart.dev/)
- **State Management:** Provider
- **Navigation:** GoRouter
- **HTTP Client:** Http package
- **Icons/Assets:** SVG integration for categories

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (Latest Stable Version)
- Android Studio / Xcode / VS Code
- Chrome (for web testing)

### Installation

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/pranavpv773/person_app.git](https://github.com/pranavpv773/person_app.git)
   cd person_app