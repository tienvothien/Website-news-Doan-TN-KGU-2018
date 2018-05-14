	<?php 
   		session_start();
    	if (isset($_SESSION['tendangnhap']) && $_SESSION['capdotruycap']==2) {
           
   		}elseif(isset($_SESSION['tendangnhap']) && $_SESSION['capdotruycap']==10){
   				header("location:../index.php");
   				exit();
   		}
   		else{   			
   			header("location:dangnhap.php");
   			exit();
   		}
	 ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Quản lý loại tin</title>
	<link rel="stylesheet" href="">
</head>
<body>
	
</body>
</html>