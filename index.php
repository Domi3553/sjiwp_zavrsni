<?php include 'db.php'; ?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StreamTune | Tvoja Glazba</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="app-container">
        <!-- SIDEBAR -->
        <nav class="sidebar">
            <div class="logo">StreamTune</div>
            <ul>
                <li class="active"><i class="fas fa-home"></i> Naslovnica</li>
                <li><i class="fas fa-search"></i> Pretraživanje</li>
                <li><i class="fas fa-book"></i> Moja biblioteka</li>
            </ul>
        </nav>

        <!-- MAIN -->
        <main class="main-content">
            <header>
                <div class="user-profile">
                    <i class="fas fa-user-circle"></i> Dobrodošao!
                </div>
                <div class="search-box">
                    <i class="fas fa-search"></i>
                    <input type="text" id="search-input" placeholder="Pretraži pjesme ili izvođače...">
                </div>
            </header>

            <h2 class="section-title">Preporučeno za tebe</h2>
            <div class="song-grid" id="song-grid">
                <?php
                $stmt = $pdo->query("SELECT p.naslov, i.ime as izvodjac 
                                     FROM pjesma p 
                                     JOIN album a ON p.id_albuma = a.id_albuma 
                                     JOIN izvodjac i ON a.id_izvodjaca = i.id_izvodjaca 
                                     LIMIT 8");
                while ($row = $stmt->fetch()) {
                    $title = htmlspecialchars($row['naslov']);
                    $artist = htmlspecialchars($row['izvodjac']);
                    echo "<div class='card'>
                            <div class='card-img'>
                                <i class='fas fa-music'></i>
                            </div>
                            <h3>{$title}</h3>
                            <p>{$artist}</p>
                            <button class='play-btn'><i class='fas fa-play'></i></button>
                          </div>";
                }
                ?>
            </div>
        </main>
    </div>

    <!-- PLAYER BAR -->
    <footer class="player-bar">
        <div class="song-info">
            <div class="now-playing-icon">
                <i class="fas fa-music"></i>
            </div>
            <div class="song-details">
                <div class="title">Odaberi pjesmu...</div>
                <div class="artist">--</div>
            </div>
        </div>

        <div class="player-controls">
            <div class="controls">
                <button id="like-btn"><i class="far fa-heart"></i></button>
                <button id="prev-btn"><i class="fas fa-step-backward"></i></button>
                <button id="play-pause-btn"><i class="fas fa-play"></i></button>
                <button id="next-btn"><i class="fas fa-step-forward"></i></button>
                <button id="shuffle-btn"><i class="fas fa-random"></i></button>
            </div>
            <div class="progress-container">
                <span class="time" id="current-time">0:00</span>
                <div class="progress-bar">
                    <div class="progress-fill"></div>
                </div>
                <span class="time" id="duration">0:30</span>
            </div>
        </div>

        <div class="extra-controls">
            <i class="fas fa-list-ul"></i>
            <i class="fas fa-volume-up"></i>
        </div>
    </footer>

    <script src="script.js"></script>
</body>
</html>