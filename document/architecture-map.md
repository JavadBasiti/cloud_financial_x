# Architecture Map

## Main Entry Points
- lib/main.dart
- lib/screens/dashboard_screen.dart
- lib/data/drift/app_database.dart

## Core Flow
1. App starts in lib/main.dart
2. Local database is initialized with Drift
3. Repositories are created
4. UI screens interact with repositories
5. Changes are stored locally and queued for sync
6. Smart intake can capture data from image, audio, or text and create unsigned draft events before final registration
7. Accounting workflows support different financial bases and currencies, including fiat, digital assets, and other monetary units

## Key Folders
- lib/screens: feature screens
- lib/ui: reusable UI and forms
- lib/widgets: app shell and shared widgets
- lib/data/repository: business/data access coordination
- lib/data/drift: database schema and tables
- lib/data/mapper: domain-to-database mapping
- lib/domain: core business models and sync abstractions
