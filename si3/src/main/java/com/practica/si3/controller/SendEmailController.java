package com.practica.si3.controller;


import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.practica.si3.domain.Oferta;
import com.practica.si3.domain.Subscription;
import com.practica.si3.domain.User;
import com.practica.si3.services.OfertaService;
import com.practica.si3.services.ReservationService;
import com.practica.si3.services.SubscriptionService;
import com.practica.si3.services.UserService;
 
@Controller
public class SendEmailController {
 
	@Autowired
	UserService userService;
	@Autowired
	OfertaService ofertaService;
	@Autowired
	SubscriptionService subscriptionService;
	@Autowired
	ReservationService reservationService;
	@Autowired
    private JavaMailSender mailSender;
     
  
    //@Scheduled(cron="0 0/1 * * * ?")
    public void doSendEmail() throws Exception {
    	
	    String to, body;
	    User user;
		
	    List<Subscription> subscriptionList = subscriptionService.getSubscriptionList();
		for (int i=0;i<subscriptionList.size();i++) {
			user = userService.getUser(Integer.toString(subscriptionList.get(i).getUserId()));
			to = user.getEmail();
			List<Oferta> ofertaList = ofertaService.getOfertaByProductoVigente(subscriptionList.get(i).getTipoSubscription());
			body = formatBody(ofertaList);
			if (body!=null) {
				sendMail(to, "Portal Ofertas", body);
			}
		}
    }
    
    
    public void sendMail(String to, String subject, String htmlText)
    		throws Exception {
    	
    	MimeMessage mineMessage = mailSender.createMimeMessage();
    	MimeMessageHelper helper = new MimeMessageHelper(mineMessage);
    	try {
    		helper.setTo(to);
    		helper.setSubject(subject);
    		helper.setText(htmlText, true);
    		
    		mailSender.send(mineMessage);
    	} catch (Exception e) {
    		throw new Exception("Fallo al enviar email.",e);
    	}
    }
    
	
    private String formatBody(List<Oferta> list) {
		
		StringBuilder sb = new StringBuilder();
		
		if (list.isEmpty()) {
			return null;
		}
		sb.append("listado de ofertas a las que usted esta suscrito:\n");
		sb.append("<html><body><br /><table border='1'");
		for (int i=0;i<list.size();i++) {
			sb.append("<tr><b><td>" + list.get(i).getTipo() + "</td><td>" + list.get(i).getCategoria() + "</td><td>" + list.get(i).getDescripcion() 
					+ "</td><td>" + list.get(i).getLocalidad() + "</td><td>" + list.get(i).getPrecio() + " euros" + "</td></tr></b>");
		}
		sb.append("</table></body></html>");
		return sb.toString();
	}
}