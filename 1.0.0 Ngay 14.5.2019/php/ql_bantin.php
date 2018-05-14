	<?php 
   		session_start();
    	if (isset($_SESSION['tendangnhap']) && $_SESSION['capdotruycap']==2 || $_SESSION['capdotruycap']==10) {
           
   		}else
      	if(isset($_SESSION['tendangnhap']) && $_SESSION['capdotruycap']!=10 && $_SESSION['capdotruycap']!=2){
   				header("location:../index.php");
   				exit();
   		}else{   			
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
   		<link rel="stylesheet" type="text/css" href="../css/ql_bantin_css.css">
    	<link rel="shortcut icon" type="image/jpg" href="../IMG/huyhieudoan.jpg"/>
    	<link rel="stylesheet" type="text/css" href="../CSS/ql_bantin_css.css">
	</head>
	 <body>
	 	<div style="width: 90%; margin: auto;">			
	<?php 
		include("top_qt.php");
		include("menu_web_ql_left.php");
		include("conn.php");
		$q4 = "select count(*) as sobaigoi from goibantin";
        $q4 = mysqli_query($con,$q4);
        $r4 = mysqli_fetch_array($q4);
        $sobaigoi =$r4['sobaigoi'];
        $q5 = "select count(*) as soloaitin from loaitin";
        $q5 = mysqli_query($con,$q5);
        $r5 = mysqli_fetch_array($q5);
        $soloaitin =$r5['soloaitin'];


	?>
	<script src="/javascripts/application.js" type="text/javascript" charset="utf-8" async defer>
		function hienan(){
			$("#1").slideToggle('hide');
			$("#2").slideToggle('show');

		}
	</script>
	<div class="noidung-bt">
		<div class="title">
			<br>
			<h2>Quản lý bản tin</h2>
		</div>
		<div class="">
            <div class="mot">
                <ul>
                  	<h3 >
                    	<li style="background-color:#f93b0c"><a href="" title="">Tổng số bản tin gởi : 
                    <?php echo $sobaigoi; ?>
                    		</a>
                    	</li>
                  	</h3>
                  	<h3>
                    	<li style="background-color:#ff99cc">
                    		<a href="#" title="">Tổng số loại tin 
                    <?php echo $soloaitin; ?>
                    		</a>
                    	</li>
                  	</h3>
                  	<h3>
                    	<li style="background-color: #3399ff"> 
                      		<a href="" title="">Xóa bản tin</a>
                    	</li>
                  	</h3>
                  	<h3 >
                    	<li style="background-color: #ff9900">
                      		<a href="#" title="">Sữa bản tin</a>         
                    	</li>
                	</h3>
                </ul>
            </div>
        </div>	
		<br>	
		<?php 
			include('conn.php');
			$trangbandau=1;//khởi tạo trang ban đầu
			$soluongnoidung=4;//số bản ghi trên 1 trang (2 bản ghi trên 1 trang)
			$soluongbai = mysqli_query($con,"select idtingoi from goibantin");
			$total_record = mysqli_num_rows($soluongbai);//tính tổng số bản ghi có trong bảng posts
			$tongsotrang=ceil($total_record/$soluongnoidung);//tính tổng số trang sẽ chia
			//xem trang có vượt giới hạn không:
			if(isset($_GET["page"]))
			$trangbandau=$_GET["page"];//nếu biến $_GET["page"] tồn tại thì trang hiện tại là trang $_GET["page"]
			if($trangbandau<1) $trangbandau=1; //nếu trang hiện tại nhỏ hơn 1 thì gán bằng 1
			if($trangbandau>$tongsotrang) $trangbandau=$tongsotrang;//nếu trang hiện tại vượt quá số trang được chia thì sẽ bằng trang cuối cùng
			//tính start (vị trí bản ghi sẽ bắt đầu lấy):
			$start=($trangbandau-1)*$soluongnoidung;
			if ($_SESSION['capdotruycap']==2) {
				$sql11="select * from goibantin order by idtingoi DESC limit $start,$soluongnoidung"; 
			}
			if($_SESSION['capdotruycap']==10){
				$sql11="select * from goibantin where idtk ='".$_SESSION['idtk']."' order by idtingoi DESC limit $start,$soluongnoidung" ;
			}
			$query11 = mysqli_query($con,$sql11);
			while ($row=mysqli_fetch_array($query11)) {
				$idtin=$row['idtingoi'];
				$tieude = $row['tieude'];
				$avata = $row['avata'];
				$trichdan = $row['trichdan'];
				$loaitin = $row['maloaitin'];
				$thoigian = $row['ngaygoi'];
				$noidung = $row['noidung'];		
				echo "
					<div id='1' class='hiennoidung-bt'>
						<table class='table-noidung-bt'>
							<tr>
								<th rowspan='2'>
									<div class='chuahinh-bt'>
										<img class='img-bt' src='../IMG/$avata' >
									</div>	
								</th>
								<td class='td-1 tieude-bt'>$tieude</a>
								</td>
								<td  rowspan='2' class='sua-bt'><a href='xemnoidungbantin_qt.php?idtin=$idtin' title=''> Sữa tin</a></td>
								<td  rowspan='2' class='sua-bt'><a href='xoabantin_qt.php?idtin=$idtin' title=''> Xóa tin</a></td>
							
							</tr>
							<tr>
								<td class='td-2'>$trichdan
									<a href='xemnoidungbantin_qt.php?idtin=$idtin' title=''>...xem thêm</a>
								</td>
							</tr>
							
							   
						</table>
					</div>
					<br>
				";
			}
		?>
		<div style="text-align: center;">
			<?php
				echo "<a href='ql_bantin.php?page=1'>&nbsp&nbspTrang đầu&nbsp&nbsp</a>";
				for($trangbandau=1;$trangbandau<=$tongsotrang;$trangbandau++){
					echo "<a href='ql_bantin.php?page={$trangbandau}'>{$trangbandau}</a>";
					echo "&nbsp&nbsp";
				}
				echo "<a href='ql_bantin.php?page=9999'>&nbsp&nbspTrang cuối&nbsp&nbsp</a>";
			?>
		</div>
	</div> <td colspan="" rowspan="" headers=""></td>
	<?php 
		include("bottom_qt.php");	 
	 ?>
</div>	
</body>
</html>

	