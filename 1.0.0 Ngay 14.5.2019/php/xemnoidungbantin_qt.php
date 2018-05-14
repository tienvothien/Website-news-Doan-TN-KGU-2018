	<link rel="stylesheet" type="text/css" href="../css/noidung_index_css.css">
  <link rel="stylesheet" type="text/css" href="../css/xemnoidungbantin_css.css">
  <link rel="stylesheet" type="text/css" href="../css/xemnoidungbantin_qt_css.css">
  <link rel="shortcut icon" type="image/jpg" href="../IMG/huyhieudoan.jpg">
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
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>
<script type="text/javascript" charset="utf-8" async defer>
  function suatieude(){         
    $("#divtieude").show();
    $("#divnd").hide();
    $("#divsuatrichdan").hide();
    $("#divavata").hide();
    $("#divsuanoidung").hide();
   };

  function suatrichdan(){         
    $("#divnd").hide();
    $("#divtieude").hide();
    $("#divsuatrichdan").show(); 
    $("#divavata").hide(); 
    $("#divsuanoidung").hide();  
   };
  function suaavata(){         
    $("#divnd").hide();
    $("#divtieude").hide();
    $("#divsuatrichdan").hide();
    $("#divsuanoidung").hide();  
    $("#divavata").show();   
   };
  function suanoidung(){         
    $("#divnd").hide();
    $("#divtieude").hide();
    $("#divsuatrichdan").hide();  
    $("#divavata").hide();
    $("#divsuanoidung").show();    
   };
    function trolai1(){         
    $("#divnd").show();
    $("#divtieude").hide();
    $("#divsuatrichdan").hide(); 
    $("#divavata").hide(); 
    $("#divsuanoidung").hide();   
   };
</script>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Xem chi tiết nội dung</title>
  <link rel="stylesheet" type="text/css" href="../css/noidung_index_css.css">
  <link rel="stylesheet" type="text/css" href="../css/xemnoidungbantin_css.css">
  <link rel="stylesheet" type="text/css" href="../css/xemnoidungbantin_qt_css.css">
  <link rel="shortcut icon" type="image/jpg" href="../IMG/huyhieudoan.jpg">
</head>
<body>
  

    <div style="width: 90%; margin: auto;">
      <?php		
    		include("top_qt.php");
        include("menu_web_ql_left.php");	
  		?>
      <div  class="noidung-tin-qt-0">
        <div id="divnd">
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
              <div class='hien-noidung-tin-qt'>
                <table class='noidung-tin-qt'>
                  <tr>
                    <td class ='table-td-1 chu-tieude-bt'><h3>$tieude</h3></td>     
                    <td class='table-td-2 sua-bt'><p onclick ='suatieude()'> Sữa tiêu đề</p></td>         
                  </tr>
                  <tr>
                    <td style='text-align:left;'>
                      <lable class='mauchu-bt'>"; echo date('d-m-Y', strtotime($thoigian)); echo " </lable>
                    </td>
                   
                  </tr>
                    <td class=' chu-trichdan-bt-1'><h3>$trichdan<h3></td>
                    <td class='table-td-2 sua-bt'><p onclick='suatrichdan()'> Sữa trích dẫn</p></td>         
                    
                  <tr>
                    <td class='' style='text-align:center;'><img class='kichthuoc-img-chitiet' src='../img/$avata' alt=''></td>
                    <td class='table-td-2 sua-bt'><p onclick='suaavata()'> Sữa ảnh bìa</p></td>         
                    
                  </tr>
                  <tr>
                    <td class=' chu-noidung-bt-2'>$noidung</td>
                    <td class='table-td-2 sua-bt'><p  onclick ='suanoidung()'> Sữa nội dung</p></td>         
                    
                  </tr>
                </table>
              </div>
            <br>
            ";
          ?>
        </div>
        <div id="divtieude" class="div-tieude-suatin">
          <h2 style="text-align: center;">Sữa tiêu đề</h2>
          <form action="suatieude.php" method="POST" accept-charset="utf-8">
            <table class="table-suatin">
                  <?php echo $idtin; $_SESSION['idtinsua'] = $idtin;
                  ?>               
              <tr>
                <th>Tiêu đề cũ:</th>
                <td><?php echo $tieude;
                 ?></td>
              </tr>
              <tr>
                <th>Tiêu đề mới:</th>
                <td><textarea required name="tieudesua" cols="80" rows="5"><?php echo $tieude; ?></textarea></td>
              </tr>
              <tr>
                <td colspan="2" class="table-nut-td">
                  <br>
                  <input type="submit" name="suatieude" value="Sữa tiêu đề">
                  <input type="button" name="trolai" value="trở lại" onclick="trolai1()"> 
                </td>
              </tr>
            </table>

          </form>
        </div>
        <div id="divsuatrichdan" class="div-tieude-suatin">
          <h2 style="text-align: center;">Sữa trích dẫn</h2>
          <form action="suatieude.php" method="POST" accept-charset="utf-8">
            <table class="table-suatin">              
                  <?php echo $idtin; $_SESSION['idtinsua'] = $idtin;
                  ?>               
              <tr>
                <th>Trích dẫn cũ:</th>
                <td><?php echo $trichdan;
                 ?></td>
              </tr>
              <tr>
                <th>Trích dẫn mới:</th>
                <td><textarea required name="trichdansua" cols="80" rows="7"><?php echo $trichdan; ?></textarea></td>
              </tr>
              <tr>
                <td colspan="2" class="table-nut-td">
                  <br>
                  <input type="submit" name="suatrichdan" value="Sữa trích dẫn">
                  <input type="button" name="trolai" value="trở lại" onclick="trolai1()"> 
                </td>
              </tr>
            </table>

          </form>
        </div>
        <div id="divavata" class="div-tieude-suatin">
          <h2 style="text-align: center;">Sữa ảnh bìa</h2>
          <form action="suatieude.php" method="POST" accept-charset="utf-8">
            <table class="table-suatin">
              
                  <?php echo $idtin; $_SESSION['idtinsua'] = $idtin;
                  ?>               
              <tr>
                <th>Ảnh bìa cũ:</th>
                <td style="text-align: center;"><img class="kichthuoc-img-sua" src="../IMG/<?php echo $avata;
                 ?>" alt=""></td>
              </tr>
              <tr>
                <th>Chọn ảnh bìa mới:</th>
                <td ><input style="font-size: 20px;" type="file" name="suaavata" value="" placeholder=""></td>
              </tr>
              <tr>
                <td colspan="2" class="table-nut-td">
                  <br>
                  <input type="submit" name="suatrichdan" value="Sữa trích dẫn">
                  <input type="button" name="trolai" value="trở lại" onclick="trolai1()"> 
                </td>
              </tr>
            </table>

          </form>
        </div>
         <div id="divsuanoidung" class="div-tieude-suatin">
            <h2 style="text-align: center;">Sữa nội dung</h2>
            <form action="suatieude.php" method="POST" accept-charset="utf-8">
              <table class="table-suatin">              
                    <?php echo $idtin; $_SESSION['idtinsua'] = $idtin;
                    ?>               
                <tr>
                  <th>Nội dung cũ:</th>
                  <td><?php echo $noidung; ?></td>
                </tr>
                <tr>
                  <th>Nội dung mới:</th>
                  <td><textarea required name="trichdansua" cols="80" rows="20"><?php echo $noidung; ?></textarea></td>
                </tr>
                <tr>
                  <td colspan="2" class="table-nut-td">
                    <br>
                    <input type="submit" name="suatrichdan" value="Sữa trích dẫn">
                    <input type="button" name="trolai" value="trở lại" onclick="trolai1()"> 
                  </td>
                </tr>
              </table>

            </form>
        </div>
      </div>
      
      <?php 
		    include("bottom_qt.php");	
      ?>
  </div>
</body>
</html>