<?php

class Database {
    private $host = "localhost";
    private $db_name = "easybee_projet3";
    private $username = "easybee_projet3";
    private $password = "Yrgm8Knu8-tDoOUM";
    public $conn;

    public function getBdd() {
        $this->conn = null;

        try {
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch(PDOException $exception) {
            echo "Connection error: " . $exception->getMessage();
        }

        return $this->conn;
    }
}
