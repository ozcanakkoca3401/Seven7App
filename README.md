# Seven7App

# HomeModule 📱  

**HomeModule** is an iOS module developed using **MVVM (Model-View-ViewModel) architecture**. It fetches and displays a list of users from a remote API and navigates to a detailed user view when a user is selected. The module is structured for **clean architecture, testability, and maintainability**.  

---

## Features ✨  

- **MVVM Architecture**: Ensures separation of concerns for better maintainability.  
- **Asynchronous Data Fetching**: Uses `async/await` for non-blocking API requests.  
- **Navigation with Router**: Decouples navigation logic for better modularity.  
- **Dependency Injection**: Improves testability and flexibility.  
- **Custom TableView Implementation**: Displays a list of users with dynamic cell height.  
- **Error Handling & Loading States**: Uses `SVProgressHUD` for a smooth UX.  
- **Unit Tests**: Covers ViewModel logic with mocked data.  

---

## Project Structure 🏗  

- **Models** 📜 → Defines data structures (`UserResponse`, `Address`, `Company`).  
- **Repository Layer** 🌐 → Handles network requests and data fetching.  
- **Router Layer** 🚀 → Manages navigation between screens.  
- **ViewModel Layer** 🧠 → Handles business logic and UI state updates.  
- **View Layer** 🎨 → Displays the user list using `UITableView`.  

---

## Technologies & Frameworks 🛠  

- **Swift**  
- **UIKit**  
- **MVVM Architecture**  
- **Concurrency (async/await)**  
- **SnapKit (Auto Layout)**  
- **CoreNetwork (Network Layer)**  
- **CoreResource & CoreExtension (Utilities)**  
- **SVProgressHUD (Loading & Error Messages)**  
- **XCTest (Unit Testing)**  

---

## Installation 🚀  

1. Clone the repository:  
   ```bash
   git clone https://github.com/yourusername/HomeModule.git
