-- 0002_channel_identity_avatar
-- Add avatar_url column to iam_channel_identities for sender profile display.
ALTER TABLE iam_channel_identities ADD COLUMN IF NOT EXISTS avatar_url TEXT;
