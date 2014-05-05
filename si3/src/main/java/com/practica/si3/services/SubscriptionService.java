package com.practica.si3.services;

import java.util.List;

import com.practica.si3.domain.Subscription;

public interface SubscriptionService {
	
	public void insertData(Subscription subscription);
	public List<Subscription> getSubscriptionList();
	public void deleteData(String id);
	public Subscription getSubscription(String id);
	public void updateData(Subscription subscription);
}
