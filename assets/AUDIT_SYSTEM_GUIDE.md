# 🔍 Audit System Guide

## Overview

The College V4 database includes a comprehensive **audit system** to track all changes to critical tables. This system automatically captures:
- **Who** made the change (database user)
- **What** changed (old and new values)
- **When** it changed (exact timestamp)
- **Why** it changed (action type: INSERT, UPDATE, DELETE)

---

## Audit Tables

### enrollment_audit
Tracks all changes to student enrollment records.

| Column | Type | Description |
|--------|------|-------------|
| `enrollment_audit_id` | INT | Primary key |
| `enrollment_id` | INT | Reference to enrollment record |
| `action` | VARCHAR(50) | INSERT, UPDATE, or DELETE |
| `old_enrollment_status` | VARCHAR(255) | Previous status (Active, Completed, Withdrawn) |
| `new_enrollment_status` | VARCHAR(255) | New status |
| `old_lookup_grade_id` | INT | Previous grade ID |
| `new_lookup_grade_id` | INT | New grade ID |
| `changed_by` | VARCHAR(50) | Database username (e.g., dejohns2) |
| `changed_at` | TIMESTAMP | When the change occurred |

**Query Example:**
```sql
-- View all status changes for a specific enrollment
SELECT * FROM enrollment_audit 
WHERE enrollment_id = 5 AND action = 'UPDATE'
ORDER BY changed_at DESC;
```

---

### course_audit
Tracks course modifications (name, credit hours).

| Column | Type | Description |
|--------|------|-------------|
| `course_audit_id` | INT | Primary key |
| `course_id` | INT | Reference to course record |
| `action` | VARCHAR(50) | INSERT, UPDATE, or DELETE |
| `old_course_name` | VARCHAR(255) | Previous course name |
| `new_course_name` | VARCHAR(255) | New course name |
| `old_course_credit_hours` | INT | Previous credit hours |
| `new_course_credit_hours` | INT | New credit hours |
| `changed_by` | VARCHAR(50) | Database username |
| `changed_at` | TIMESTAMP | When the change occurred |

**Query Example:**
```sql
-- View all changes made by a specific user
SELECT * FROM course_audit 
WHERE changed_by = 'dejohns2'
ORDER BY changed_at DESC;
```

---

### student_audit
Tracks changes to student admission and graduation dates.

| Column | Type | Description |
|--------|------|-------------|
| `student_audit_id` | INT | Primary key |
| `student_id` | INT | Reference to student record |
| `action` | VARCHAR(50) | INSERT, UPDATE, or DELETE |
| `old_admission_date` | DATE | Previous admission date |
| `new_admission_date` | DATE | New admission date |
| `old_graduation_date` | DATE | Previous graduation date |
| `new_graduation_date` | DATE | New graduation date |
| `changed_by` | VARCHAR(50) | Database username |
| `changed_at` | TIMESTAMP | When the change occurred |

---

### user_audit
Tracks changes to user profiles, system IDs, and campus emails.

| Column | Type | Description |
|--------|------|-------------|
| `user_audit_id` | INT | Primary key |
| `user_id` | INT | Reference to user record |
| `action` | VARCHAR(50) | INSERT, UPDATE, or DELETE |
| `old_fname` | VARCHAR(255) | Previous first name |
| `new_fname` | VARCHAR(255) | New first name |
| `old_lname` | VARCHAR(255) | Previous last name |
| `new_lname` | VARCHAR(255) | New last name |
| `old_system_userid` | VARCHAR(50) | Previous system user ID |
| `new_system_userid` | VARCHAR(50) | New system user ID |
| `old_campus_email` | VARCHAR(100) | Previous campus email |
| `new_campus_email` | VARCHAR(100) | New campus email |
| `changed_by` | VARCHAR(50) | Database username |
| `changed_at` | TIMESTAMP | When the change occurred |

---

## How It Works

### Automatic User Tracking

When you insert or update data, the system automatically captures the current database user:

```sql
-- The trigger extracts the username from CURRENT_USER()
-- Example: dejohns2@localhost → dejohns2
SUBSTRING_INDEX(CURRENT_USER(), '@', 1)
```

### Timestamp Recording

All timestamps use MySQL's automatic functions:
- **DEFAULT current_timestamp()** – Set automatically on INSERT
- **ON UPDATE current_timestamp()** – Updated automatically on UPDATE

### Change Logging

Triggers capture three types of operations:

#### INSERT Trigger
Logs when a new record is created:
```
Action: INSERT
Old Values: NULL (new record)
New Values: All inserted values
```

#### UPDATE Trigger
Logs when an existing record is modified:
```
Action: UPDATE
Old Values: Previous values
New Values: New values
```

#### DELETE Trigger
Logs when a record is deleted:
```
Action: DELETE
Old Values: All deleted values
New Values: NULL (record removed)
```

---

## System User ID and Campus Email Generation

### How It Works

The `user` table automatically generates two fields:

| Field | Format | Example |
|-------|--------|---------|
| `system_userid` | First 2 letters of first name + up to 5 letters of last name | `dejohns2` from **de**nice **johns**on |
| `campus_email` | `{system_userid}@wsc.edu` | `dejohns2@wsc.edu` |

### Uniqueness Handling

If a system ID already exists, the system appends a counter:
- First `dejohns` already exists → use `dejohns1`
- `dejohns1` already exists → use `dejohns2`
- And so on...

### Automatic Regeneration

When a user's name changes, both fields regenerate automatically:

```sql
INSERT INTO user (user_fname, user_lname) 
VALUES ('Denice', 'Johnson');
-- system_userid: dejohns
-- campus_email: dejohns@wsc.edu

UPDATE user SET user_fname = 'Dennis' 
WHERE user_id = 1;
-- system_userid: REGENERATED to denjon (Dennis + Johnson)
-- campus_email: REGENERATED to denjon@wsc.edu
```

---

## Triggers Reference

### Current Implementation

**Enrollment Audit System** (Fully Implemented)
The enrollment table includes three AFTER triggers that automatically log all INSERT, UPDATE, and DELETE operations to the `enrollment_audit` table. These triggers capture:
- The user making the change (via CURRENT_USER())
- The action type (INSERT, UPDATE, DELETE)
- Before and after values for status and grades
- Precise timestamps

| Trigger | Type | Action |
|---------|------|--------|
| `trg_enrollment_after_insert` | AFTER INSERT | Logs INSERT to enrollment_audit with new status and grades |
| `trg_enrollment_after_update` | AFTER UPDATE | Logs UPDATE to enrollment_audit capturing before/after status and grades |
| `trg_enrollment_after_delete` | AFTER DELETE | Logs DELETE to enrollment_audit with final status and grades |

**User System ID and Campus Email** (Fully Implemented)
The user table includes a BEFORE INSERT trigger that automatically generates system_userid and campus_email based on user names:
- system_userid: First 2 letters of first name + up to 5 letters of last name
- campus_email: {system_userid}@wsc.edu
- Automatic uniqueness handling with numeric suffixes for duplicates

---

## Monthly Purge Events

The system automatically cleans up old audit records every month using scheduled events:

| Event Name | Schedule | Action |
|------------|----------|--------|
| `evt_truncate_enrollment_audit_monthly` | 1st of each month at 02:00 UTC | Deletes enrollment_audit records older than 30 days |

### View Scheduled Events

```sql
-- List all events
SHOW EVENTS;

-- View a specific event
SHOW CREATE EVENT truncate_enrollment_audit_monthly;
```

### Disable an Event Temporarily

```sql
ALTER EVENT truncate_enrollment_audit_monthly DISABLE;
```

### Enable an Event

```sql
ALTER EVENT truncate_enrollment_audit_monthly ENABLE;
```

---

## Common Queries

### Find All Changes to an Enrollment

```sql
SELECT * FROM enrollment_audit 
WHERE enrollment_id = 5
ORDER BY changed_at DESC;
```

### Track Changes by User

```sql
SELECT 
    changed_by,
    COUNT(*) as total_changes,
    MIN(changed_at) as first_change,
    MAX(changed_at) as last_change
FROM enrollment_audit
GROUP BY changed_by
ORDER BY total_changes DESC;
```

### Find Recent Changes

```sql
SELECT * FROM enrollment_audit
WHERE changed_at > DATE_SUB(NOW(), INTERVAL 7 DAY)
ORDER BY changed_at DESC;
```

### Compare Old vs New Values

```sql
SELECT 
    enrollment_audit_id,
    enrollment_id,
    action,
    old_enrollment_status,
    new_enrollment_status,
    changed_by,
    changed_at
FROM enrollment_audit
WHERE enrollment_id = 5 AND action = 'UPDATE'
ORDER BY changed_at DESC;
```

### Find Grade Changes

```sql
SELECT 
    enrollment_id,
    old_lookup_grade_id,
    new_lookup_grade_id,
    changed_by,
    changed_at
FROM enrollment_audit
WHERE action = 'UPDATE' 
  AND old_lookup_grade_id != new_lookup_grade_id
ORDER BY changed_at DESC;
```

---

## Best Practices

1. **Regular Monitoring**: Check audit tables weekly for unexpected changes
2. **User Accountability**: Use the `changed_by` field to track responsibility
3. **Backup Strategy**: Keep audit records for compliance and historical analysis
4. **Query Performance**: Index `changed_at` for faster historical queries
5. **Privacy**: Restrict access to audit tables to authorized personnel only

---

## Compliance and Documentation

The audit system supports compliance requirements by providing:
- **Complete audit trail** of all data modifications
- **Timestamped records** with precise change tracking
- **User attribution** to track who made changes
- **Change history** for regulatory reporting
- **Data recovery** capability through before/after values

---

## Troubleshooting

### Trigger Not Firing?

Check if triggers are enabled:
```sql
-- View all triggers
SHOW TRIGGERS;

-- Check trigger status
SHOW CREATE TRIGGER enrollment_after_insert;
```

### Events Not Running?

Enable the event scheduler:
```sql
SET GLOBAL event_scheduler = ON;

-- Verify it's running
SHOW PROCESSLIST;
```

### Audit Records Not Appearing?

1. Verify the trigger exists
2. Check that changes are being made (not just viewing data)
3. Confirm the condition in UPDATE triggers is met (if comparing old/new values)
4. Check database user permissions

---

For questions or issues, contact the database administrator.
