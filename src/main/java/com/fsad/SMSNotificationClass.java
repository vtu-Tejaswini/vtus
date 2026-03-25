package com.fsad;
import org.springframework.stereotype.Service;
@Service
public class SMSNotificationClass implements NotificationService{
	public String sendNotification() {
		return "SMS notification sent!";
	}

}
