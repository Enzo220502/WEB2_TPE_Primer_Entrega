<?php
require_once './app/controllers/cars.controller.php';
require_once './app/controllers/category.controller.php';
require_once './app/controllers/auth.controller.php';

define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

$action = 'cars'; // acción por defecto
if (!empty($_GET['action'])) {
    $action = $_GET['action'];
}

// parsea la accion Ej: dev/juan --> ['dev', juan]
$params = explode('/', $action);

$carController = new carController();
$categoryController = new categoryController();


// tabla de ruteo
switch ($params[0]) {
    case 'login':
        $authController = new authController();
        $authController->showFormLogin();
        break;
    case 'validate':
        $authController = new authController();
        $authController->validateUser();
        break;
    case 'logout':
        $authController = new authController();
        $authController->logout();    
    case 'cars':
        $carController = new carController();
        $carController->viewCars();
        break;
    case 'formAddCar':
        $categoryController = new categoryController();
        $categories = $categoryController->getAllCategories();
        $carController->showFormAddCar($categories);
        break;
    case 'add':
        $carController->addCar();
        break;
    case 'deleteCar':
        $carController = new carController();     
        $id = $params[1];
        $carController->deleteCar($id);
        break;
    case 'formModify':
        $categoryController = new categoryController();
        $categories = $categoryController->getAllCategories();
        $carController = new carController();
        $id = $params[1];
        $car = $carController->getCar($id);
        $carController->showFormEditCar($categories,$car);
        break;
    case 'modify':
        $carController = new carController();
        $id = $params[2];
        $carController->editCar($id);
        break;      
    case 'seeMore':
        $carController = new carController();
        $carController->seeMoreCar($id);
        break;    
    default:
        echo('404 Page not found');
        break;
}
