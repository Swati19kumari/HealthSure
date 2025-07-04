<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
<html>
<head>
    <title>Hospital Visit History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .table {
            border-collapse: collapse;
            width: 90%;
            margin-top: 30px;
        }

        .table th, .table td {
            border: 1px solid #ccc;
            padding: 10px;
        }

        .table th {
            background-color: #f2f2f2;
            color: #333;
        }

        .error-message {
            color: red;
        }

        .search-panel {
            margin-top: 30px;
        }

        .search-panel h2 {
            color: #2E8B57;
        }

        .search-panel form {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <div class="search-panel">
        <h2>My Hospital Visit History</h2>

        <!-- Search Form -->
        <h:form prependId="false">
            <h:panelGrid columns="3" cellpadding="5">
                <h:outputLabel for="recipientId" value="Enter Recipient ID:" />
                <h:inputText id="recipientId" value="#{recepientController.recipient.hId}" />
                <h:message for="recipientId" styleClass="error-message" />

                <h:outputLabel />
                <h:commandButton value="Show All" action="#{recepientController.showVisitHistory()}" />
                <h:outputText />
            </h:panelGrid>
        </h:form>
    </div>

    <!-- Data Table -->
    <h:form>
        <h:dataTable id="tableRender"
                     value="#{recepientController.showVisitHistory()}"
                     var="mp"
                     styleClass="table"
                     border="1"
                     cellpadding="5">

            <h:column>
                <f:facet name="header">
                    <h:outputText value="Procedure ID" />
                </f:facet>
                <h:outputText value="#{mp.procedureId}" />
            </h:column>

            <h:column>
                <f:facet name="header">
                    <h:outputText value="Hospital Name" />
                </f:facet>
                <h:outputText value="#{mp.provider.hospital_name}" />
            </h:column>

            <h:column>
                <f:facet name="header">
                    <h:outputText value="Doctor Name" />
                </f:facet>
                <h:outputText value="#{mp.doctor.doctorName}" />
            </h:column>

            <h:column>
                <f:facet name="header">
                    <h:outputText value="From Date" />
                </f:facet>
                <h:outputText value="#{mp.fromDate}">
                    <f:convertDateTime pattern="dd-MM-yyyy HH:mm" />
                </h:outputText>
            </h:column>

            <h:column>
                <f:facet name="header">
                    <h:outputText value="To Date" />
                </f:facet>
                <h:outputText value="#{mp.toDate}">
                    <f:convertDateTime pattern="dd-MM-yyyy HH:mm" />
                </h:outputText>
            </h:column>

            <h:column>
                <f:facet name="header">
                    <h:outputText value="Diagnosis" />
                </f:facet>
                <h:outputText value="#{mp.diagnosis}" />
            </h:column>

             <h:column>
        <f:facet name="header">Action</f:facet>
        <h:commandButton value="View Medicines"
                         action="#{recepientController.showPrescribedMedicines(mp.procedureId)}"/>
      </h:column>

        </h:dataTable>
    </h:form>

</body>
</html>
</f:view>
