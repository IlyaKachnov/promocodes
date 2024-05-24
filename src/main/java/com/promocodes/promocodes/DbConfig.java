package com.promocodes.promocodes;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

//@Configuration
//public class DbConfig {
//
//    @Bean
//    public DataSource dataSource() {
//        DriverManagerDataSource dataSource = new DriverManagerDataSource();
//        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
//        dataSource.setUrl("jdbc:mysql://localhost:3306/springjdbc");
//        dataSource.setUsername("guest_user");
//        dataSource.setPassword("guest_password");
//
//    }
//
//    @Bean
//    public JdbcTemplate jdbcTemplate() {
//        return new JdbcTemplate()
//    }
//}
