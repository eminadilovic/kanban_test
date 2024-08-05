# Kanban Board App TEST

This is a simple **Drag and Drop Kanban Board** with three columns: **To Do**, **In Progress**, and **Done**. Users can add new tasks and move them between columns. Additional features include viewing the history of completed tasks, detailed task views with start and completion times, and an active task timer. The app also supports theme switching between dark and light modes.

## Video Demonstration

[Watch the Kanban Board Video on Vimeo](https://vimeo.com/994855614)

## APK Download

You can download the latest APK from Codemagic [here](https://api.codemagic.io/artifacts/.eJwVwceOgkAAANB_8U4y1IGDB8rCIHWI1AtZBFl6EQfk682-d6nlf8rwUjLWHO8fqT5-Fcy2Fsxdecsq4oNyp6zUEAJnZvPPOfVFWJj26pkpF4M2VuHpy-6tCN6009Frz29a3DBkDiZVphruQJBQYbSkzEOI9TkTn0TJN0HPQEnzbQamk0k8u7DmkiBHXXJ8CyUF4U7kUaBDeNPdrnmOu-sPAY17A3ORdKC_t1aAntKsZNnhoMRll6NT8Ned055lEuBtUA_Er_5CJVMtGimpWHVpcFoaQmUzI3m191U0mbD2uk6XkwfxwBDZOI0ooK3FMebv7Zy5kLzMnwRfr5cvj-9hZA.NMaVHGrVNUx0uul1PnBACmj4P9Y).

## Features

- **Drag and Drop Kanban Board**: Organize tasks in three columns: To Do, In Progress, and Done.
- **Add New Tasks**: Easily add new tasks to the board.
- **Move Tasks**: Drag and drop tasks between columns.
- **Task History**: View the history of completed tasks.
- **Task Details**: See detailed information about each task, including duration and completion dates.
- **Task Timer**: Active tasks have a timer option.
- **Theme Switching**: Switch between dark and light themes.

## Tech Stack

- **Flutter**: 3.20.0
- **Xcode**: 15
- **Clean Architecture**: Maintains separation of concerns.
- **State Management**: BLoC (Business Logic Component)
- **JSON Serialization**: freezed, json_serializable
- **Analytics**: Amplitude
- **CI/CD**: Codemagic
- **Notifications**: flutter_local_notifications
- **Kanban Board**: appflowy_board (third-party tool)
- **Routing**: go_router
- **Dependency Injection**: get_it
- **Loading States**: shimmer
- **Local Storage**: hive
- **Localization**: easy_localization
- **API Interaction**: dio
- **Testing**: mockito

## Installation

### Prerequisites

- Flutter SDK 3.20.0
- Xcode 15 (for iOS builds)
- A valid Amplitude API key and TODOIST API key stored in a `.env` file

### Steps

1. **Clone the Repository**:

   ```bash
   git clone
   ```

2. **Install Dependencies**:

   ```bash
   flutter pub get
   ```

3. **Set Up Environment Variables**:

   - Create a `.env` file in the root of the project.
   - Add your Amplitude API key and TODOIST API KEY to the `.env` file

4. **Run the App**:
   ```bash
   flutter run
   ```

## Usage

1. **Add New Task**: Click on the '+' or 'New Task' buttons to create a new task.
2. **Move Task**: Drag and drop tasks between the columns (To Do, In Progress, Done).
3. **View Task History**: Navigate to the Completed Tasks screen to see the history of completed tasks.
4. **View Task Details**: Click on a task to see its details, including start and completion times.
5. **Task Timer**: Use the timer option for active tasks.
6. **Switch Theme**: Toggle between dark and light themes using the theme switcher.

## Additional Information

- **Localization**: The app uses easy_localization for internationalization. To add more languages, update the JSON files in the `assets/translations` directory and the `supportedLocales` list in `main.dart`.
- **Testing**: The app uses mockito for unit testing. Test files are located in the `test` directory.

## Dependencies

- **Flutter SDK**: [Flutter](https://flutter.dev/)
- **Amplitude**: [Amplitude](https://amplitude.com/)
- **flutter_local_notifications**: [Flutter Local Notifications](https://pub.dev/packages/flutter_local_notifications)
- **appflowy_board**: [AppFlowy Board](https://pub.dev/packages/appflowy_board)
- **go_router**: [go_router](https://pub.dev/packages/go_router)
- **get_it**: [get_it](https://pub.dev/packages/get_it)
- **shimmer**: [shimmer](https://pub.dev/packages/shimmer)
- **hive**: [hive](https://pub.dev/packages/hive)
- **easy_localization**: [easy_localization](https://pub.dev/packages/easy_localization)
- **dio**: [dio](https://pub.dev/packages/dio)
- **mockito**: [mockito](https://pub.dev/packages/mockito)
