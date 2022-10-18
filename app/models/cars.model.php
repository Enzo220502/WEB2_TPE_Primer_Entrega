<?php 

    class carsModel {
        
        private $db;

        public function __construct() {
            $this->db = new PDO('mysql:host=localhost;'.'dbname=catalogo_de_vehiculos;charset=utf8', 'root', '');
        }


        public function getCars(){
            $query = $this->db->prepare("SELECT * FROM vehicles");
            $query->execute();
            
            $cars = $query->fetchAll(PDO::FETCH_OBJ);

            return $cars;
        }

        public function insertCar($nameVehicle,$typeEngine,$typeVehicle,$priceVehicle,$colorVehicle,$descVehicle,$imgVehicle){

            $query = $this->db->prepare ("INSERT INTO vehicles(name,type_engine,id_type_vehicle,price,color,especifications,image_car) VALUES(?,?,?,?,?,?,?)");
            $query->execute([$nameVehicle,$typeEngine,$typeVehicle,$priceVehicle,$colorVehicle,$descVehicle,$imgVehicle]);
        
            $idLast = $this->db->lastInsertId(); 
            return $idLast;
        }

        public function dropCar($id){
            $query = $this->db->prepare("DELETE FROM vehicles WHERE ID = ?");
            $query->execute([$id]);

        }

        public function getCarById($id){
            $query = $this->db->prepare("SELECT * FROM vehicles WHERE ID = ?");
            $oneCar = $query->execute([$id]);
            $oneCar = $query->fetch(PDO::FETCH_OBJ);

            return $oneCar;
        }

        public function uploadCar($nameVehicle,$typeEngine,$typeVehicle,$priceVehicle,$colorVehicle,$descVehicle,$imgVehicle,$ID){
            $query = $this->db->prepare("UPDATE vehicles SET name = ?,type_engine = ?,id_type_vehicle = ?,price = ?,color = ?,especifications = ?, image_car = ? WHERE ID = ?");
            $query->execute([$nameVehicle,$typeEngine,$typeVehicle,$priceVehicle,$colorVehicle,$descVehicle,$imgVehicle,$ID]);
        }



        
    }


?>