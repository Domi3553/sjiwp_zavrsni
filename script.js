document.querySelectorAll('.card').forEach(card => {
    card.addEventListener('click', () => {
        // Efekt kada klikneš na karticu
        card.style.borderColor = "#1db954";
        alert("Pjesma je dodana u red čekanja!");
    });
});

const likeBtn = document.getElementById('like-btn');
likeBtn.addEventListener('click', () => {
    likeBtn.style.color = "red";
    likeBtn.innerHTML = "♥";
});
const cards = Array.from(document.querySelectorAll('.card'));
const songs = cards.map((card, index) => ({
    title: card.querySelector('h3').textContent,
    artist: card.querySelector('p').textContent,
    element: card
}));
document.addEventListener('DOMContentLoaded', () => {
  // ------ ELEMENTI ------
  const cards = Array.from(document.querySelectorAll('.card'));
  const playerBar = document.querySelector('.player-bar');
  const nowPlayingIcon = playerBar.querySelector('.now-playing-icon i');
  const playerTitle = playerBar.querySelector('.title');
  const playerArtist = playerBar.querySelector('.artist');
  const playPauseBtn = document.getElementById('play-pause-btn');
  const prevBtn = document.getElementById('prev-btn');
  const nextBtn = document.getElementById('next-btn');
  const likeBtn = document.getElementById('like-btn');
  const progressBar = document.querySelector('.progress-bar');
  const progressFill = document.querySelector('.progress-fill');
  const currentTimeEl = document.getElementById('current-time');
  const durationEl = document.getElementById('duration');
  const searchInput = document.getElementById('search-input');
  const songGrid = document.querySelector('.song-grid');

  // ------ STATE ------
  let songs = [];
  let currentIndex = 0;
  let isPlaying = false;
  let progressInterval;
  let currentProgress = 0; // u sekundama
  const SONG_DURATION = 30; // simulirano trajanje 30s

  // Inicijalizacija liste pjesama iz DOM-a
  cards.forEach((card, index) => {
    const title = card.querySelector('h3').textContent;
    const artist = card.querySelector('p').textContent;
    songs.push({ title, artist, element: card, index });
  });

  // Ažuriranje player bara
  function updatePlayerUI() {
    const song = songs[currentIndex];
    if (song) {
      playerTitle.textContent = song.title;
      playerArtist.textContent = song.artist;
      // Mijenjamo ikonu albuma (ostaje nota, ali možeš prilagoditi)
      nowPlayingIcon.className = 'fas fa-music';
      // Označi aktivnu karticu
      cards.forEach(c => c.classList.remove('playing'));
      song.element.classList.add('playing');
      // Like stanje iz localStorage
      const likedSongs = JSON.parse(localStorage.getItem('likedSongs')) || [];
      if (likedSongs.includes(song.title)) {
        likeBtn.classList.add('liked');
        likeBtn.innerHTML = '<i class="fas fa-heart"></i>';
      } else {
        likeBtn.classList.remove('liked');
        likeBtn.innerHTML = '<i class="far fa-heart"></i>';
      }
    }
  }

  // Pauziranje
  function pauseSong() {
    isPlaying = false;
    clearInterval(progressInterval);
    playPauseBtn.innerHTML = '<i class="fas fa-play"></i>';
  }

  // Reprodukcija
  function playSong() {
    if (songs.length === 0) return;
    isPlaying = true;
    playPauseBtn.innerHTML = '<i class="fas fa-pause"></i>';
    // Ako je progress došao do kraja, reset
    if (currentProgress >= SONG_DURATION) {
      currentProgress = 0;
      progressFill.style.width = '0%';
      updateTimeDisplay();
    }
    progressInterval = setInterval(() => {
      if (currentProgress < SONG_DURATION) {
        currentProgress += 0.1; // 100ms korak
        const percent = (currentProgress / SONG_DURATION) * 100;
        progressFill.style.width = percent + '%';
        updateTimeDisplay();
      } else {
        // Kraj pjesme -> sljedeća automatski
        pauseSong();
        nextSong();
      }
    }, 100);
  }

  function updateTimeDisplay() {
    const mins = Math.floor(currentProgress / 60);
    const secs = Math.floor(currentProgress % 60);
    currentTimeEl.textContent = `${mins}:${secs.toString().padStart(2, '0')}`;
    const durMins = Math.floor(SONG_DURATION / 60);
    const durSecs = Math.floor(SONG_DURATION % 60);
    durationEl.textContent = `${durMins}:${durSecs.toString().padStart(2, '0')}`;
  }

  // Next / prev
  function nextSong() {
    if (songs.length === 0) return;
    currentIndex = (currentIndex + 1) % songs.length;
    currentProgress = 0;
    progressFill.style.width = '0%';
    updatePlayerUI();
    if (isPlaying) {
      clearInterval(progressInterval);
      playSong();
    }
  }

  function prevSong() {
    if (songs.length === 0) return;
    currentIndex = (currentIndex - 1 + songs.length) % songs.length;
    currentProgress = 0;
    progressFill.style.width = '0%';
    updatePlayerUI();
    if (isPlaying) {
      clearInterval(progressInterval);
      playSong();
    }
  }

  // Postavi pjesmu iz kartice
  function setSongByIndex(index) {
    currentIndex = index;
    currentProgress = 0;
    progressFill.style.width = '0%';
    updatePlayerUI();
    if (isPlaying) {
      clearInterval(progressInterval);
      playSong();
    } else {
      playSong(); // automatski play kad klikneš karticu
    }
  }

  // Event listeneri za kartice i play dugmiće unutar njih
  cards.forEach((card, idx) => {
    card.addEventListener('click', (e) => {
      // Ako je klik na play gumb unutar kartice, ne dupliciraj
      if (e.target.closest('.play-btn')) return;
      setSongByIndex(idx);
    });

    const cardPlayBtn = card.querySelector('.play-btn');
    cardPlayBtn.addEventListener('click', (e) => {
      e.stopPropagation();
      setSongByIndex(idx);
    });
  });

  // Kontrole playera
  playPauseBtn.addEventListener('click', () => {
    if (songs.length === 0) return;
    if (isPlaying) {
      pauseSong();
    } else {
      playSong();
    }
  });

  nextBtn.addEventListener('click', nextSong);
  prevBtn.addEventListener('click', prevSong);

  // Progress bar klik za seek
  progressBar.addEventListener('click', (e) => {
    const rect = progressBar.getBoundingClientRect();
    const clickX = e.clientX - rect.left;
    const width = rect.width;
    const seekPercent = (clickX / width) * 100;
    currentProgress = (seekPercent / 100) * SONG_DURATION;
    progressFill.style.width = seekPercent + '%';
    updateTimeDisplay();
  });

  // Like toggle sa localStorage
  likeBtn.addEventListener('click', () => {
    if (songs.length === 0) return;
    const songTitle = songs[currentIndex].title;
    let likedSongs = JSON.parse(localStorage.getItem('likedSongs')) || [];
    if (likedSongs.includes(songTitle)) {
      likedSongs = likedSongs.filter(t => t !== songTitle);
      likeBtn.classList.remove('liked');
      likeBtn.innerHTML = '<i class="far fa-heart"></i>';
    } else {
      likedSongs.push(songTitle);
      likeBtn.classList.add('liked');
      likeBtn.innerHTML = '<i class="fas fa-heart"></i>';
      // Animacija
      likeBtn.style.transform = 'scale(1.3)';
      setTimeout(() => likeBtn.style.transform = 'scale(1)', 200);
    }
    localStorage.setItem('likedSongs', JSON.stringify(likedSongs));
  });

  // Pretraga uživo
  searchInput.addEventListener('input', (e) => {
    const term = e.target.value.toLowerCase().trim();
    cards.forEach(card => {
      const title = card.querySelector('h3').textContent.toLowerCase();
      const artist = card.querySelector('p').textContent.toLowerCase();
      if (title.includes(term) || artist.includes(term)) {
        card.style.display = '';
      } else {
        card.style.display = 'none';
      }
    });
  });

  // Inicijalno postavi prvu pjesmu
  if (songs.length > 0) {
    updatePlayerUI();
    currentProgress = 0;
    updateTimeDisplay();
  }
});