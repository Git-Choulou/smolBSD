<?php
echo "<h1>smolBSD 'nbmp' service</h1>
<div style='font-size:small;'>(<b>N</b>etBSD <b>B</b>ozohttpd <b>M</b>ariadb <b>P</b>hp)</div>";
echo "<h1 style='text-align:center;'>Example site</h1>";

echo "<div style='text-align:center;'><a href='info.php'>See PHP info page</a>.</div>";
echo "<img src='smolBSD.png' style='height:10em; display:block; margin:3em auto;' />";


// Connexion à MariaDB
$mysqli = new mysqli("localhost", "root", "");

if ($mysqli->connect_error) {
    die("Erreur de connexion : " . $mysqli->connect_error);
}

// Bases à exclure
$system_databases = [
    'mysql',
    'information_schema',
    'performance_schema',
    'sys',
    'test'
];

// Récupération des bases
$result = $mysqli->query("SHOW DATABASES");

while ($db = $result->fetch_row()) {
    $dbname = $db[0];

    if (in_array($dbname, $system_databases)) {
        continue;
    }

    echo "<h3>Base : $dbname</h3>";

    // Sélection de la base
    $mysqli->select_db($dbname);

    // Récupération des tables
    $tables = $mysqli->query("SHOW TABLES");
    echo "<b>Tables :</b><br>";
    while ($table = $tables->fetch_row()) {
        echo $table[0] . "<br>";
    }
}

$mysqli->close();

?>
