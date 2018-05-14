<?php
   	session_start();
    if (isset($_SESSION['tendangnhap']) && $_SESSION['capdotruycap']==2 || $_SESSION['capdotruycap']==10) {
           
   	}else
     if(isset($_SESSION['tendangnhap']) && $_SESSION['capdotruycap']!=10 && $_SESSION['capdotruycap']!=2){
   		header("location:../index.php");
   		exit();
   	}
   	else{   			
   		header("location:dangnhap.php");
   		exit();
   	} 
	include("conn.php");
	$idtkdn = $_SESSION['idtk'];
	$capdotruycap = $_SESSION['capdotruycap'];
	$idtin = $_GET['idtin'];
	$del = "DELETE FROM goibantin WHERE idtingoi ='".$idtin."' and (idtk = '".$idtkdn."' or capdotruycap >= '".$capdotruycap."') ";
	if (mysqli_query($con, $del)) {
		echo "	<script type='text/javascript'>
					alert('Xóa bản tin thành công');
				</script>";
		header("location:ql_bantin.php");
	}
	else{
		$_SESSION['thongbaoloi'] ="Không đủ quyền để xóa";
		echo "	<script type='text/javascript'>
					alert('Xóa bản tin thành công');
				</script>";
		header("location:xoabantin_qt.php?idtin=$idtin");
	}
?>