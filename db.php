<?php
$host = 'localhost';
$db   = 'streamtune_db'; // Ime tvoje baze
$user = 'root';          // Default XAMPP korisnik
$pass = '';              // Default XAMPP lozinka
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
try {
     $pdo = new PDO($dsn, $user, $pass);
} catch (\PDOException $e) {
     throw new \PDOException($e->getMessage(), (int)$e->getCode());
}
?>