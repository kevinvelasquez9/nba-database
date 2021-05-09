<head>
    <title>Average RPG of rebounding title winners</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Average RPG of rebounding title winners</h2><br>";

    if ($result = $conn->query("CALL Query5();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>playerName</th><th>season</th><th>reboundsPerGame</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["playerName"] . "</td>";
            echo "<td>" . $row["season"] . "</td>";
            echo "<td>" . $row["reboundsPerGame"] . "</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>