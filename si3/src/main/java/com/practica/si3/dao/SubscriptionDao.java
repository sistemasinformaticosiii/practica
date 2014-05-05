package com.practica.si3.dao;

import java.util.List;

import com.practica.si3.domain.Subscription;

public interface SubscriptionDao {
	
	public void insertData(Subscription subscription);
	public List<Subscription> getSubscriptionList();
	public void updateData(Subscription subscription);
	public void deleteData(String id);
	public Subscription getSubscription(String id);

}
