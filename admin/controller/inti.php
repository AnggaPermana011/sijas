<?php
$con->auth();
$conn=$con->koneksi();
switch(@$_GET['page']){
    case 'add';
        $sql="SELECT* FROM jasa";
        $jasa=$conn->query($sql);
        $content="views/inti/tambah.php";
        include_once 'views/template.php';
    break;
    case 'save';
        if($_SERVER['REQUEST_METHOD']=="POST"){
            //validasi
            if(empty($_POST['nama_penyedia'])){
                $err['nama_penyedia']="Wajib ISI Nama Penyedia";
            }
            if(!is_numeric($_POST['no_hp'])){
                $err['no_hp']="No HP Wajib Angka";
            }
            if(empty($_POST['alamat'])){
                $err['alamat']="Wajib ISI Alamat";
            }
            if(!is_numeric($_POST['id_jasa'])){
                $err['id_jasa']="Wajib PILIH JASA";
            }
            if(!isset($err)){
                $id_admin=$_SESSION['login']['id'];
                if(!empty($_POST['id_penyedia'])){
                //update
                $sql="UPDATE penyediajasa set nama='$_POST[nama_penyedia]',no_hp='$_POST[no_hp]', alamat='$_POST[alamat]',
                id_jasa='$_POST[id_jasa]',id_admin=$id_admin where md5(id_penyedia)='$_POST[id_penyedia]'";
                }else{
                //input
                $sql = "INSERT INTO penyediajasa (nama, no_hp, alamat, id_jasa, id_admin)
                VALUES ('$_POST[nama_penyedia]', '$_POST[no_hp]','$_POST[alamat]','$_POST[id_jasa]',
                $id_admin)";
                }
                    if ($conn->query($sql) === TRUE) {
                    header('location: '.$con->site_url().'/admin/index.php?mod=inti');
                    } else {
                        $err['msg']="Error: " . $sql . "<br>" . $conn->error;
                    }
            }
        }else{
            $err['msg']="tidak diijinkan";
        }
        if(isset($err)){
            $sql="SELECT* FROM jasa";
            $jasa=$conn->query($sql);
            $content="views/inti/tambah.php";
            include_once 'views/template.php';
        }
    break;
    case 'edit';
        $penyedia ="SELECT* FROM penyediajasa where md5(id_penyedia)='$_GET[id]'";
        $penyedia=$conn->query($penyedia);
        $_POST=$penyedia->fetch_assoc();
        $_POST['nama_penyedia']=$_POST['nama'];
        $_POST['id_penyedia']=md5($_POST['id_penyedia']);
        //var_dump($penyedia);
        $sql="SELECT* FROM jasa";
        $jasa=$conn->query($sql);
        $content="views/inti/tambah.php";
        include_once 'views/template.php';
    break;
    case 'delete';
        $penyedia ="DELETE FROM penyediajasa where md5(id_penyedia)='$_GET[id]'";
        $penyedia=$conn->query($penyedia);
        header('location: '.$con->site_url().'/admin/index.php?mod=inti');
    break;
    default:
        $sql="SELECT* FROM penyediajasa INNER JOIN jasa ON penyediajasa.id_jasa = jasa.id_jasa;";
        $penyedia=$conn->query($sql);
        $conn->close();
        $content="views/inti/tampil.php";
        include_once 'views/template.php';
}
?>