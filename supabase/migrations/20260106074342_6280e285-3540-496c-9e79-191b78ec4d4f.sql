-- Create user_emails table for the account management feature
CREATE TABLE public.user_emails (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  email TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'Activated',
  credits INTEGER NOT NULL DEFAULT 0,
  monthly_credits INTEGER NOT NULL DEFAULT 0,
  max_monthly_credits INTEGER NOT NULL DEFAULT 5,
  last_copied_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE public.user_emails ENABLE ROW LEVEL SECURITY;

-- Create policy for public access (no auth required)
CREATE POLICY "Allow all access to user_emails"
  ON public.user_emails
  FOR ALL
  USING (true)
  WITH CHECK (true);