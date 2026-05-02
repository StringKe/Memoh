-- 0044_user_timezone
-- Add a timezone column to iam_users for user-level timezone preferences.

ALTER TABLE iam_users ADD COLUMN IF NOT EXISTS timezone TEXT NOT NULL DEFAULT 'UTC';
