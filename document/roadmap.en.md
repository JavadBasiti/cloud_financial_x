# Cloud Financial X Development Roadmap

This roadmap describes the recommended phases for evolving the project into a mature cloud financial system.

## Phase 1: Stabilize the local core and data model

Goal: Ensure local data integrity and domain model stability.

- Complete and review existing Drift tables
- Validate Journal and JournalRow relationships
- Add support for currencyCode and financial base in accounting models
- Strengthen repositories for atomic transaction handling
- Add base unit tests for repositories and mappers

## Phase 2: Implement Sync Queue and synchronization infrastructure

Goal: Prepare the outbox pattern for reliable sync.

- Confirm the SyncQueue Drift schema
- Extend SyncQueueRepository to manage states and failures
- Implement batch processing for pending sync records
- Add logging and metrics for sync operations
- Design the server API model for receiving sync records

## Phase 3: Develop the smart data intake layer

Goal: Build a new input path from image, audio, and text.

- Define a Draft/Event model for extracted data
- Implement UI for image and audio intake
- Add OCR service locally or via backend
- Add Speech-to-Text service for audio files
- Implement entity extraction via NLP/NER
- Build Draft Event storage and processing
- Add a review/approval step before final registration

## Phase 4: Integrate Smart Intake with core accounting flow

Goal: Convert approved drafts into real accounting transactions.

- Map Drafts to Journal/JournalRow or Invoice entities
- Register data and enqueue SyncQueue simultaneously
- Ensure currency/base consistency in transformation
- Implement double-entry balancing rules
- Test the complete create/edit workflow

## Phase 5: Build the Java/Spring Boot backend

Goal: Provide a robust processing and API service.

- Set up Spring Boot project with modules:
  - Auth
  - Draft Intake
  - Processing
  - Sync
- Define REST APIs for draft intake, registration, and sync status
- Add Spring Security + JWT
- Implement persistence in PostgreSQL or MySQL
- Architect messaging with RabbitMQ or Kafka

## Phase 6: Add advanced multi-currency and financial base support

Goal: Complete accounting for multiple currencies and bases.

- Define currency fields in Journal and JournalRow models
- Add exchange rate entities with effective dates
- Implement automatic currency conversion for reports
- Provide multi-currency reporting and base-specific views
- Add currency/base settings in the UI

## Phase 7: Reporting and business modules

Goal: Complete financial reporting and commercial workflows.

- Build financial dashboard and liquidity views
- Add accounting document reports
- Add cost and cost center reports
- Complete the sales invoice module
- Lay the foundation for inventory and payroll modules

## Phase 8: Production readiness

Goal: Prepare the project for release and maintainability.

- Fix bugs and improve stability
- Write unit and integration tests
- Document API and architecture
- Prepare a production-ready release
- Review security and performance considerations

## Recommended priorities
1. Stabilize database and domain models
2. Implement the sync queue and outbox
3. Build the smart intake draft layer
4. Connect draft intake to accounting logic
5. Develop the Spring Boot backend
6. Fully support multi-currency accounting
7. Complete reporting and business modules
8. Test and prepare for production
