package com.practica.si3.dao;

import java.util.List;

import com.practica.si3.domain.Subscription;

public interface SubscriptionDao {
	
	public void insertData(Subscription subscription);
	public List<Subscription> getSubscriptionList();
	public List<Subscription> getSubscriptionListId(int id);
	public void updateData(Subscription subscription);
	public void deleteData(String id);
	public void deleteDataByUser(int id, String tipo);
	public void deleteDataByCodigo(int id);
	public Subscription getSubscription(String id);

}
