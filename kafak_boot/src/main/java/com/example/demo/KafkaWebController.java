package com.example.demo;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class KafkaWebController {

	@Autowired
	Consumer consumer;

	@Autowired
	Sender sender;

	@PostMapping("/producer")
	public Map producer(@RequestParam("message") String message) {
		System.out.println("KafkaWebController.producer()");
		sender.send(message);
		Map<Integer,String> response = consumer.consume();
		new ModelAndView().addObject("message", "Message Sent Successfully");
		return response;
	}

	@GetMapping("/home")
	public ModelAndView homepage() {
		return new ModelAndView("home");
	}
}
