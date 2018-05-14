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
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Quan trị hệ thống</title> 
  <link rel="shortcut icon" type="image/jpg" href="../IMG/huyhieudoan.jpg"/>
  <link rel="stylesheet" type="text/css" href="./css/noidungthaydoi_qt_css.css">
 
</head>
<body>
  
</body>
</html>

	 <div style="width: 90%; margin: auto;">			
				<?php 
				include("top_qt.php");
				include("menu_web_ql_left.php");
			
          include("conn.php");
          $sql1="select count(*) as sobai from bantin";
          $query1=mysqli_query($con,$sql1);
          $row1=mysqli_fetch_array($query1);
          $dem=$row1['sobai'];
          $sql2="select count(*) as sotk from taikhoan";
          $query2=mysqli_query($con,$sql2);
          $row2=mysqli_fetch_array($query2);
          $sotk=$row2['sotk'];
          $q3 = "select count(*) as sovanban from vanban";
          $q3 = mysqli_query($con,$q3);
          $r3 = mysqli_fetch_array($q3);
          $sovanban =$r3['sovanban'];
          $q4 = "select count(*) as sobaigoi from goibantin";
          $q4 = mysqli_query($con,$q4);
          $r4 = mysqli_fetch_array($q4);
          $sobaigoi =$r4['sobaigoi'];

        ?>
          <div class="thaydoi">
            <div class="title">
              <br>
              <h2>Trang Quản trị hệ thống</h2>
            </div>
            <div class="noidungthaydoi">
              <div class="mot">
                <ul>
                  <h3 >
                    <li style="background-color:#f93b0c"><a href="" title="">Tổng số bản tin: 
                    <?php echo $dem; ?>
                    </a>
                    </li>
                  </h3>
                  <h3>
                    <li style="background-color:#ff99cc"><a href="ql_bantin.php" title="">Tổng số bản tin đã gởi: 
                    <?php echo $sobaigoi; ?>
                    </a>
                    </li>
                  </h3>
                  <h3>
                    <li style="background-color: #3399ff"> 
                      <a href="" title="">Tổng số văn bản: <?php echo $sovanban; ?></a>
                    </li>
                  </h3>
                  <h3 >
                    <li style="background-color: #ff9900">
                      <a href="ql_nguoidung.php" title="">Tổng số người dùng : <?php echo $sotk; ?></a>         
                    </li>
                  </h3>
                </ul>
              </div>
             </div>
          </div>
        <?php
				include("bottom_qt.php");	 
	 ?>
</div>