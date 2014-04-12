package com.practica.si3.domain;

public class Subscription {
	
	private int subscriptionId;
	private int userId;
	private String tipoSubscription;
	
	
	public void setSubscriptionId(int subscriptionId) {
		
		this.subscriptionId = subscriptionId;
	}
	
	public int getSubscriptionId() {
		
		return subscriptionId;
	}
	
	public void setUserId(int userId) {
		
		this.userId = userId;
	}
	
	public int getUserId() {
		
		return userId;
	}
	
	public void setTipoSubscription(String tipoSubscription) {
		
		this.tipoSubscription = tipoSubscription;
	}
	
	public String getTipoSubscription() {
		
		return tipoSubscription;
	}
}