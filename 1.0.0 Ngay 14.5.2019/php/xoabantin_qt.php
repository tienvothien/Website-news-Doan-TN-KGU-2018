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
      if (isset($_POST['xoatin'])) {
        echo "idtin xóa  ".$idtin;
      }
  ?>
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Xóa bản tin</title>
    <link rel="stylesheet" href="">
    <link rel="stylesheet" type="text/css" href="../css/noidung_index_css.css">
    <link rel="stylesheet" type="text/css" href="../css/xemnoidungbantin_css.css">
    <link rel="stylesheet" type="text/css" href="../css/xemnoidungbantin_qt_css.css">
    <link rel="stylesheet" type="text/css" href="../css/xoabantin_css.css">
    <link rel="shortcut icon" type="image/jpg" href="../IMG/huyhieudoan.jpg">
  </head>
  <body>
    <div style="width: 90%; margin: auto;">
      <?php		
    		include("top_qt.php");
        include("menu_web_ql_left.php");	
  		?>
      <div  class="noidung-tin-qt-0">
        <div id="div1">
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
            $capdotruycap = $row['capdotruycap']; 
            echo "
              <div class='hien-noidung-tin-qt'>                
                <table class='noidung-tin-qt'>
                  <tr>
                    <td class ='table-td-1 chu-tieude-bt'><h3>$tieude</h3></td>     
                  </tr>
                  <tr>
                    <td style='text-align:left;'>
                      <lable class='mauchu-bt'>"; echo date('d-m-Y', strtotime($thoigian)); echo " </lable>
                    </td>
                   
                  </tr>
                    <td class=' chu-trichdan-bt-1'><h3>$trichdan<h3></td>
                  <tr>
                    <td class='' style='text-align:center;'><img class='img' src='../img/$avata' alt=''></td>
                  </tr>
                  <tr>
                    <td class=' chu-noidung-bt-2'>$noidung</td>
                  </tr>
                </table>
              </div>
            <br>
            <div id='div2' class='class-div2'>
              <br><br>
              <form action='xoa.php?idtin=$idtin' method='POST' accept-charset='utf-8'>
                <table class='noidung-tin-qt'>
                  <tr>
                    <td style='width:100%;text-align: center;'><input type='submit' name='xoatin' value='Xóa bản tin' class='nt-xoabantin'> 
                      <a href='web_quantri.php' title=''> 
                        <input type='submit' name='xoatin' value='Trở lại' class='nt-trolaibantin'>
                      </a>
                   </td>
                  </tr>
                </table>
              </form> 
               <br><br>
               <br><br>
            </div>
            ";
          ?>
        </div>
      </div>
      
      <?php 
		    include("bottom_qt.php");	
      ?>
  </div>
  </body>
</html>