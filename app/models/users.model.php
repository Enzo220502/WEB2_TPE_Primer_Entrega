<?php 

    class usersModel{
        
        private $db;

        public function __construct() {
            $this->db = new PDO('mysql:host=localhost;'.'dbname=catalogo_de_vehiculos;charset=utf8', 'root', '');
        }

        public function getUserByUsername($username){
            $query = $this->db->prepare("SELECT * FROM users WHERE username =  ? ");
            $query->execute([$username]);
            $user = $query->fetch(PDO::FETCH_OBJ);
            return $user;
        }

    }



?>
