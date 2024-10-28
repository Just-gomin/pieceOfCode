package com.example.pieceOfSpringBoot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import static org.springframework.boot.autoconfigure.SpringBootApplication.*;


@SpringBootApplication
public class SburRedisApplication {
    @Bean
    public RedisOperations<String,AirCraft> redisOperations(RedisConnectionFactory factory) {
        Jackson2JsonRedisSerializer<AirCraft> serializer = new Jackson2JsonRedisSerializer<>(AirCraft.class);

        RedisTemplate<String, AirCraft> template = new RedisTemplate<>();
        template.setConnectionFactory(factory);
        template.setDefaultSerializer(serializer);
        template.setKeySerializer(new StringRedisSerializer());

        return template;
    }

    public static void main(String[] args) {
        SpringApplication.run(SburRedisApplication.class, args);
    }
}

