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
	
		$tendangnhap=$_SESSION['tendangnhap'];
		include("conn.php");
		$sql1 = "SELECT tt.mstt, tt.hoten, tt.gioitinh, tt.ngaysinh, dk.tendoankhoa, tt.sdt, tt.email FROM taikhoan tk INNER JOIN(thongtintaikhoan tt INNER JOIN  doankhoa dk ON dk.madoankhoa = tt.madoankhoa) ON tk.mstt = tt.mstt
                        	WHERE tk.tendangnhap='".$tendangnhap."'";
		$query1 = mysqli_query($con,$sql1);
		$row1 = mysqli_fetch_array($query1);
		$mstt=$row1['mstt'];
		$hoten=$row1['hoten'];
		$gioitinh=$row1['gioitinh'];
		$ngaysinh=$row1['ngaysinh'];
		$tendoankhoa=$row1['tendoankhoa'];			
		$sdt=$row1['sdt'];
		$email=$row1['email'];
		
	?>
	<?php 	
		if (isset($_POST['doimatkhau'])) {
			$matkhaucu = $_POST['matkhaucu'];
			$sqrldmk = "select idtk, matkhau from taikhoan WHERE tendangnhap ='".$tendangnhap."'";
			$querydmk = mysqli_query($con, $sqrldmk);
			$rowdmk = mysqli_fetch_array($querydmk);
			$matkhau = $rowdmk['matkhau'];
			if ($matkhaucu==$matkhau) {
				$idtk = $rowdmk['idtk'];
				$matkhaumoi = $_POST['matkhaumoi'];
				$rematkhaumoi = $_POST['rematkhaumoi'];
				if ($matkhaumoi==$rematkhaumoi) {
					$sqldoimatkhau = "UPDATE taikhoan SET matkhau ='".$matkhaumoi."' WHERE idtk = '".$idtk."'";
					if(mysqli_query($con,$sqldoimatkhau)){
						echo "	<script type='text/javascript'>
									alert('Đổi mật khẩu thành công');
								</script>";
					}else{
						echo "	<script type='text/javascript'>
									alert('Đổi mật khẩu thất bại');
								</script>";
					}
														
				}else{
					echo "	<script type='text/javascript'>
								alert('nhập mật khẩu mới và nhập lại mật khẩu không giống nhau');
							</script>";
				}
			}else{
				echo "	<script type='text/javascript'>
							alert('Nhập sai mật khẩu cũ');
						</script>";	
			}
		}
	?>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" charset="utf-8" async defer>
		function h1(){		
			$("#doimatkhau").slideToggle('hide');
			$("#tttaikhoan").slideToggle('show');
		};
		function h2(){
			$("#doimatkhau").slideToggle('show');
			$("#tttaikhoan").slideToggle('hide');
		};
	</script>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Quan trị hệ thống</title>
	<link rel='shortcut icon' type='image/jpg' href='../IMG/huyhieudoan.jpg'/>
	<link rel="stylesheet" type="text/css" href="../CSS/noidungthaydoi_qt_css.css">
	<link rel="stylesheet" type="text/css" href="../CSS/noidungthaydoi_ql_nguoidung_css.css">
	<link rel="stylesheet" type="text/css" href="../CSS/ql_taikhoan_css.css">
</head>
<body>
	<div style="width: 90%; margin: auto; ">
		<?php 
			include("top_qt.php");
				include("menu_web_ql_left.php");
		 ?>
		<div class="thaydoi">
		 	<div class="title">
		 		<br>
		 		<h2>Quản lý tài khoản</h2>
		 	</div>
		 	<br>
		 	<br>
		 	<div class="noidungthaydoi">
		 		<div id="d3" class="thanhchon-ql-tk mot-1">
		 			<ul>
	                  	<h3 >
		                    <li style="background-color:#f93b0c">
		                    	<p onclick="h1()">Thông tin tài khoản</p>
	                    	</li>
	                  	</h3>
	                  	<h3>
		                    <li style="background-color:#ff99cc">
		                    	<p onclick="h2()">Đổi mật khẩu</p>
	                    	</li>
	                  </h3>
	              	</ul>
		 		</div>
		 		<br>
		 		<br>
		 		<div id ="doimatkhau" class="tt-mk-1">
		 			<br>
		 			<h2 style="text-align: center;">Đổi mật khẩu tài khoản
		 			<form action="ql_taikhoan.php" method="POST" accept-charset="utf-8">
				 		<table  class="table1">
				 			<tr>
				 				<th>
				 					<label>Tên đăng nhập : </label>
				 				</th>
				 				<td>
				 					<label> <?php echo $_SESSION['tendangnhap'] ?> </label>
				 				</td>
				 			</tr>
				 			<tr>
				 				<th>
				 					<label>Nhập mật khẩu cũ : </label>
				 				</th>
				 				<td>
				 					<input type="password" name="matkhaucu" value="" placeholder="Nhập mật khẩu cũ" required="">
				 				</td>
				 			</tr>
				 			<tr>
				 				<th>
				 					<label>Nhập mật khẩu mới : </label>
				 				</th>
				 				<td>
				 					<input type="password" name="matkhaumoi" value="" placeholder="Nhập mật khẩu mới" required>
				 				</td>
				 			</tr>
				 			<tr>
				 				<th>
				 					<label>Nhập lại mật khẩu mới : </label>
				 				</th>
				 				<td>
				 					<input type="password" name="rematkhaumoi" value="" placeholder="Nhập lại mật khẩu mới" required>
				 				</td>
				 			</tr>
				 			<tr>
				 				<th colspan="" rowspan="2" headers="" scope="">
				 					<label>
				 						
				 					</label>
				 					
				 				</th>
				 			</tr>
				 		</table>
				 		<br>	<br>
				 		<div class="nut" >
				 			<input type="submit" name="doimatkhau" value="Đổi mật khẩu">
				 			<input type="reset" name="lammoi" value="Làm mới">
				 			<a href="web_quantri.php" title=""><input type="button" name="thoat" value="Thoát"></a>
				 		</div>
				 		<br><br>
			 		</form>
		 		</div>
		 		<div id="tttaikhoan" class="tt-mk-2">
		 			<br>
		 			<h2 style="text-align: center;">Thông tin tài khoản</h2>
		 			<form action="dangky.php" method="POST" accept-charset="utf-8">
		 				<table class="table-2">
			 				<tr>
			 					<th> Mã Số :</th>
			 					<td> 
			 						<label>
			 							<?php echo $mstt; ?>
			 						</label>
			 					</td>
			 				</tr>
				 			<tr>
				 				<th>Họ Và tên :</th>
				 				<td>
				 					<label><?php echo $hoten; ?></label>
				 				</td>
				 				
				 			</tr>
				 			<tr>
				 				<th>Giới tính :</th>
				 				<td>
				 					<label><?php echo $gioitinh; ?></label>			
				 				</td>
				 				
				 			</tr>
				 			<tr>
				 				<th>Ngày sinh :</th>
				 				<td> 
				 					<label><?php echo $ngaysinh; ?></label>	
				 				</td>
				 				

				 			</tr>
				 			<tr>
				 				<th>Đơn vị :</th>
				 				<td><label><?php echo $tendoankhoa; ?></label>	
				 				</td>		 				
				 			</tr>				 			
				 			<tr>
				 				<th>Số điện thoại  :</th>
				 				<td>
				 					<label><?php echo $sdt; ?></label>
				 				</td>
				 			</tr>
				 			<tr>
				 				<th>Email  :</th>
				 				<td>
				 					<label><?php echo $email; ?></label>
				 				</td>
				 			</tr>
				 			
			 			</table>
			 			<br><br>
	 			</form>
		 		</div>
		 	</div>
		 	<br>
		 	<br>
		 </div>

		<?php
			include("bottom_qt.php");
 		?>
	</div>
</body>
</html>