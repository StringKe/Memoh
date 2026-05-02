-- 0002_channel_identity_avatar (down)
ALTER TABLE iam_channel_identities DROP COLUMN IF EXISTS avatar_url;
