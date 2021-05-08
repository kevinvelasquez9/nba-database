<head>
    <title>Average PPG by MVPs since 2013</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Average PPG by MVPs since 2013</h2><br>";

    if ($result = $conn->query("CALL Query1();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>season</th><th>playerName</th><th>pointsPerGame</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["season"] . "</td>";
            echo "<td>" . $row["playerName"] . "</td>";
            echo "<td>" . $row["pointsPerGame"] . "</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>