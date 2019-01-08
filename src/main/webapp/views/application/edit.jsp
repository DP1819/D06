<%--
 * action-1.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>


<!--  Primero pongo la autoridad ya que solo un admin maneja las categorias -->
<security:authorize access="hasAnyRole('CUSTOMER' , 'HANDYWORKER')">

	<div>
		<form:form action="application/edit.do" method="post" id="formCreate" name="formCreate" modelAttribute="application">

	<!-- No me acuerdo exactamente para que hacia falta  -->
			<form:hidden path="id" />
			<form:hidden path="version" />
			<form:hidden path="creditCard"/>
			<form:hidden path="handyWorker" />
			<form:hidden path="customerComments" />
			
			

	<security:authorize access="hasRole('HANDYWORKER')">
		
			<jstl:if test="${application.id == 0}">
			<form:label path="moment"> <spring:message code="application.moment" /></form:label>
			<form:input path="moment" /><form:errors cssClass="error" path="moment" /><br />
			</jstl:if>
		</security:authorize> 
		
		

		<%--  --%><security:authorize access="hasRole('HANDYWORKER')">
			<form:label path="price"> <spring:message code="application.price" /></form:label>
			<form:input path="price" /><form:errors cssClass="error" path="price" /><br />
		<%--  --%></security:authorize>
			
			
		<%-- Status--%>
		<security:authorize access="hasRole('CUSTOMER')">

		<form:label path="status"><spring:message code="application.status"></spring:message></form:label>
		<form:select id="status" path="status">
		<form:option value="${STATUS}" label="PENDING"></form:option>
		<form:options items="${status}" itemLabel="name" itemValue="id" />
		</form:select>
		<form:errors cssClass="error" path="status" />
		</security:authorize> 

		
			<security:authorize access="hasRole('HANDYWORKER')">
			<form:label path="workerComments"> <spring:message code="application.workerComments" /></form:label>
			<form:input path="workerComments" /><form:errors cssClass="error" path="workerComments" /><br />
			</security:authorize> 
			
<%-- 			<security:authorize access="hasRole('CUSTOMER')">
			
			<form:label path="customerComments"> <spring:message code="application.customerComments" /></form:label>
			<form:input path="customerComments" /><form:errors cssClass="error" path="customerComments" /><br />
			</security:authorize>  --%>
			
			
		
			<form:label path="fixupTask"> <spring:message code="application.fixupTask"></spring:message></form:label>
		
			<form:select id="fixupTask" path="fixupTask">
			<form:option value="${application.fixupTask}" label="------"></form:option>
			<form:options items="${fixupTasks}" itemLabel="ticker" itemValue="id" />
			</form:select>
			<form:errors cssClass="error" path="fixupTask" />
			<br />
			
			
				<!--  Los botones de crear y cancelar -->
			<br />

		<input type="submit" name="save" value="<spring:message code="application.save"></spring:message>" />	
		<button type="button" onclick="javascript: relativeRedir('application/list.do')" ><spring:message code="application.return" /></button>
		
		</form:form>
		
	</div> 

</security:authorize>

