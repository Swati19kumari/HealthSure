<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<f:view>
<html>
<head>
    <title>My Hospital Visits</title>
</head>
<body>

<h:form>

    <center><h2><h:outputText value="🩺 My Hospital Visits"/></h2></center>

    <!-- 🔍 Filter UI -->
    <h:panelGrid columns="4" cellpadding="5" style="margin-bottom:20px;">

        <h:outputLabel value="From Date:" />
        <h:inputText value="2025-01-01" />

        <h:outputLabel value="To Date:" />
        <h:inputText value="2025-06-30" />

        <h:outputLabel value="Hospital Name:" />
        <h:selectOneMenu>
            <f:selectItem itemLabel="-- Select --" itemValue="" />
            <f:selectItem itemLabel="Apollo Hospital" itemValue="Apollo Hospital" />
            <f:selectItem itemLabel="City Clinic" itemValue="City Clinic" />
            <f:selectItem itemLabel="Sai Diagnostic Center" itemValue="Sai Diagnostic Center" />
        </h:selectOneMenu>

        <h:commandButton value="🔍 Search" />
    </h:panelGrid>

    <!-- 📋 Static Data Table -->
    <table border="1" width="100%" cellpadding="8" style="text-align:center; border-collapse:collapse;">
        <thead style="background:#e0f7fa;">
            <tr>
                <th>Visit Date</th>
                <th>To Date</th>
                <th>Hospital Name</th>
                <th>Diagnosis</th>
                <th>Prescription</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>2025-01-10</td>
                <td>2025-01-12</td>
                <td>Apollo Hospital</td>
                <td>Mild Fever</td>
                <td><h:commandButton value="📄 View" /></td>
            </tr>
            <tr>
                <td>2025-03-15</td>
                <td>2025-03-15</td>
                <td>Sai Diagnostic Center</td>
                <td>Fasting Sugar High</td>
                <td><h:commandButton value="📄 View" /></td>
            </tr>
            <tr>
                <td>2025-04-01</td>
                <td>2025-04-01</td>
                <td>City Clinic</td>
                <td>Dental Cleaning</td>
                <td><h:commandButton value="📄 View" /></td>
            </tr>
            <tr>
                <td>2025-05-02</td>
                <td>2025-05-03</td>
                <td>Apollo Hospital</td>
                <td>Chest Pain – X-ray Done</td>
                <td><h:commandButton value="📄 View" /></td>
            </tr>
        </tbody>
    </table>

</h:form>

</body>
</html>
</f:view>
