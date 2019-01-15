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

<jstl:if test="${curriculum.personalRecord.id!=0}">
<b><spring:message code="curriculum.ticker" />:</b>
<jstl:out value="${curriculum.ticker}" />
<br />
</jstl:if>





<security:authorize access="hasRole('HANDYWORKER')">

	<security:authentication property="principal.username" var="username" />

	<jstl:if test='${handyWorker.userAccount.username == username}'>


		<fieldset>
			<legend>
				<b><spring:message code="curriculum.personalRecord"></spring:message></b>
			</legend>
			<jstl:if test="${curriculum.personalRecord.id!=0}">
				<b><spring:message code="curriculum.fullName"></spring:message>:
				</b>
				<jstl:out value="${curriculum.personalRecord.fullName}"></jstl:out>
				<br />
				<b><spring:message code="curriculum.linkedinProfile"></spring:message></b>
				<jstl:out value="${curriculum.personalRecord.linkedinProfile}"></jstl:out>
				<br />

				<jstl:if test="${curriculum.id}== 0">
					<spring:message code="curriculum.add" var="add"></spring:message>
					<input type="button" name="add" value="${add}"
						onclick="javascript:relativeRedir('personalRecord/create.do?handyWorkerId=${handyWorker.id}')" />
				</jstl:if>
				<spring:message code="curriculum.display" var="display"></spring:message>
				<input type="button" name="display" value="${display}"
					onclick="javascript:relativeRedir('personalRecord/handyWorker/display.do?personalRecordId=${curriculum.personalRecord.id}')" />

				<spring:message code="curriculum.edit" var="edit"></spring:message>
				<input type="button" name="edit" value="${edit}"
					onclick="javascript:relativeRedir('personalRecord/handyWorker/edit.do?personalRecordId=${curriculum.personalRecord.id}')" />
			</jstl:if>
			
			
			
		


			<jstl:if test="${curriculum.personalRecord.id==0}">
				<%-- <form:form action="curriculum/handyWorker/display.do" method="post"
				id="formCreate" name="formCreate" modelAttribute="curriculum.personalRecord">

				<form:hidden path="id" />
				<form:hidden path="version" />
				
				<div>
					<form:label path="fullName">
						<spring:message code="personalRecord.fullName"></spring:message>
					</form:label>
					<form:input path="fullName" id="fullName"
						name="fullName" />
					<form:errors cssClass="error" path="fullName" />
					<br />
				</div>

				<div>
					<form:label path="photo">
						<spring:message code="personalRecord.photo"></spring:message>
					</form:label>
					<form:input path="photo" id="photo" name="photo" />
					<form:errors cssClass="error" path="photo" />
					<br />
				</div>
				
				<div>
					<form:label path="phone">
						<spring:message code="personalRecord.phone"></spring:message>
					</form:label>
					<form:input path="phone" id="phone" name="phone" />
					<form:errors cssClass="error" path="phone" />
					<br />
				</div>

				<div>
					<form:label path="email">
						<spring:message code="personalRecord.email"></spring:message>
					</form:label>
					<form:input path="email" id="email" name="email" />
					<form:errors cssClass="error" path="email" />
					<br />
				</div>

				<div>
					<form:label path="linkedinProfile">
						<spring:message code="personalRecord.linkedinProfile"></spring:message>
					</form:label>
					<form:input path="linkedinProfile" id="linkedinProfile" name="linkedinProfile" />
					<form:errors cssClass="error" path="linkedinProfile" />
					<br />
				</div>
				
				<input type="submit" name="save" value="<spring:message code="personalRecord.save"></spring:message>" />

			<button type="button"
				onclick="javascript: relativeRedir('curriculum/handyWorker/display.do">
				<spring:message code="personalRecord.cancel" />
			</button>



			</form:form> --%>
				<spring:message code="curriculum.personalRecord.create" var="create"></spring:message>
				<input type="button" name="create" value="${create}"
					onclick="javascript:relativeRedir('personalRecord/handyWorker/create.do')" />
			</jstl:if>

		</fieldset>



		<jstl:if test="${curriculum.personalRecord.id!=0}">
			<fieldset>
				<legend>
					<b><spring:message code="curriculum.educationRecords"></spring:message></b>
				</legend>
				<display:table name="educationRecords" id="eduactionRecord"
					pagesize="5" class="displaytag">

					<spring:message code="curriculum.diplomeTitle" var="diplomaTitle"></spring:message>
					<display:column property="diplomaTitle" title="${diplomaTitle}"
						sortable="true" />

				</display:table>

				<spring:message code="curriculum.seeEducationRecords"
					var="seeEducationRecords"></spring:message>
				<input type="button" name="seeEducationRecords"
					value="${seeEducationRecords}"
					onclick="javascript:relativeRedir('educationRecord/handyWorker/list.do')" />



			</fieldset>

			<fieldset>
				<legend>
					<b><spring:message code="curriculum.professionalRecords"></spring:message></b>
				</legend>
				<display:table name="professionalRecords" id="professionalRecord"
					pagesize="5" class="displaytag">

					<spring:message code="curriculum.professionalRecord.company"
						var="company"></spring:message>
					<display:column property="company" title="${company}"
						sortable="true" />

					<spring:message code="curriculum.professionalRecord.role"
						var="role"></spring:message>
					<display:column property="role" title="${role}" sortable="true" />

				</display:table>

				<spring:message code="curriculum.seeProfessionalRecords"
					var="seeProfessionalRecords"></spring:message>
				<input type="button" name="seeProfessionalRecords"
					value="${seeProfessionalRecords}"
					onclick="javascript:relativeRedir('professionalRecord/handyWorker/list.do')" />



			</fieldset>



			<fieldset>
				<legend>
					<b><spring:message code="curriculum.endorserRecords"></spring:message></b>
				</legend>
				<display:table name="endorserRecords" id="endorserRecord"
					pagesize="5" class="displaytag">

					<spring:message code="curriculum.endorserRecord.fullName"
						var="fullName"></spring:message>
					<display:column property="fullName" title="${fullName}"
						sortable="true" />

					<spring:message code="curriculum.endorserRecord.linkedinProfile"
						var="linkedinProfile"></spring:message>
					<display:column property="linkedinProfile"
						title="${linkedinProfile}" sortable="true" />

				</display:table>

				<spring:message code="curriculum.seeEndorserRecords"
					var="seeEndorserRecords"></spring:message>
				<input type="button" name="seeEndorserRecords"
					value="${seeEndorserRecords}"
					onclick="javascript:relativeRedir('endorserRecord/handyWorker/list.do')" />



			</fieldset>

			<fieldset>
				<legend>
					<b><spring:message code="curriculum.miscellaneousRecords"></spring:message></b>
				</legend>
				<display:table name="miscellaneousRecords" id="miscellaneousRecord"
					pagesize="5" class="displaytag">

					<spring:message code="curriculum.miscellaneousRecord.title"
						var="title"></spring:message>
					<display:column property="title" title="${title}" sortable="true" />



				</display:table>

				<spring:message code="curriculum.seeMiscellaneousRecords"
					var="seeMiscellaneousRecords"></spring:message>
				<input type="button" name="seeMiscellaneousRecords"
					value="${seeMiscellaneousRecords}"
					onclick="javascript:relativeRedir('miscellaneousRecord/handyWorker/list.do')" />



			</fieldset>







		</jstl:if>

	</jstl:if>

</security:authorize>
