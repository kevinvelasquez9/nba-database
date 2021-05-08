<head>
    <title>First and second time a unique player earned more than $30 million</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>First and second time a unique player earned more than $30 million</h2><br>";

    if ($result = $conn->query("CALL Query12();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>firstPlayer</th><th>secondPlayer</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["firstPlayer"] . "</td>";
            echo "<td>" . $row["secondPlayer"] . "</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>