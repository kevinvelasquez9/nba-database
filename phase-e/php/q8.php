<head>
    <title>APG of players with unassisted buzzer-beaters in 2017</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>APG of players with unassisted buzzer-beaters in 2017</h2><br>";

    if ($result = $conn->query("CALL Query8();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>playerName</th><th>assistsPerGame</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["playerName"] . "</td>";
            echo "<td>" . $row["assistsPerGame"] . "</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>