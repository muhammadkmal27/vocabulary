export interface UserRecipient {
  id: string;
  name: string;
  email: string;
  role: string;
  subscribed?: boolean;
  subscription_source?: string;
  created_at: string;
}

export interface BroadcastRecord {
  id: string;
  sender_email: string;
  subject: string;
  body: string;
  recipient_type: string;
  total_recipients: number;
  sent_count: number;
  failed_count: number;
  status: string;
  notes?: string | null;
  created_at: string;
}

export interface RecipientsStats {
  total: number;
  total_all: number;
  total_paid: number;
  total_free: number;
}
