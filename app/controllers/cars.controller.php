<?php 

    require_once './app/models/cars.model.php';
    require_once './app/views/cars.view.php';
    require_once './app/helpers/auth.helper.php';

    class carController {
        private $model;
        private $view;
    
        public function __construct() {
            $this->model = new carsModel();
            $this->view = new carsView();
        }

        public function showFormLogin() {
            $this->view->showFormLogin();

        }

        public function viewCars(){
            $cars = $this->model->getCars();
            $categoryModel= new categoriesModel();
            foreach ($cars as $car) {
                $category = $categoryModel->getById($car->id_type_vehicle);
                $car->type = $category->type;
            }
            $this->view->showCars($cars);
        }

        public function showFormAddCar($categories){
            $action  = "add";
            $this->view->showForm($action,$categories);
        }


        public function addCar(){            
            $nameVehicle = $_POST['nameVehicle'];
            $typeEngine =  $_POST['typeEngine'];
            $typeVehicle =  $_POST['typeVehicle'];
            $priceVehicle =  $_POST['priceVehicle'];
            $colorVehicle =  $_POST['colorVehicle'];
            $descVehicle =  $_POST['descVehicle'];
            $imgVehicle =  $_POST['imgVehicle'];

            $id = $this->model->insertCar($nameVehicle,$typeEngine,$typeVehicle,$priceVehicle,$colorVehicle,$descVehicle,$imgVehicle);
            
            header("Location: " . BASE_URL. "cars?");
        }


        public function deleteCar($id){
            $this->model->dropCar($id);
            header("Location: " . BASE_URL);
        }

        public function getCar($id){
            $carToModify = $this->model->getCarById($id);
            $categoryModel= new categoriesModel();
            $category = $categoryModel->getById($carToModify->id_type_vehicle);
            $carToModify->type = $category->type;
            return  $carToModify;
        }

        public function showFormEditCar($categories,$car){
            $action = "modify";
            $this->view->showFormEdit($categories,$car,$action);
        }

        public function editCar($id){
            $nameVehicle = $_POST['nameVehicle'];
            $typeEngine =  $_POST['typeEngine'];
            $typeVehicle =  $_POST['typeVehicle'];
            $priceVehicle =  $_POST['priceVehicle'];
            $colorVehicle =  $_POST['colorVehicle'];
            $descVehicle =  $_POST['descVehicle'];
            $imgVehicle =  $_POST['imgVehicle'];
            $ID = $_POST['ID'];
            
            $this->model->uploadCar($nameVehicle,$typeEngine,$typeVehicle,$priceVehicle,$colorVehicle,$descVehicle,$imgVehicle,$ID);

            header("Location: ". BASE_URL);

        }






    }

?>