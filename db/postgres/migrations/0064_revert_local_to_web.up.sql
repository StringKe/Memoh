-- 0064_revert_local_to_web
-- Revert channel_type 'local' back to 'web' to match updated adapter constants.
-- The original 0056 migration merged web/cli → local; this undoes that change.

-- For iam_channel_identities with unique constraint on (channel_type, channel_subject_id):
-- delete 'local' rows that would conflict with existing 'web' rows, then update the rest.
DELETE FROM iam_channel_identities WHERE channel_type = 'local' AND channel_subject_id IN (
    SELECT channel_subject_id FROM iam_channel_identities WHERE channel_type = 'web'
);
UPDATE iam_channel_identities SET channel_type = 'web' WHERE channel_type = 'local';

-- These tables don't have the same unique constraint, safe to update directly.
UPDATE iam_user_channel_bindings SET channel_type = 'web' WHERE channel_type = 'local';
UPDATE bot_channel_configs SET channel_type = 'web' WHERE channel_type = 'local';
UPDATE iam_channel_identity_bind_codes SET channel_type = 'web' WHERE channel_type = 'local';
UPDATE bot_channel_routes SET channel_type = 'web' WHERE channel_type = 'local';
UPDATE bot_sessions SET channel_type = 'web' WHERE channel_type = 'local';
