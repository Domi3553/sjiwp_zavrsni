<?php include 'db.php'; ?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <title>StreamTune - Web Player</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <aside class="sidebar">
            <h2>StreamTune</h2>
            <ul>
                <li>Naslovnica</li>
                <li>Tražilica</li>
                <li>Moja biblioteka</li>
            </ul>
        </aside>

        <main class="content">
            <header><h1>Dobrodošli nazad</h1></header>
            
            <section class="grid">
                <?php
                // SQL upit koji spaja tablice kako bi dobili pjesme i izvođače
                $stmt = $pdo->query("SELECT p.naslov, i.ime as izvodjac 
                                     FROM pjesma p 
                                     JOIN album a ON p.id_albuma = a.id_albuma 
                                     JOIN izvodjac i ON a.id_izvodjaca = i.id_izvodjaca 
                                     LIMIT 10");
                
                while ($row = $stmt->fetch()) {
                    echo "<div class='card'>";
                    echo "<h3>" . htmlspecialchars($row['naslov']) . "</h3>";
                    echo "<p>" . htmlspecialchars($row['izvodjac']) . "</p>";
                    echo "</div>";
                }
                ?>
            </section>
        </main>
    </div>
</body>
</html>