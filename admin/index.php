<?php 
include_once '../config/Config.php';
$con = new Config();
if($con->auth()){
    //panggil fungsi
    switch (@$_GET['mod']){
        case 'inti':
            include_once 'controller/inti.php';
            break;
        default:
        include_once 'controller/beranda.php';
    }
}else{
    //panggil cont login
    include_once 'controller/login.php';
}
?>