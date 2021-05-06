<head>
    <title>Average PPG by MVPs since 2013</title>
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Average PPG by MVPs since 2013</h2><br>";

    if ($result = $conn->query("CALL Query1();")) {
        echo "<table border=\"2px solid black\"<";
        echo "<tr><td>season</td><td>playerName</td><td>pointsPerGame</td></tr>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["season"] . "</td>";
            echo "<td>" . $row["playerName"] . "</td>";
            echo "<td>" . $row["pointsPerGame"] . "</td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>