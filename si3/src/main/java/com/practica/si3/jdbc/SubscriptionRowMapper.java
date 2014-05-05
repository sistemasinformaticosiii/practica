package com.practica.si3.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.practica.si3.domain.Subscription;

public class SubscriptionRowMapper implements RowMapper<Subscription> {

	@Override
	public Subscription mapRow(ResultSet resultSet, int line) throws SQLException {
		SubscriptionExtractor subscriptionExtractor = new SubscriptionExtractor();
		return subscriptionExtractor.extractData(resultSet);
	}

}
