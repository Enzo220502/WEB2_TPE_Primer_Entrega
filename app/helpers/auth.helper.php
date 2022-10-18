<?php

    class authHelper {

        public function checkLoggedIn() {
            session_start();
            if (!isset($_SESSION['IS_LOGGED'])) {
                header("Location: " . BASE_URL . 'login');
                die();
            }
    } 
}