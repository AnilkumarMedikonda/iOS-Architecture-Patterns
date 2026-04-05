//
//  README.swift
//  MVC-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 06/04/26.
//

# 📌 MVC UIKit User List App

A clean and scalable iOS sample project demonstrating **MVC architecture**, **Dependency Injection**, and **Unit Testing** using UIKit.

---

## 📱 Overview

This project showcases how to build a maintainable iOS application using:

* MVC (Model-View-Controller)
* Protocol-Oriented Programming
* Dependency Injection (DI)
* Generic Networking Layer
* Unit & UI Logic Testing

---

## 🧱 Architecture

The app follows a clean **MVC architecture**:

Controller → Service → Network Layer

* **Controller**: Handles UI & user interaction
* **Service**: Business logic and API abstraction
* **Network Layer**: Generic API handling using protocols

---

## 🚀 Features

* Fetch user data from API
* Display users using UITableView
* Generic and reusable network layer
* Custom error handling
* Protocol-based dependency injection
* Unit testing with mock network layer
* ViewController testing (UI logic)

---

## 🛠 Tech Stack

* Swift
* UIKit
* URLSession
* XCTest

---

## 📂 Project Structure

MVC-UIKit-UserList-App/

* Application/
* Model/
* Controller/
* Services/
* Resources/
* Tests/

---

## 🧪 Testing

This project includes comprehensive test coverage:

* **MockNetworkManager** for API mocking
* **UserServiceTests**

  * Success case
  * Failure case
  * Empty response
* **UserListViewControllerTests**

  * TableView data validation
  * Cell configuration testing

---

## 🎯 Key Highlights

* Protocol-based Dependency Injection
* Generic Decodable networking layer
* Clean separation of concerns
* Testable architecture
* Scalable project structure

---

## 🚀 Future Improvements

* MVVM Architecture
* Async/Await Networking
* Custom UITableViewCell UI
* Pagination support
* Caching layer

---

## 👨‍💻 Author

**Anil Kumar**
