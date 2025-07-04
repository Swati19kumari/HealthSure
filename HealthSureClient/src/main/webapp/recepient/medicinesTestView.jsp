<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Prescription</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h2 {
            color: #2E8B57;
            margin-top: 40px;
        }

        .table {
            border-collapse: collapse;
            width: 90%;
            margin-top: 20px;
        }

        .table th, .table td {
            border: 1px solid #ccc;
            padding: 10px;
        }

        .table th {
            background-color: #f2f2f2;
            color: #333;
        }

        .btn-view-tests {
            background-color: #2E8B57;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 30px 0;
        }

        .btn-view-tests:hover {
            background-color: #246b45;
        }
    </style>
</head>
<body>
<center>

    <h2>Prescribed Medicines</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Medicine Name</th>
                <th>Dosage</th>
                <th>Duration</th>
                <th>Notes</th> <!-- New column added -->
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Paracetamol</td>
                <td>500mg</td>
                <td>5 days</td>
                <td>After meals, morning & night</td> <!-- Sample note -->
            </tr>
            <tr>
                <td>Amoxicillin</td>
                <td>250mg</td>
                <td>7 days</td>
                <td>Before meals, twice daily</td> <!-- Sample note -->
            </tr>
        </tbody>
    </table>

    <!-- View Tests Button -->
    <form action="ProcedureTests.html" method="get">
        <button type="submit" class="btn-view-tests">View Procedure Tests</button>
    </form>
</center>
</body>
</html>
