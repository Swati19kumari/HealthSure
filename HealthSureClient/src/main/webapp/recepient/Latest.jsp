<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<f:view>
<html>
<head>
    <title>My Claims</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .claimsTable th {
            background-color: #e3f2fd;
            color: #000;
        }
        .claimsTable td {
            text-align: center;
        }
    </style>
</head>
<body>

<h:form>

    <center><h2><h:outputText value="💼 My Insurance Claims"/></h2></center>

    <!-- 🔍 Filter Panel -->
    <h:panelGrid columns="4" cellpadding="5" style="margin-bottom:20px;">

        <h:outputLabel value="From Date:" />
        <h:inputText value="2025-01-01" />

        <h:outputLabel value="To Date:" />
        <h:inputText value="2025-06-30" />

        <h:outputLabel value="" />
        <h:commandButton value="🔍 Search" />
    </h:panelGrid>

    <!-- 📋 Claims Table -->
    <table class="claimsTable" border="1" width="100%" cellpadding="8" style="border-collapse:collapse;">
        <thead>
            <tr>
                <th>Claim ID</th>
                <th>Claim Date</th>
                <th>Service</th>
                <th>Service Date</th>
                <th>Insurance</th>
                <th>Claim Amount</th>
                <th>Paid By Insurance</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>CLM101</td>
                <td>2025-01-12</td>
                <td>Annual Health Checkup</td>
                <td>2025-01-10</td>
                <td>Star Health</td>
                <td>₹3,000</td>
                <td>₹3,000</td>
                <td style="color:green;">Approved</td>
            </tr>
            <tr>
                <td>CLM102</td>
                <td>2025-02-20</td>
                <td>Dental Root Canal</td>
                <td>2025-02-18</td>
                <td>ICICI Lombard</td>
                <td>₹7,500</td>
                <td>₹0</td>
                <td style="color:red;">Denied</td>
            </tr>
            <tr>
                <td>CLM103</td>
                <td>2025-03-28</td>
                <td>Blood Test (Thyroid Panel)</td>
                <td>2025-03-27</td>
                <td>Religare</td>
                <td>₹1,200</td>
                <td>₹1,200</td>
                <td style="color:green;">Approved</td>
            </tr>
            <tr>
                <td>CLM104</td>
                <td>2025-05-15</td>
                <td>Chest X-Ray</td>
                <td>2025-05-14</td>
                <td>Star Health</td>
                <td>₹1,800</td>
                <td>Pending</td>
                <td style="color:orange;">Pending</td>
            </tr>
            <tr>
                <td>CLM105</td>
                <td>2025-06-10</td>
                <td>Covid-19 RT-PCR Test</td>
                <td>2025-06-09</td>
                <td>Niva Bupa</td>
                <td>₹1,000</td>
                <td>₹1,000</td>
                <td style="color:green;">Approved</td>
            </tr>
        </tbody>
    </table>

</h:form>

</body>
</html>
</f:view>
