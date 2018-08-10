package com.example.demo;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.springframework.stereotype.Component;

@Component
public class Consumer {
    static Map<Integer,String> response = new HashMap<>();
    int i=0;
	static Properties props = new Properties();

	static {
		props.put("bootstrap.servers", "localhost:9092");
		props.put("group.id", "test");
		props.put("enable.auto.commit", "true");
		props.put("auto.commit.interval.ms", "1000");
		props.put("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
		props.put("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
	}

	KafkaConsumer<String, String> consumer = new KafkaConsumer<>(props);

	public Map<Integer,String> consume() {
		
		System.out.println("Consumer.consume()");

		consumer.subscribe(Arrays.asList("topic", "test_topic"));
		boolean flag = true;
		while (flag) {
			ConsumerRecords<String, String> records = consumer.poll(5);
			Iterator itr=records.iterator();
			while(itr.hasNext()){
				System.out.println("Records::"+itr.next());
			}
			for (ConsumerRecord<String, String> record : records) {
				
				System.out.printf("offset = %d, key = %s, value = %s%n", record.offset(), record.key(), record.value());
				response.put(i,record.value());
				if (record.value() != null) {
					flag = false;
				}
				i++;
			}

		}
		return response;
	}
}
