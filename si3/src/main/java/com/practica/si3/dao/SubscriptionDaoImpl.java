package com.practica.si3.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.practica.si3.domain.Subscription;
import com.practica.si3.jdbc.SubscriptionRowMapper;

public class SubscriptionDaoImpl implements SubscriptionDao {

	@Autowired
	DataSource dataSource;

	public void insertData(Subscription subscription) {

		String sql = "INSERT INTO subscription "
				+ "(coduser,tiposubscription) VALUES (?, ?)";

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(
				sql,
				new Object[] { subscription.getUserId(), subscription.getTipoSubscription() });
	}

	public List<Subscription> getSubscriptionList() {
		
		List subscriptionList = new ArrayList();

		String sql = "select * from subscription";

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		subscriptionList = jdbcTemplate.query(sql, new SubscriptionRowMapper());
		return subscriptionList;
	}

	@Override
	public void deleteData(String id) {
		
		String sql = "delete from subscription where codsubscription=" + id;
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql);

	}

	@Override
	public void updateData(Subscription subscription) {

		String sql = "UPDATE subscription set coduser = ?, tiposubscription = ? where codsubscription = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(sql, new Object[] { subscription.getUserId(), subscription.getTipoSubscription(), subscription.getSubscriptionId() });
	}

	@Override
	public Subscription getSubscription(String id) {
		
		List<Subscription> subscriptionList = new ArrayList<Subscription>();
		
		String sql = "select * from subscription where codsubscription= " + id;
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		subscriptionList = jdbcTemplate.query(sql, new SubscriptionRowMapper());
		return subscriptionList.get(0);
	}

}
