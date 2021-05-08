<head>
    <title>Players who have average a triple-double w/o getting MVP</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Players who have average a triple-double w/o getting MVP</h2><br>";

    if ($result = $conn->query("CALL Query13();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>season</th><th>playerName</th><th>pointsPerGame</th><th>assistsPerGame</th><th>reboundsPerGame</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["season"] . "</td>";
            echo "<td>" . $row["playerName"] . "</td>";
            echo "<td>" . $row["pointsPerGame"] . "</td>";
            echo "<td>" . $row["assistsPerGame"] . "</td>";
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