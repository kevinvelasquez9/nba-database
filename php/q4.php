<head>
    <title>Average buzzer beater distance from 2000s and 2010s</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    include 'open.php';

    echo "<h2>Average buzzer beater distance from 2000s and 2010s</h2><br>";

    if ($result = $conn->query("CALL Query4();")) {
        echo "<table class=\"table table-striped\">";
        echo "<thead>";
        echo "<tr><th>avgDistanceOf2000s</th><th>avgDistanceOf2010s</th></tr>";
        echo "</thead><tbody>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row["avgDistanceOf2000s"] . "</td>";
            echo "<td>" . $row["avgDistanceOf2010s"] . "</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "Could not connect to the database.";
    }
    $conn->close();
    ?>
</body>