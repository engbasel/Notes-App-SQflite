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
    C --> C1[SQLhelper.dart]
    A --> D[l10n/]
    D --> D1[intl_ar.arb]
    D --> D2[intl_en.arb]
    A --> E[utils/]
    E --> E1[custom_snack_bar.dart]
    E --> E2[NoteItem.dart]
    E --> E3[NoteItemShimmer.dart]
    E --> E4[theme.dart]
    A --> F[views/]
    F --> G[Notes_views/]
    F --> H[splash_views/]
    G --> I[EditNoteScreen.dart]
    G --> J[HomeView.dart]
    G --> K[notesView.dart]
    A --> L[constant.dart]
    A --> M[main.dart]
