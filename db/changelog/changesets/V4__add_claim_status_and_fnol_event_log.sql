-- Add 'status' column only if it doesn't already exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name='claims' AND column_name='status'
  ) THEN
    ALTER TABLE claims ADD COLUMN status VARCHAR(50) DEFAULT 'Open';
  END IF;
END $$;

-- Create 'fnol_event_log' table only if it doesn't exist
CREATE TABLE IF NOT EXISTS fnol_event_log (
  id SERIAL PRIMARY KEY,
  claim_id UUID NOT NULL,
  event_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  event_source VARCHAR(100),
  event_note TEXT,
  FOREIGN KEY (claim_id) REFERENCES claims(claim_id)
);