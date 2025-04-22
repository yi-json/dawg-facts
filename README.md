# Dawg Facts

Dawg Facts is a simple iOS app built with SwiftUI that fetches fun facts about dogs using the [Dog API by Kinduff](https://dogapi.dog). Users can input how many dog facts they want to see (up to 10) and get them instantly!

---

## Demo

<p align="center">
  <img src="assets/dawg_facts.gif" alt="App Recording" width="250">
</p>


---

| Home Screen                         | Dog Facts List                     |
|------------------------------------|------------------------------------|
| ![HomeView](assets/home.png)  | ![FactsView](assets/facts.png)|
---

## Description

- **Title:** Dawg Facts  
- **Purpose:** Teach users cool dog facts using an intuitive UI and clean API integration.  
- **Tools Used:**
  - SwiftUI
  - [Dog API by Kinduff](https://dogapi.dog)

---

## Features

- User input (TextField) to request 1–10 dog facts
- Real-time fetch using `@Binding` and `@ObservedObject`
- Dog image displayed at the top of the home screen
- Graceful input validation (disables button with a warning for invalid input)
- Clean navigation using `NavigationStack`

---

## Challenges + Future Plans

### Obstacles
- The Dog API would only return up to 5 facts, so I had to tweak `DogFactService.swift` file such that it would make up to 2 API calls in ase the user asks for 5 < x <= 10 facts
- Had to work around deprecated `.onChange()` modifiers
- Managing `@Binding` and `@State` correctly through navigation took tweaking
- Learned about the `@Published` property wrapper in Swift, which is used inside an `ObservableObject` class to mark properties that should notify SwiftUI views when their values change.
    * Basically "Hey SwiftUI, keep an eye on these properties. If they change, re-render any views that depend on them."

### Future Additions
- Add breed information or group filtering
- Favorite facts or share functionality
- Dark mode support
- Add more structure by using well-known design pattern, such as MVVM

---

## How to Run

1. Clone the repo
2. Open `dawg-facts.xcodeproj` in Xcode 15+
3. Run on simulator or device
4. Enjoy some 🐶 wisdom

