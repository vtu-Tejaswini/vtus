package com.fsad;
import org.springframework.stereotype.Service;
import java.lang.Override;
@Service
public class EmailNotificationService implements NotificationService{
	@Override
	public String sendNotification() {
		return "Email notification sent!";
	}
}
