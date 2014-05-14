<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
  
  <div class="footer">
        <div class="left_footer">
        	<img src="<c:url value="/resources/images/footer_logo.png"/>" alt="" title="" width="170" height="49"/>
        </div>
        
        <div class="center_footer">
        	<spring:message code="footer.templatename"/><br />
        	<a href="http://csscreme.com/freecsstemplates/" title="free templates"><img src="<c:url value="/resources/images/csscreme.jpg"/>" alt="free templates" title="free templates" border="0" /></a><br />
        	<img src="<c:url value="/resources/images/payment.gif"/>" alt="" title="" />
        </div>
        
        <div class="right_footer">
        	<a href="<c:url value="/public/getListOfferInicio"/>"><spring:message code="footer.inicio"/></a>
        	<a href="<c:url value="/public/contact"/>"><spring:message code="footer.acercade"/></a>
        	<a href="<c:url value="/public/contact"/>"><spring:message code="footer.contacto"/></a>
        </div>   
   
   </div>                 
