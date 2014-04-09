package com.practica.si3.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.practica.si3.domain.Subscription;

public class SubscriptionExtractor implements ResultSetExtractor<Subscription> {

	public Subscription extractData(ResultSet resultSet) throws SQLException,
			DataAccessException {
		
		Subscription subscription = new Subscription();
		
		subscription.setSubscriptioId(resultSet.getInt(1));
		subscription.setUserId(resultSet.getInt(2));
		subscription.setTipoSubscription(resultSet.getString(3));
		
		return subscription;
	}

}
