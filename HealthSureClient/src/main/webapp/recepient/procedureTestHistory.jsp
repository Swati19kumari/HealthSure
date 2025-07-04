<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
<html>
<head>
    <title>Procedure Test History</title>
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

        .heading {
            color: #2E8B57;
            margin-top: 30px;
        }
    </style>
</head>
<body>

    <h2 class="heading">Procedure Test History</h2>

    <!-- Data Table for Test History -->
    <h:form>
        <h:dataTable id="testTable"
                     value="#{recepientController.testList}"
                     var="t"
                     styleClass="table"
                     border="1"
                     cellpadding="5">

            <h:column>
                <f:facet name="header">Test ID</f:facet>
                <h:outputText value="#{t.testId}" />
            </h:column>

            <h:column>
                <f:facet name="header">Test Name</f:facet>
                <h:outputText value="#{t.testName}" />
            </h:column>

            <h:column>
                <f:facet name="header">Test Date</f:facet>
                <h:outputText value="#{t.testDate}">
                    <f:convertDateTime pattern="dd-MM-yyyy" />
                </h:outputText>
            </h:column>

            <h:column>
                <f:facet name="header">Result Summary</f:facet>
                <h:outputText value="#{t.resultSummary}" />
            </h:column>

            <h:column>
                <f:facet name="header">Created At</f:facet>
                <h:outputText value="#{t.createdAt}">
                    <f:convertDateTime pattern="dd-MM-yyyy HH:mm" />
                </h:outputText>
            </h:column>

        </h:dataTable>
    </h:form>

</body>
</html>
</f:view>