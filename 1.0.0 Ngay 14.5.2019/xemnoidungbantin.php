	<link rel="stylesheet" type="text/css" href="./css/noidung_index_css.css">
  <link rel="stylesheet" type="text/css" href="./css/xemnoidungbantin_css.css">
  <link rel="shortcut icon" type="image/jpg" href="IMG/huyhieudoan.jpg">
  <?php 
   		session_start();
    	if (isset($_SESSION['tendangnhap']) ) {
           
   		}   		
   		else{
   			$_SESSION['tendangnhap']="Khách";
   			$_SESSION['capdotruycap']="";
   			
   		}		
		include("menutop.php");	
		?>
     <div class="noidung-bt-1">   
        <?php 
          $idtin = $_GET['idtin'];
          include('conn.php');
          $sql11="select * from goibantin where idtingoi='".$idtin."'";
          $query11 = mysqli_query($con,$sql11);
          $row=mysqli_fetch_array($query11); 

          $tieude = $row['tieude'];
          $avata = $row['avata'];
          $trichdan = $row['trichdan'];
          $loaitin = $row['maloaitin'];
          $thoigian = $row['ngaygoi'];
          $noidung = $row['noidung'];   
          echo "
            <div class='hiennoidung-bt-1'>
              <table class='table-noidung-bt-1'>
                <tr>
                  <th class ='chu-tieude-bt'>$tieude</th>              
                </tr>
                <tr>
                  <td style='text-align:left;'>
                    <lable class='mauchu-bt'>"; echo date('d-m-Y', strtotime($thoigian)); echo " </lable>
                  </td>
                </tr>
                  <td class='td-2-2 chu-trichdan-bt-1'><h3>$trichdan<h3></td>

                <tr>
                  <td class='td-2-2' style='text-align:center;'><img class='img' src='./img/$avata' alt=''></td>
                </tr>
                <tr>
                  <td class='td-2-2 chu-noidung-bt-1'>$noidung</td>
                </tr>
              </table>
            </div>
          <br>
          ";
       ?>
  </div>

    <?php

    include("thongbao_index.php")	;    
		include("bottom.php");	
	?>	