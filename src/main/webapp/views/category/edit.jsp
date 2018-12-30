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

<%-- <p>
	<spring:message code="category.edit" />
</p> --%>

<!--  Primero pongo la autoridad ya que solo un * maneja las categorias -->
<security:authorize access="hasRole('ADMIN')">

	<div>
	<form:form action="category/administrator/edit.do" method="post" id="formCreate" name="formCreate" modelAttribute="category">

	<!-- No me acuerdo exactamente para que hacia falta  -->
			<form:hidden path="id" />
			<form:hidden path="version" />


<!-- El atributo nombre -->
			<form:label path="name"><spring:message code="category.name"></spring:message></form:label>
			<form:input path="name" id="name" name="name" />
			<form:errors cssClass="error" path="name" />
			<br>
<!--  Categoria padre (desplegable) -->
		<form:label path="parentCategory"> <spring:message code="category.parentCategory"></spring:message></form:label>
		
		<form:select id="parentCategory" path="parentCategory">
		<form:option value="${category.parentCategory}" label="------"></form:option>
		<form:options items="${categories}" itemLabel="name" itemValue="id" />
		</form:select>
		<form:errors cssClass="error" path="parentCategory" />
		<br />
		
		
		
		<!--  Los botones de crear y cancelar -->

		<input type="submit" name="save" value="<spring:message code="category.save"></spring:message>" />
			
		<button type="button" onclick="javascript: relativeRedir('category/administrator/list.do')" ><spring:message code="category.return" /></button>
		
		<input type="submit" name="delete" value="<spring:message code="category.delete"></spring:message>" />
		
	<jstl:if test="${category.id != 0}">
		<input type="submit" name="delete" value="<spring:message code="category.delete" />" onclick="return confirm('<spring:message code="category.confirm.delete" />')" />&nbsp;
	</jstl:if>	
		
		</form:form>
		
		

	</div>

		

</security:authorize>

