# Cloud Financial X Developer Guide

This guide is a precise developer reference for continuing, modifying, or extending the Cloud Financial X project.

## 1) Purpose of this guide

This document is intended to help developers quickly understand the project structure, main data flows, entry points, and implementation best practices.

## 2) Project architecture overview

The project is designed as a layered, local-first architecture:

- Presentation Layer: app screens and UI
- Repository Layer: data coordination and sync queue handling
- Domain Layer: business models and sync contracts
- Data Layer: local Drift database and mappers
- Smart Intake Layer: input processing from image/audio/text
- Cloud Sync Layer: future synchronization to server
- Backend Layer: Java/Spring Boot service for processing and APIs

## 3) Folder structure

### lib/main.dart
The main application entry point. In this file:
- AppDatabase is initialized
- Repositories are constructed
- Providers are registered
- GoRouter is configured

### lib/data/drift
Contains Drift table definitions and database setup:
- app_database.dart: AppDatabase definition and migration strategy
- product_table.dart
- sync_queue_table.dart
- hesab_table.dart
- journal_table.dart
- journal_row_table.dart
- cost_center_table.dart

### lib/data/repository
Coordinates between data persistence and domain logic, ensuring every change is tracked for sync:
- ProductRepository
- HesabRepository
- JournalRepository (includes JournalRow behavior)
- CostCenterRepository
- SyncQueueRepository

### lib/data/mapper
Handles conversion between Drift data models and domain models.

### lib/domain
Contains the core business models and sync contracts:
- Freezed models for Product, Hesab, Journal, JournalRow, CostCenter
- SyncEntity: shared interface for syncable entities
- SyncQueueRecord: sync queue model
- ConflictResolutionService: conflict resolution rules

### lib/screens and lib/ui
Contains pages and UI components. Key files include:
- dashboard_screen.dart
- login_screen.dart
- product_structure_screen.dart
- account_structure_screen.dart
- sale_invoice_screen.dart
- settings_screen.dart

### lib/widgets
Contains app shell and shared UI widgets, such as AppLayout.

## 4) Main data flow

### 4.1 Recording a change
1. The user enters data or the smart intake layer produces a draft.
2. The relevant screen sends data to the repository.
3. The repository writes the change to the local database.
4. In the same transaction, a record is inserted into the SyncQueue.
5. When network connectivity is available, these records are sent to the server.

### 4.2 Sync workflow
- SyncQueueRepository manages the sync queue.
- Records remain in Pending state until synced.
- On success, records are removed or updated.
- On failure, retry count and last error are stored.

## 5) Support for multiple financial bases and currencies

The project is designed to support multiple financial bases. For each journal and journal row:
- currency or financial base must be stored.
- version and timestamp fields must support conflict resolution.
- models should support fiat, crypto, and other financial units.

### Recommended model design
- Add currencyCode to Journal and JournalRow
- Store exchange rate metadata when needed for reporting
- Maintain the financial base when recording transactions

## 6) Smart data intake layer

### Purpose
This layer converts raw inputs (image, audio, text) into draft events that can be reviewed and approved.

### Components
- Ingestion Adapter: normalize input from app UI or bot webhook
- OCR: extract text from images
- Speech-to-Text: convert audio to text
- NLP/NER: extract names, amounts, dates, accounts, products, and counterparties
- Draft Builder: create initial unconfirmed events
- Validation: data quality and confidence scoring
- Approval: user review before final registration in repositories

## 7) Backend recommendation

Given the Java/Spring Boot background, the backend should be built on that stack.

### Suggested backend architecture
- Spring Boot service for APIs and processing
- Spring Security + JWT for authentication
- PostgreSQL or MySQL for server data storage
- RabbitMQ or Kafka for asynchronous processing
- Main backend modules:
  - Draft Intake Service
  - OCR/Speech Processing API
  - Entity Extraction Service
  - Validation/Enrichment Service
  - Sync/Audit Service

## 8) Development entry points

### Fast entry path
1. lib/main.dart
2. lib/data/drift/app_database.dart
3. lib/data/repository/sync_queue_repository.dart
4. lib/data/repository/product_repository.dart
5. lib/domain/sync_entity.dart
6. lib/screens/product_structure_screen.dart
7. lib/screens/account_structure_screen.dart

### Adding a new capability
1. Define or extend the domain model in lib/domain.
2. Expand mappers in lib/data/mapper.
3. Add new table/field in lib/data/drift if needed.
4. Update the repository to support the new behavior.
5. Add UI in lib/screens or lib/ui.
6. Extend SyncQueue if the change requires synchronization.

## 9) Coding standards

- Use Freezed for immutable domain models.
- Every data mutation should be wrapped in a transaction with sync enqueue.
- Prefer soft delete instead of hard deletion.
- Validate user input before persistence.
- Name files and classes according to entity responsibility.

## 10) Important references

- lib/constants/app_constants.dart
- lib/data/drift/app_database.dart
- lib/data/repository/sync_queue_repository.dart
- lib/domain/sync_queue_record.dart
- lib/domain/sync_entity.dart

## 11) Final note

The project provides a robust local-first foundation for a cloud financial system. Future development should prioritize domain and data layer changes first, then connect those changes to UI and backend integration.
