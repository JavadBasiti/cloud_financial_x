# Accounting Journal - Full CRUD Use Case

This document describes the implementation of the "create and modify double-entry journal" use case.

## 1) Final page

- File: `lib/ui/journal/compound_document_page.dart` (`CompoundDocumentPage`)
- Journal row dialog: `lib/ui/journal/journal_row_dialog.dart`
- Route: `/compound-document`

The previous design-only screen (`lib/screens/compound_document_screen.dart`, backed by mock data)
was removed and rebuilt inside the `ui` layer, consistent with `ProductsPage` and `AccountStructurePage`.

## 2) Layer chain

```
CompoundDocumentPage
  ├── JournalFormController      (validates and builds Journal)
  ├── JournalRowFormController   (validates and builds JournalRow)
  └── JournalService             (domain rules: balance, numbering, persistence prep)
        └── JournalRepository    (atomic Drift transaction + SyncQueue enqueue)
```

## 3) Input fields (aligned with the domain layer)

### Journal
`referenceNumber` (auto when empty), `date` (Jalali display, epoch millis storage),
`description` (required, max 400), `currencyCode` (IRR/USD/EUR/AED/BTC/USDT),
`isAuto`, `signed`.

### JournalRow
`hesabId` (from `HesabService`), `prBed`/`prBest` (side + amount),
`costCenterId` (optional, from `CostCenterService`), `descRow` (max 255), `media`,
`currencyCode`, `isAuto`. The contextual fields `journalId`, `noSnd`, `date` and `rowF`
are derived from the parent journal at save time.

## 4) Double-entry rules (in `JournalService`)

- A journal needs at least two rows.
- A row is either debit or credit, never both and never zero.
- Total debit must equal total credit (`JournalBalance.isBalanced`).
- Row currency must match the journal currency.
- Violations throw `JournalValidationException`, which the UI surfaces to the user.

## 5) Supported operations

| Operation | Service method | Data behaviour |
|---|---|---|
| Create journal + rows | `saveJournalWithRows(mode: create)` | Single transaction insert + SyncQueue enqueue |
| Update journal + rows | `saveJournalWithRows(mode: edit)` | Automatically splits inserted/updated/deleted rows |
| Delete journal | `deleteJournal` | Soft-deletes the journal and all of its rows |
| Sign / unsign | `setSigned` | Signed journals cannot be edited or deleted |
| Next document number | `nextReferenceNumber` | max(referenceNumber) + 1 (local-first) |

## 6) Notes and follow-ups

- Jalali dates are computed by the internal helper `lib/ui/common/format_utils.dart` (no extra package).
  Date selection still uses the Gregorian `showDatePicker`; the selected value is displayed as Jalali.
- Cost center is optional and stored as an empty string when not selected. If `PRAGMA foreign_keys`
  is enabled later, this field should become nullable.
- Unit tests: `test/journal_service_test.dart` and `test/format_utils_test.dart`
