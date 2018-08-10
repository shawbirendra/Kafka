package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
public class Sender {

	@Autowired
	private KafkaTemplate<String, String> kafkaTemplate;
	String kafkaTopic = "test_topic";

	public void send(String message) {
		kafkaTemplate.send(kafkaTopic, message);
	}
}
