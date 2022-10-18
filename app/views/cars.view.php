<?php 

require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

    class carsView{

        private $smarty;

        public function __construct (){
            $this->smarty = new Smarty();
        }

        public function showCars($cars){
            
            $this->smarty->assign('cars',$cars);

            $this->smarty->display('carsList.tpl');

        }


        public function showForm($action,$categories){
            $this->smarty->assign('categories', $categories);
            $this->smarty->assign('action', $action);
            $this->smarty->display('form.tpl');
        }


        public function showFormEdit($categories,$car,$action){
            $this->smarty->assign('categories',$categories);
            $this->smarty->assign('car',$car);
            $this->smarty->assign('action',$action);
            $this->smarty->display('form.tpl');
        }
        
    };    

?>