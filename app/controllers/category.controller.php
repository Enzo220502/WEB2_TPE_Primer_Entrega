<?php 

    require_once './app/models/category.model.php';
    require_once './app/views/category.view.php';

    class categoryController{
        private $model;
        private $view;

        public function  __construct(){
            $this->model = new categoriesModel();
            $this->view = new categoriesView();
        }

        public function getAllCategories(){
            $categories = $this->model->getCategories();
            return $categories;
        }
    }


?>