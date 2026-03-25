package com.fsad;
import java.lang.Override;
import org.springframework.stereotype.Service;
@Service
public class PaymentServiceImp1 implements PaymentService {
	@Override
	public String processPayment() {
		return "Payment processed successfully!";
	}

}
