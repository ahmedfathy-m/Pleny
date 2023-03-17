# Pleny
![Pleny](https://i.imgur.com/1GQvXYa.jpg)

A demo application for Pleny (Qurba)

## Features
- View posts and images in a paginated manner.
- Ability to save a post locally using CoreData.
- Live search for posts.

## Technologies Used
- User interface built with **SwiftUI**.
- Presentation Layer with **MVVM-C**.
- Clean Archeticture.
- **Repository Pattern** to handle data layer with UseCase objects for domain layer.
- Local Data Persistence using **CoreData**.
- Reactive Programming Using **Combine**.
- Networking is done, natively using **URLSession**.
- Support for **iOS 15.0+**.
- No third-party libraries were used.

## Clean Archeticture
- Presentation Layer: View, ViewModel, Components
- Domain Layer: UseCases, Repository Protocols
- Data Layer: Repository Objects, Remote & Local Datasources, Data Model
