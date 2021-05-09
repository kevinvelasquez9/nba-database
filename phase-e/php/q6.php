<head>
    <title>Team with most games played with no championship</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Team with most games played with no championship</h2><br>";

    if ($result = $conn->query("CALL Query6();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>franchiseName</th><th>gamesPlayed</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["franchiseName"] . "</td>";
            echo "<td>" . $row["gamesPlayed"] . "</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>