# budget_tracker

A simple example of a Budget Tracker app.

## Time-to-build

Whole project took 3h of coding and around 20mins of tightening up GitHub, creating this README etc.

I've used Coopilot while creating this app - mainly on UI part to save some time.

## Features

- dark mode
- filtering by record type
- adding expenses as well as income,
- form validation,
- expenses chart,
- deleting records (swipe).

## Architecture decisions

**Clean Architecture** with four layers: Presentation (UI + Cubits), Domain (Entities), Data (Repositories), and Application (DI + Services).

## Key Decisions

- **State Management**: BLoC/Cubit pattern with Freezed for immutable states
- **Database**: Drift (SQLite) for local-first storage
- **DI**: GetIt service locator for singleton management
- **Error Handling**: DataState pattern (sealed classes for success/failure)
- **Code Generation**: build_runner for Drift, Freezed, JSON, and i18n
- **Theme**: Material 3 with persistent dark/light mode via SharedPreferences
- **Data Integrity**: Amounts stored as cents to avoid floating-point issues

## Trade-offs

I didn’t make major trade-offs, although the UI/UX was put together quickly.

## Possible improvements

I would improve the UI/UX and add the ability to edit records. Additionally, I would organize the UI layer in the code a bit better. Using go_router would be beneficial for a more scalable app, although it wasn’t necessary at this stage. Writing tests would also be on the list, but for now I don’t consider them essential.

## Starting the app

App was built and tested using Flutter 3.41.1

## Generating locales

flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart --source-dir ./assets/translations
