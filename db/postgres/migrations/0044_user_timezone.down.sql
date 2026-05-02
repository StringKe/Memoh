-- 0044_user_timezone
-- Remove the timezone column from iam_users.

ALTER TABLE iam_users DROP COLUMN IF EXISTS timezone;
