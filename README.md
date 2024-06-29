# Flutter Notes App

A simple notes application built using Flutter and SQLite.

## Features

- Add, edit, and delete notes
- Persistent storage using SQLite
- Responsive UI

## Project Structure

```mermaid
graph TD;
    A[Project Root] --> B[generated/]
    A --> C[helper/]
    A --> D[l10n/]
    A --> E[utils/]
    A --> F[views/]
    F --> G[Notes_views/]
    F --> H[splash_views/]
    G --> I[EditNoteScreen.dart]
    G --> J[HomeView.dart]
    G --> K[notesView.dart]
    A --> L[constant.dart]
    A --> M[main.dart]
