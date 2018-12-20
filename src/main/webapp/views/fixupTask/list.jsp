<%--
 * list.jsp
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
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- Listing grid -->

<p>
	<spring:message code="fixupTask.list" />
</p>

<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="fixupTasks" requestURI="${requestURI}" id="row">

	<!-- Action links -->

	<security:authorize access="hasRole('CUSTOMER')">
		<display:column>
			<a href="fixupTask/customer/edit.do?fixupTaskId=${row.id}"> <spring:message
					code="fixupTask.edit" />
			</a>
		</display:column>
	</security:authorize>

	<!-- Attributos -->

	<display:column property="ticker" titleKey="fixupTask.ticker"
		sortable="true" />

	<display:column property="moment" titleKey="fixupTask.date"
		sortable="true" format="{0,date,${moment}}" />

	<display:column property="description" titleKey="fixupTask.description"
		sortable="false" />

	<display:column property="address" titleKey="fixupTask.address"
		sortable="false" />

	<display:column property="maximumPrice"
		titleKey="fixupTask.maximumPrice" sortable="false" />

	<display:column property="category" titleKey="fixupTask.category"
		sortable="false" />

	<display:column property="warranty" titleKey="fixupTask.warranty"
		sortable="false" />

	<display:column property="start" titleKey="fixupTask.start"
		sortable="true" format="{0,date,dd/MM/yyyy HH:mm}" />

	<display:column property="end" titleKey="fixupTask.end" sortable="true"
		format="{0,date,dd/MM/yyyy HH:mm}" />


</display:table>

<!-- Botones  -->

<security:authorize access="hasRole('CUSTOMER')">
	<div>
		<a href="fixupTask/customer/create.do"> <spring:message
				code="fixupTask.create" />
		</a>
	</div>
</security:authorize>