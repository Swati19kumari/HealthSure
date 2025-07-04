<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
<head>
<title>My Claim History</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.table {
	border-collapse: collapse;
	width: 95%;
	margin-top: 30px;
}

.table th, .table td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

.table th {
	background-color: #e3f1fd;
	color: #333;
}
</style>
</head>
<body>

	<h2>My Insurance Claim History</h2>

	<!-- Search Form -->
	<h:form prependId="false">


		<h:panelGrid columns="3" cellpadding="5">
			<h:outputLabel for="recipientId" value="Enter Recipient ID:" />
			<h:inputText id="recipientId"
				value="#{claimController.recipient.hId}" />
			<h:commandButton value="Show All"
				action="#{claimController.viewMyClaims()}" />
		</h:panelGrid>
		<h:messages globalOnly="true" style="color : red" />
	</h:form>

	<!-- Claim Table with Pagination and Sorting -->
	<h:form>
		<h:dataTable id="tableRender"
			value="#{claimController.paginatedClaimList}" var="c"
			styleClass="table">

			<!-- Claim ID -->
			<h:column>
				<f:facet name="header">
					<h:panelGroup layout="block">
                Claim ID
                <h:commandLink
							action="#{claimController.sortByAsc('claimId')}"
							title="Sort Ascending">
							<h:outputText value=" &#9650;" escape="false" />
						</h:commandLink>
						<h:outputText value=" " />
						<h:commandLink action="#{claimController.sortByDesc('claimId')}"
							title="Sort Descending">
							<h:outputText value=" &#9660;" escape="false" />
						</h:commandLink>
					</h:panelGroup>
				</f:facet>
				<h:outputText value="#{c.claimId}" />
			</h:column>

			<!-- Claim Date -->
			<h:column>
				<f:facet name="header">
					<h:panelGroup layout="block">
                Claim Date
                <h:commandLink
							action="#{claimController.sortByAsc('claimDate')}"
							title="Sort Ascending">
							<h:outputText value=" &#9650;" escape="false" />
						</h:commandLink>
	     					<h:outputText value=" " />
					
						<h:commandLink action="#{claimController.sortByDesc('claimDate')}"
							title="Sort Descending">
							<h:outputText value=" &#9660;" escape="false" />
						</h:commandLink>
					</h:panelGroup>
				</f:facet>
				<h:outputText value="#{c.claimDate}">
					<f:convertDateTime pattern="yyyy-MM-dd" />
				</h:outputText>
			</h:column>

			<!-- Diagnosis -->
			<h:column>
				<f:facet name="header">
					<h:panelGroup layout="block">
                Service
                <h:commandLink
							action="#{claimController.sortByAsc('procedure.diagnosis')}"
							title="Sort Ascending">
							<h:outputText value=" &#9650;" escape="false" />
						</h:commandLink>
						<h:commandLink
							action="#{claimController.sortByDesc('procedure.diagnosis')}"
							title="Sort Descending">
							<h:outputText value=" &#9660;" escape="false" />
						</h:commandLink>
					</h:panelGroup>
				</f:facet>
				<h:outputText value="#{c.procedure.diagnosis}" />
			</h:column>

			<!-- Procedure Date -->
			<h:column>
				<f:facet name="header">
					<h:panelGroup layout="block">
                Service Date
                <h:commandLink
							action="#{claimController.sortByAsc('procedure.procedureDate')}"
							title="Sort Ascending">
							<h:outputText value=" &#9650;" escape="false" />
						</h:commandLink>
						<h:commandLink
							action="#{claimController.sortByDesc('procedure.procedureDate')}"
							title="Sort Descending">
							<h:outputText value=" &#9660;" escape="false" />
						</h:commandLink>
					</h:panelGroup>
				</f:facet>
				<h:outputText value="#{c.procedure.procedureDate}">
					<f:convertDateTime pattern="yyyy-MM-dd" />
				</h:outputText>
			</h:column>

			<!-- Insurance -->
			<h:column>
				<f:facet name="header">
					<h:panelGroup layout="block">
                Insurance
                <h:commandLink
							action="#{claimController.sortByAsc('subscribe.coverage.insurancePlan.insuranceCompany.companyName')}"
							title="Sort Ascending">
							<h:outputText value=" &#9650;" escape="false" />
						</h:commandLink>
						<h:commandLink
							action="#{claimController.sortByDesc('subscribe.coverage.insurancePlan.insuranceCompany.companyName')}"
							title="Sort Descending">
							<h:outputText value=" &#9660;" escape="false" />
						</h:commandLink>
					</h:panelGroup>
				</f:facet>
				<h:outputText
					value="#{c.subscribe.coverage.insurancePlan.insuranceCompany.companyName}" />
			</h:column>

			<!-- Amount Claimed -->
			<h:column>
				<f:facet name="header">
					<h:panelGroup layout="block">
                Claim Amount
                <h:commandLink
							action="#{claimController.sortByAsc('amountClaimed')}"
							title="Sort Ascending">
							<h:outputText value=" &#9650;" escape="false" />
						</h:commandLink>
						<h:commandLink
							action="#{claimController.sortByDesc('amountClaimed')}"
							title="Sort Descending">
							<h:outputText value=" &#9660;" escape="false" />
						</h:commandLink>
					</h:panelGroup>
				</f:facet>
				<h:outputText value="₹#{c.amountClaimed}" />
			</h:column>

			<!-- Amount Approved -->
			<h:column>
				<f:facet name="header">
					<h:panelGroup layout="block">
                Paid by Insurance
                <h:commandLink
							action="#{claimController.sortByAsc('amountApproved')}"
							title="Sort Ascending">
							<h:outputText value=" &#9650;" escape="false" />
						</h:commandLink>
						<h:commandLink
							action="#{claimController.sortByDesc('amountApproved')}"
							title="Sort Descending">
							<h:outputText value=" &#9660;" escape="false"/>
						</h:commandLink>
					</h:panelGroup>
				</f:facet>
				<h:outputText
					value="#{c.amountApproved == 0 ? 'Pending' : '₹' += c.amountApproved}" />
			</h:column>

			<!-- Claim Status -->
			<h:column>
				<f:facet name="header">
					<h:panelGroup layout="block">
                Status
                <h:commandLink
							action="#{claimController.sortByAsc('claimStatus')}"
							title="Sort Ascending">
							<h:outputText value=" &#9650;" escape="false" />
						</h:commandLink>
						<h:commandLink
							action="#{claimController.sortByDesc('claimStatus')}"
							title="Sort Descending">
							<h:outputText value=" &#9660;" escape="false"/>
						</h:commandLink>
					</h:panelGroup>
				</f:facet>
				<h:outputText value="#{c.claimStatus}" />
			</h:column>

		</h:dataTable>


		<!-- Pagination Controls -->
		<h:commandButton value="Previous"
			action="#{claimController.previousPage}"
			disabled="#{!claimController.hasPreviousPage}" />
		<h:commandButton value="Next" action="#{claimController.nextPage}"
			disabled="#{!claimController.hasNextPage}" />
	</h:form>

</body>
	</html>
</f:view>
