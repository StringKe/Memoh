-- 0064_revert_local_to_web (rollback)
-- Re-apply the 'local' convention by converting 'web' back to 'local'.

UPDATE iam_channel_identities SET channel_type = 'local' WHERE channel_type = 'web';
UPDATE iam_user_channel_bindings SET channel_type = 'local' WHERE channel_type = 'web';
UPDATE bot_channel_configs SET channel_type = 'local' WHERE channel_type = 'web';
UPDATE iam_channel_identity_bind_codes SET channel_type = 'local' WHERE channel_type = 'web';
UPDATE bot_channel_routes SET channel_type = 'local' WHERE channel_type = 'web';
UPDATE bot_sessions SET channel_type = 'local' WHERE channel_type = 'web';
