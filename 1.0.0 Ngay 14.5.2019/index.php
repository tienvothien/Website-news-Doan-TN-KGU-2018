	<?php 
   		session_start();
    	if (isset($_SESSION['tendangnhap']) && isset($_SESSION['idtk'])){
          
   		}   		
   		else{
        $_SESSION['tendangnhap']="Khách";
   			$_SESSION['capdotruycap']="";
        $_SESSION['idtk']="";
   			
   		}
		echo "<link rel='shortcut icon' type='image/jpg' href='IMG/huyhieudoan.jpg'/>";
		include("menutop.php");	
		include("noidung_index.php");
    include("thongbao_index.php")	;    
		include("bottom.php");	
	?>	