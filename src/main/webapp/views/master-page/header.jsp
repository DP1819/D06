<%--
 * header.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div>
	<a href="#"><img src="images/logoHandyWorker.png"
		alt="Acme-Handy-Worker Co., Inc." /></a>
</div>

<div>
	<ul id="jMenu">
		<!-- Do not forget the "fNiv" class for the first level links !! -->
		<security:authorize access="hasRole('ADMIN')">
			<li><a class="fNiv"><spring:message
						code="master.page.administrator" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="actor/administrator/list-suspicious-actors.do"><spring:message
								code="master.page.listsuspiciousactors" /></a></li>
					<li><a href="settings/administrator/edit.do"><spring:message
								code="master.page.editsettings" /></a></li>
					<li><a href="referee/administrator/create.do"><spring:message
								code="master.page.createreferee" /></a></li>
					<li><a href="warranty/administrator/list.do"><spring:message
								code="master.page.warranty.list" /></a></li>
					<li><a href="category/administrator/list.do"><spring:message
								code="category.list"></spring:message></a>
					<li><a href="administrator/administrator/dashboard.do"><spring:message
								code="master.page.dashboard" /></a></li>
				</ul></li>
		</security:authorize>

		<security:authorize access="hasRole('CUSTOMER')">
			<li><a class="fNiv"><spring:message
						code="master.page.customer" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="customer/action-1.do"><spring:message
								code="master.page.customer.action.1" /></a></li>

				</ul></li>
		</security:authorize>

		<security:authorize access="hasRole('HANDYWORKER')">
			<li><a class="fNiv"><spring:message
						code="master.page.handyWorker" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="referee/referee/profile.do"><spring:message
								code="master.page.handyWorker.application.list" /></a></li>
					<li><a href="curriculum/handyWorker/display.do"><spring:message
								code="master.page.handyWorker.curriculum" /></a></li>
					<li><a href="workplan/handyWorker/list.do"><spring:message
								code="master.page.handyWorker.workPlan" /></a></li>
				</ul></li>
		</security:authorize>

		<security:authorize access="hasRole('REFEREE')">
			<li><a class="fNiv"><spring:message
						code="master.page.referee" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="referee/referee/profile.do"><spring:message
								code="master.page.refereeprofile" /></a></li>
				</ul></li>
		</security:authorize>

		<security:authorize access="isAnonymous()">
			<li><a class="fNiv" href="security/login.do"><spring:message
						code="master.page.login" /></a></li>

			<li><a class="fNiv"><spring:message
						code="master.page.signup" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="referee/referee/profile.do"><spring:message
								code="master.page.AsHandyWorker" /></a></li>
					<li><a href="none/customer/create.do"><spring:message
								code="master.page.AsCustomer" /></a></li>
					<li><a href="none/sponsor/create.do"><spring:message
								code="master.page.AsSponsor" /></a></li>
					<li><a href="curriculum/handyWorker/display.do"><spring:message
								code="master.page.AsReferee" /></a></li>
				</ul></li>
		</security:authorize>

		<security:authorize access="isAuthenticated()">
			<li><a class="fNiv"> <spring:message
						code="master.page.profile" /> (<security:authentication
						property="principal.username" />)
			</a>
				<ul>
					<li class="arrow"></li>
					<li><a href="folder/actor/list.do"><spring:message
								code="master.page.listfolders" /> </a></li>
					<li><a href="message/actor/create.do"><spring:message
								code="master.page.writemessage" /> </a></li>
					<security:authorize access="hasRole('CUSTOMER')">
						<li><a href="customer/display.do"><spring:message
									code="master.page.customer.profile" /></a></li>
					</security:authorize>
					<security:authorize access="hasRole('ADMIN')">
						<li><a href="administrator/display2.do"><spring:message
									code="master.page.administrator.edit" /></a></li>
						<li><a href="administrator/list.do"><spring:message
									code="master.page.administrator.listActors" /></a></li>
					</security:authorize>
					<li><a href="j_spring_security_logout"><spring:message
								code="master.page.logout" /> </a></li>
				</ul></li>
		</security:authorize>
	</ul>
</div>

<div>
	<a href="?language=en">en</a> | <a href="?language=es">es</a>
</div>

