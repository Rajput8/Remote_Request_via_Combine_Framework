## RemoteRequestManager
 - Is an iOS application developed using Xcode that fetches information from the free RESTful API,
 - "Get All Countries." The project leverages `URLSession` in combination with the Combine framework to manage asynchronous network requests and handle data streams efficiently,
 - all without using any third-party libraries.

## Features

- Retrieve a comprehensive list of countries
- Display country names
- Utilize the Combine framework for reactive programming
- No external dependencies—purely native implementation

## Requirements

- iOS 14.0 or later
- Xcode 12.0 or later

## Getting Started

### Clone the Repository

To get started with the project, clone the repository:

- git clone https://github.com/Rajput8/Remote_Request_via_Combine_Framework.git
- cd Remote_Request_via_Combine_Framework

## Open the Project

+ Open the .xcodeproj file in Xcode:
- open Remote_Request_via_Combine_Framework.xcodeproj

## Build and Run

- Select a simulator or connect a physical device.
- Click the "Run" button in Xcode to build and launch the application.

## API Used

+ This application utilizes the following API to retrieve data:
- Get All Countries API: https://restcountries.com/v3.1/all

## How It Works
1. The app initiates a GET request to the API using URLSession.
2. Responses are processed using Combine publishers and subscribers.
3. The parsed country data is displayed in the user interface.

## Code Structure
- Models: Data models for parsing API responses.
- ViewModels: Implements business logic and handles data flow with Combine.
- Views: Contains SwiftUI views for the user interface.

## Contributing
- Contributions are welcome! Please feel free to submit issues or pull requests for improvements or additional features.

