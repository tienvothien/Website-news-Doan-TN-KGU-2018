<?php 
	session_start();
    if (isset($_SESSION['tendangnhap']) && $_SESSION['capdotruycap']==2 || $_SESSION['capdotruycap']==10) {
           
   	}else{
      	if(isset($_SESSION['tendangnhap']) && $_SESSION['capdotruycap']!=10 && $_SESSION['capdotruycap']!=2){
   				header("location:../index.php");
   				exit();
   		}else{   			
   			header("location:dangnhap.php");
   			exit();
   		}
   	}
	if (isset($_POST['suatieude'])) {
		include("conn.php");		
		$idtinsua =$_SESSION['idtinsua'];
		$tieudesua = $_POST['tieudesua'];
		$update_tieude ="UPDATE goibantin SET tieude = '".$tieudesua."' WHERE idtingoi = '".$idtinsua."'";
		if (mysqli_query($con,$update_tieude)) {
			echo "
				<script type='text/javascript'>
					alert('Update thành công');
					history.back(-1)
				</script>";

		}else{
			echo "
				<script type='text/javascript'>
					alert('Update thất bại');
				</script>";
		}

	}
 ?>