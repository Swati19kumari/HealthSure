<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
<html>
<head>
    <title>Prescribed Medicines</title>
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

        .button-container {
            margin-top: 20px;
        }

        .button-container h\:commandButton {
            background-color: #4CAF50;
            color: white;
            padding: 8px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

    </style>
</head>
<body>

    <h2 style="color: green;">Prescribed Medicines</h2>

    <h:form>
        <h:dataTable value="#{recepientController.medicineList}" var="m" styleClass="table">
            <h:column>
                <f:facet name="header"><h:outputText value="Medicine Name" /></f:facet>
                <h:outputText value="#{m.medicineName}" />
            </h:column>

            <h:column>
                <f:facet name="header"><h:outputText value="Dosage" /></f:facet>
                <h:outputText value="#{m.dosage}" />
            </h:column>

            <h:column>
                <f:facet name="header"><h:outputText value="Duration" /></f:facet>
                <h:outputText value="#{m.duration}" />
            </h:column>

            <h:column>
                <f:facet name="header"><h:outputText value="Notes" /></f:facet>
                <h:outputText value="#{m.notes}" />
            </h:column>
        </h:dataTable>

        <div class="button-container">
            <h:commandButton value="View Procedure Tests"
                             action="#{recepientController.showProcedureTests(m.prescription.prescriptionId)}"/>
        </div>
    </h:form>

</body>
</html>
</f:view>
