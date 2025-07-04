<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<f:view>
<html>
<head>
    <title>My Claims</title>
</head>
<body>

<h:form>

    <center><h2><h:outputText value="💼 My Insurance Claims"/></h2></center>

    <!-- 🔍 Filter by Date Only -->
    <h:panelGrid columns="4" cellpadding="5" style="margin-bottom:20px;">

        <h:outputLabel value="From Date:" />
        <h:inputText value="2025-01-01" />

        <h:outputLabel value="To Date:" />
        <h:inputText value="2025-06-30" />

        <h:outputLabel value="" />
        <h:commandButton value="🔍 Search" />
    </h:panelGrid>

    <!-- 📋 Claims Table -->
    <table border="1" width="100%" cellpadding="8" style="text-align:center; border-collapse:collapse;">
        <thead style="background:#f0f4c3;">
            <tr>
                <th>Claim ID</th>
                <th>Claim Date</th>
              <th>Insurance Name</th>
                <th>Service</th>
                <th>Claim Amount</th>
                <th>Paid By Insurance</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>CLM101</td>
                <td>2025-01-12</td>
                
                <td>Star Health</td>
                <td>General Checkup</td>
                <td>₹1200</td>
                <td>₹1200</td>
                <td>Approved</td>
            </tr>
            <tr>
                <td>CLM102</td>
                <td>2025-02-18</td>
                
                <td>ICICI Lombard</td>
                <td>Dental Cleaning</td>
                <td>₹800</td>
                <td>₹0</td>
                <td>Rejected</td>
            </tr>
            <tr>
                <td>CLM103</td>
                <td>2025-03-25</td>
                
                <td>Religare</td>
                <td>Blood Test</td>
                <td>₹450</td>
                <td>₹450</td>
                <td>Approved</td>
            </tr>
            <tr>
                <td>CLM104</td>
                <td>2025-05-10</td>
                
                <td>Star Health</td>
                <td>X-Ray</td>
                <td>₹1000</td>
                <td>Pending</td>
                <td>Pending</td>
            </tr>
        </tbody>
    </table>

</h:form>

</body>
</html>
</f:view>
