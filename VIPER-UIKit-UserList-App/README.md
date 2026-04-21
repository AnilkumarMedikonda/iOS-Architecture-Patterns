# 📱 VIPER-UIKit-UserList-App

A sample iOS application demonstrating the **VIPER architecture** using UIKit, Dependency Injection, and Unit Testing.

---

## 🧠 What is VIPER?

VIPER is an architectural pattern that separates responsibilities into five layers:

* **V** → View
* **I** → Interactor
* **P** → Presenter
* **E** → Entity
* **R** → Router

👉 Goal: **Clean separation, testability, scalability**

---

## 🧩 Architecture Overview

```
View → Presenter → Interactor → Service → Network
                     ↓
                  Router
```

---

## 📂 Project Structure

```
VIPER-UIKit-UserList-App/
│
├── Core/
│   ├── Network/
│   ├── Constants/
│
├── Modules/
│   └── UserList/
│       ├── Entity/
│       ├── View/
│       ├── Presenter/
│       ├── Interactor/
│       ├── Router/
│       ├── Service/
│       └── Builder/
│
├── Tests/
│   └── UserList/
│       ├── PresenterTests.swift
│       ├── InteractorTests.swift
│       └── Mocks.swift
```

---

## ⚙️ Responsibilities

### 👁️ View

* Displays UI
* Sends user actions to Presenter
* No business logic

---

### 🧠 Presenter

* Handles UI logic
* Communicates with Interactor
* Updates View

---

### ⚙️ Interactor

* Business logic layer
* Fetches data from Service
* Sends results to Presenter

---

### 🔌 Service

* Handles API calls
* Uses NetworkManager

---

### 🧭 Router

* Handles navigation between screens

---

### 📦 Entity

* Data models (`User`)

---

## 🔌 Dependency Injection

Dependencies are injected via initializers:

```swift
init(service: UserServiceProtocol)
```

👉 Benefits:

* Loose coupling
* Easy testing

---

## 🧪 Unit Testing

Tested layers:

* ✅ Presenter (UI logic)
* ✅ Interactor (business logic)

### 🔹 Example

```swift
func test_viewDidLoad_callsInteractor() {
    presenter.viewDidLoad()
    XCTAssertTrue(mockInteractor.fetchCalled)
}
```

---

## 🔥 Key Features

* VIPER Architecture
* Dependency Injection
* Protocol-Oriented Design
* Unit Testing with Mocks
* Generic Network Layer

---

## 🚀 How to Run

1. Clone the repository
2. Open `.xcodeproj`
3. Run the app (⌘ + R)
4. Run tests (⌘ + U)

---

## 🧠 Why VIPER?

### ✅ Pros

* Highly testable
* Scalable architecture
* Clear separation of concerns

### ❌ Cons

* More boilerplate
* More files per feature

---

## ⚖️ MVVM vs VIPER

| Feature     | MVVM   | VIPER |
| ----------- | ------ | ----- |
| Complexity  | Low    | High  |
| Testability | Medium | High  |
| Scalability | Medium | High  |

---

## 🧠 Interview Note

> “VIPER improves modularity and testability by separating responsibilities, but I use it selectively for complex modules while preferring MVVM for simpler features.”

---

## 📌 Future Improvements

* Pagination
* Search feature
* User Detail module
* Caching layer

---

## 👨‍💻 Author

Anil Kumar
iOS Developer (7+ years experience)

---

## ⭐ If you like this project

Give it a star ⭐ and feel free to contribute!

