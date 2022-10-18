<?php 
    
    require_once "./app/models/users.model.php";
    require_once "./app/views/auth.view.php";
    
    
    class authController{
        private $view;
        private $model;
        
        public function __construct() {
            $this->model = new usersModel();
            $this->view = new authView();
        }
    
        public function showFormLogin() {
            $this->view->showFormLogin();
        }
    
        public function validateUser() {
            if(!empty($_POST['username'])&& !empty($_POST['password'])){
                $username = $_POST['username'];
                $password = $_POST['password'];
            }

            $user = $this->model->getUserByUsername($username);
    
            if ($user && password_verify($password,($user->password))) {
                session_start();
                $_SESSION['USER_ID'] = $user->id;
                $_SESSION['USER_USERNAME'] = $user->username;
                $_SESSION['IS_LOGGED'] = true;
    
                header("Location: " . BASE_URL."cars");
            } else {
               $this->view->showFormLogin("El usuario o la contraseña no existe.");
            } 
        }
    
        public function logout() {
            session_start();
            session_destroy();
            header("Location: " . BASE_URL);
        }


    }


?>