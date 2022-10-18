<?php 

require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

    class categoriesView{

        private $smarty;

        public function __construct (){
            $this->smarty = new Smarty();
        }

        public function showCategories($categories){
            $this->smarty->assign('categories',$categories);
            $this->smarty->display('form.tpl');

        }
        
    };    

?>