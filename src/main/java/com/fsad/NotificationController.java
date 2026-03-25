package com.fsad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class NotificationController {
	@Autowired
	@Qualifier("emailNotificationService")
	NotificationService notificationService;
	
	@GetMapping("/notify")
	public String sendNotify() {
		return notificationService.sendNotification();
	}
	
	@Autowired(required=false)
	@Qualifier("emailNotificationService")
	NotificationService optionalService;
	@GetMapping("/optional")
	public String optional() {
		if(optionalService == null) {
			return "Optional service isn't available!";
		}
		return optionalService.sendNotification();
	}
	
}
