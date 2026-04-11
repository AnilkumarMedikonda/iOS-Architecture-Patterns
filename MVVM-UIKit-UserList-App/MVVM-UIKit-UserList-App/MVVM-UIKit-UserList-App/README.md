//
//  README.swift
//  MVVM-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 11/04/26.
//


# 📌 MVVM UIKit User List App

A clean and scalable iOS sample project demonstrating **MVVM architecture**, **Dependency Injection**, and **Unit & UI Testing** using UIKit.

---

## 📱 Overview

This project showcases how to build a maintainable iOS application using:

* MVVM (Model-View-ViewModel)
* Protocol-Oriented Programming
* Dependency Injection (DI)
* Generic Networking Layer
* Unit Testing & UI Testing

---

## 🧱 Architecture

The app follows a clean **MVVM architecture**:

ViewController → ViewModel → Service → Network Layer

* **ViewController (View)**
  Handles UI rendering and user interaction only

* **ViewModel**
  Manages presentation logic, state, and data transformation

* **Service Layer**
  Abstracts API/business logic

* **Network Layer**
  Handles API requests and generic decoding

---

## 🚀 Features

* Fetch user data from API
* Display users in UITableView
* MVVM-based clean separation
* Generic and reusable networking layer
* Custom error handling
* Dependency Injection (DI)
* Unit testing with mocks
* UI testing using XCTest
* Accessibility identifiers for stable UI tests

---

## 🛠 Tech Stack

* Swift
* UIKit
* URLSession
* XCTest (Unit & UI Testing)

---

## 📂 Project Structure

MVVM-UIKit-UserList-App/

* Application/
* Model/
* View/
* ViewModel/
* Services/
* Network/
* Resources/
* Tests/
* UITests/

---

## 🔄 Data Flow

1. ViewController triggers ViewModel
2. ViewModel calls Service
3. Service interacts with Network layer
4. Data is returned → ViewModel processes
5. ViewModel updates View via bindings (closures)

---

## 🧪 Testing

### Unit Tests

* UserViewModelTests
* MockNetworkManager for API mocking

### UI Tests

* TableView existence
* Cell rendering
* Content validation
* Scroll & interaction testing

---

## 🎯 Key Highlights

* Protocol-based Dependency Injection
* Generic Decodable Networking
* Main-thread safe UI updates
* Testable architecture
* Stable UI tests using accessibility identifiers

---

## 🚀 Future Improvements

* Async/Await Networking
* Combine / Reactive bindings
* Pagination (infinite scroll)
* Offline caching
* Clean Architecture migration

---

## 👨‍💻 Author

**Anil Kumar**
