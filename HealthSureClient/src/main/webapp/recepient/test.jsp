<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
<html>
<head>
    <title>View Procedure Tests</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h2 {
            color: #2E8B57;
            margin-top: 30px;
            text-align: center;
        }

        .table {
            border-collapse: collapse;
            width: 90%;
            margin: 30px auto;
        }

        .table th, .table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        .table th {
            background-color: #f2f2f2;
            color: #333;
        }
    </style>
</head>
<body>

    <h2>Procedure Test History</h2>

    <table class="table">
        <thead>
            <tr>
                <th>Test Name</th>
                <th>Test Date</th>
                <th>Result Summary</th>
                <th>Status</th>
                <th>Remarks</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Blood Test</td>
                <td>2025-06-25</td>
                <td>Normal Range</td>
                <td>Completed</td>
                <td>All values within normal range</td>
            </tr>
            <tr>
                <td>X-Ray</td>
                <td>2025-06-26</td>
                <td>No fractures</td>
                <td>Completed</td>
                <td>Minor swelling observed</td>
            </tr>
            <tr>
                <td>ECG</td>
                <td>2025-06-27</td>
                <td>Stable</td>
                <td>Completed</td>
                <td>No abnormalities found</td>
            </tr>
            <tr>
                <td>CT Scan</td>
                <td>2025-06-28</td>
                <td>Clear</td>
                <td>Pending</td>
                <td>Awaiting final report</td>
            </tr>
        </tbody>
    </table>

</body>
</html>
</f:view>
