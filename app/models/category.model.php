<?php 

    class categoriesModel{
            
        private $db;

        public function __construct() {
            $this->db = new PDO('mysql:host=localhost;'.'dbname=catalogo_de_vehiculos;charset=utf8', 'root', '');
        }


        public function getCategories(){
            $query = $this->db->prepare("SELECT * FROM types_of_vehicles");
            $query->execute();
            
            $categories = $query->fetchAll(PDO::FETCH_OBJ);

            return $categories;
        }


        
        public function getById($id){
            $query = $this->db->prepare("SELECT * FROM types_of_vehicles WHERE ID = ?");
            $query->execute([$id]);
            
            $category = $query->fetch(PDO::FETCH_OBJ);

            return $category;
        }






    
    }


?>