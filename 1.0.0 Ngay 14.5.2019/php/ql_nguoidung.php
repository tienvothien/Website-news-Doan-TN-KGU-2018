<?php 
   		session_start();
    	if (isset($_SESSION['tendangnhap'])!='' && $_SESSION['capdotruycap']==2) {
   		}
   		else{
   			$_SESSION['tendangnhap']="Khách";
   			header("location:dangnhap.php");
   		}
	 ?>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>
<script type="text/javascript" charset="utf-8" async defer>
	 function danhsachtk(){		 			
	 	$("#div1").show('slow/400/fast', function() {	 		
	 	});
	 	$("#div2").hide();
	 	$("#div3").hide();
	 };
	 function themtk(){		 			
	 	$("#div2").show('slow/400/fast', function() {	 		
	 	});
	 	$("#div3").hide();
	 	$("#div1").hide();
	 };
	 function xoatk(){		
	 	$("#div1").hide();
	 	$("#div2").hide();	
	 	$("#div3").show('slow/400/fast', function() {
	 		
	 	});;
	};
	function onDelete(){
		if(confirm('Do you want to delete ?')==true){
			return true;
		}
		else {
			return false;
		}
	}

</script>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Quan trị hệ thống</title>
	<link rel="shortcut icon" type="image/jpg" href="../IMG/huyhieudoan.jpg"/>
	<link rel="stylesheet" type="text/css" href="../CSS/noidungthaydoi_ql_nguoidung_css.css">
</head>
<body>
	<div style="width: 90%; margin: auto; ">
		<?php 
		$p=$_SESSION['tendangnhap'];
		include("top_qt.php");
		include("menu_web_ql_left.php");
		include("conn.php");
		?>
		<div class="thaydoiql-ngdung">
		 	<div class="title">
		 		<br>
		 		<h2>Quản lý tài khoản</h2>
		 	</div>
		 	<br><br>
		 	<div class="noidung-ql-ngdung">
		 		<div id="d3" class="thanhchon-ql-tk mot-9">
		 			<ul>
	                  	<h3 >
	                  		<li style="background-color:#555555; color: white;">
		                    	<p onclick="danhsachtk()">Danh sách tài khoản
		                    </p>
	                    	</li>
		                    <li style="background-color:#f93b0c">
		                    	<p onclick="themtk()">Thêm tài khoản
		                    </p>
	                    	</li>
		                	<li style="background-color:#ff99cc">
		                    	<p onclick="xoatk()">Xóa tài khoản</p>
	                    	</li>
		                	<li style="background-color: #ff8c00">
		                    	<p ">Sữa tài khoản</p>
	                    	</li>
	                  </h3>
	              </ul>
		 		</div>
		 		<br>
		 		<div id="div1" style="width: 100%;">
		 			<?php 
			 			$sql="select * from taikhoan order by capdotruycap";
			 			$query=mysqli_query($con,$sql);
			 			if(mysqli_num_rows($query)==0){
			 				echo "chưa có user nào cả";
			 			}
			 			else{
			 				echo"
							    <table  class='table-1' border='1' >
							    	<tr class='tr-h' bgcolor='lightpink'>
							    		<th >STT</th>
							    		<th >Tên đăng nhập</th>
							    		<th >mật khẩu</th>	
							    		<th >Cập độ truy cập</th>
							    		<th >Mã thông tin</th>
							    		<th >Ngày đăng ký</th>
							    	</tr>
							    ";
							    $tem=1;
								while($row=mysqli_fetch_array($query)){	
									if ($tem%2) {
										echo"<tr class='tr-h' bgcolor='#99ffcc'>";
									}
									else{
										echo"<tr class='tr-h' bgcolor='lightskyblue'>";
									}
									echo"<td heigh='30'>$tem</td>";
									echo"<td>$row[tendangnhap]</td>";
									echo"<td>********</td>";
									echo"<td>$row[capdotruycap]</td>";
									echo "<td>$row[mstt]</td>";	
									echo "<td>"; echo date('d-m-Y', strtotime($row['ngaytao']));echo "</td>";	
									$tem++;			
									}
									echo "<tr>";
								echo"</table>";
			 				}
		 			 ?>
		 		</div>
		 		<div id="div2" style="background-color: #99ffcc; width: 100%; height: auto; display: none; ">
		 			<form action="themtaikhoan.php" method="POST" accept-charset="utf-8">
			 			<table class="table-3">
			 				<tr>
			 					<th colspan="2" rowspan="" headers="" scope="" style="text-align: center;"><h2>Thêm tài khoản</h2></th>
			 				</tr>
			 				<tr>
			 					<th> Tên đăng nhập</th>
			 					<td> 
			 						<input type="text" name="tendangnhapdk" value="" placeholder="Nhập tên đăng nhập" required> <label><i>(*)</i></label>
			 					</td>
			 				</tr>
			 				<tr>
			 					<th>Mật Khẩu</th>
			 					<td> 
			 						<input type="password" name="matkhaudk" value="" placeholder="Nhập mật khẩu" required> <label><i>(*)</i></label>
			 					</td>
			 				</tr>
			 				<tr>
			 					<th>Nhập lại mật khẩu</th>
			 					<td> 
			 						<input type="password" name="nhaplaimatkhaudk" value="" placeholder="Nhập lại mật khẩu" required> <label><i>(*)</i></label>
			 					</td>
			 					<tr>
			 					<th>Quyền truy cập</th>
			 					<td> 
			 						<select name="quyentruycapdk" style="height: 30px; font-size: 16px;">
			 							<option value="">Chọn quyền truy cập</option>
			 							<option value="2">Quản trị viên</option>
			 							<option value="10">Người dùng</option>
			 						</select>
			 						<label><i>(*)</i></label>
			 					</td>
			 				</tr>
			 				</tr>
			 				<tr>
			 					<th> Mã Số</th>
			 					<td> 
			 						<input type="text" name="msttdk" value="" placeholder="Nhập mã số vào" required> <label><i>(*)</i></label>
			 					</td>
			 				</tr>
				 			<tr>
				 				<th>Họ Và tên</th>
				 				<td> <input type="text" name="hovatendk" required value="" placeholder="nhập tên họ và tên"> <label><i>(*)</i></label>
				 				</td>
				 			</tr>
				 			<tr>
				 				<th>Giới tính</th>
				 				<td>
				 					<input style="width: 5%;" type="radio" name="gioitinhdk" value="Nam" required>Nam
				 					<input style="width: 5%;" type="radio" name="gioitinhdk" value="Nữ" placeholder="">Nữ  	
				 					<label><i>(*)</i></label>			
				 				</td>
				 			</tr>
				 			<tr>
				 				<th>Ngày sinh</th>
				 				<td> 
				 					<input type="date" name="ngaysinhdk" max="2100-12-31" required> <label><i>(*)</i></label>
				 				</td>

				 			</tr>
				 			<tr>
				 				<th>Đơn vị (Đoàn khoa)</th>
				 				<td>
				 					<select  required name="donvidk" style="height: 30px; font-size: 16px;">	
				 						<option value=""> Chọn Khoa</option>
				 						<?php 
				 							$tam=1;
				 							$donvi = "select * from doankhoa";
				 							$truyvan = mysqli_query($con,$donvi);
				 							while ($row = mysqli_fetch_array($truyvan)) {
				 								$madoankhoa = $row['madoankhoa'];
				 								$tendoankhoa = $row['tendoankhoa'];
				 								echo "<option value='$madoankhoa'>$tendoankhoa</option>";
				 								$tam++;
				 							}
				 						 ?>
				 						
				 					</select><label><i>(*)</i></label>
				 				</td>		 				
				 			</tr>
				 			<tr>
				 				<th>Chức vụ Đoàn</th>
				 				<td> 
				 					<div style="float: left;">
					 					<select required name="machucvudk" style="height: 30px; font-size: 16px;">
					 						<option value=""> Chọn chức vụ</option>
					 						<?php 
					 							
					 							$donvi = "select * from chucvu";
					 							$truyvan = mysqli_query($con,$donvi);
					 							while ($row = mysqli_fetch_array($truyvan)) {
					 								$tenchucvudoan = $row['ten'];
					 								$machucvudoan = $row['machucvudoan'];
					 								echo "<option value='$machucvudoan'>$tenchucvudoan</option>";
					 							}
					 						?>
					 					</select><label><i>(*)</i></label>
					 				</div>				 					
				 					<div style="float: left; padding-left: 30px;">
				 						Nhiệm Kỳ 
					 						<select required name="namdaudk" style="height: 30px; font-size: 16px;">
						 						<option value=""> năm đầu</option>
						 							<?php 
						 							$namdau=1990;
						 							while ($namdau<=2090) {
						 								echo "<option value='$namdau'>$namdau</option>";
						 								$namdau++;
						 							}
						 						?>
						 					</select>
						 					&nbsp&nbsp-&nbsp&nbsp
						 					<select required name="namcuoidk" style="height: 30px; font-size: 16px;">
						 						<option value=""> năm cuối</option>
						 							<?php 
						 							$namdau=1990;
						 							while ($namdau<=2090) {
						 								echo "<option value='$namdau'>$namdau</option>";
						 								$namdau++;
						 							}
						 						?>	
						 					</select><label><i>(*)</i></label>
				 					</div>
				 				</td>
				 			</tr>
				 			<tr>
				 				<th>Số điện thoại</th>
				 				<td>
				 					<input type="text" name="sodienthoaidk" value="" placeholder="nhập số điện thoại" required><label><i>(*)</i></label>
				 				</td>
				 			</tr>
				 			<tr>
				 				<th>Email</th>
				 				<td>
				 					<input type="email" name="emaildk" value="" placeholder="nhập email vào" required><label><i>(*)</i></label>
				 				</td>
				 			</tr>
				 			<tr>
				 				<th colspan="2" style="text-align: center; ">
				 					<input style="width: 20%; height: 37px; background: orange ;" type="submit" name="themtaikhoan" value="Thêm tài khoản">
				 					<a href="ql_nguoidung.php" title=""><input style="width: 20%;height: 37px; background: orange ;" type="button" name="trolai" value="Thoát"></a>
				 				</th>
				 			</tr>
				 			
			 			</table>
			 		</form>
		 		</div>
		 		<div id="div3" style=" width: 100%; height: auto; display: none; ">
		 			<form action="xoataikhoan.php" method="POST" accept-charset="utf-8" OnSubmit="return onDelete();">
		 			
		 			<?php 
			 			$sql="select * from taikhoan order by capdotruycap";
			 			$query=mysqli_query($con,$sql);
			 			if(mysqli_num_rows($query)==0){
			 				echo "chưa có user nào cả";
			 			}
			 			else{
			 				echo"
							    <table  class='table-1' border='1' >
							    	<tr class='tr-h' bgcolor='lightpink'>
							    		<th>STT</th>
							    		<th>Tên đăng nhập</th>
							    		<th>mật khẩu</th>	
							    		<th>Cập độ truy cập</th>
							    		<th>Mã thông tin</th>
							    		<th>Ngày đăng ký</th>
							    		<th>Xóa tài khoản</th>
							    	</tr>
							    ";
							    $tem=1;
								while($row=mysqli_fetch_array($query)){	
									if ($tem%2) {
										echo"<tr class='tr-h' bgcolor='#99ffcc'>";
									}
									else{
										echo"<tr class='tr-h' bgcolor='lightskyblue'>";
									}
									echo"<td heigh='30'>$tem</td>";
									echo"<td>$row[tendangnhap]</td>";
									echo"<td>********</td>";
									echo"<td>$row[capdotruycap]</td>";
									echo "<td>$row[mstt]</td>";	
									echo "<td>"; echo date('d-m-Y', strtotime($row['ngaytao']));echo "</td>";
									echo "	<td>
													<input type='checkbox' name='chkDel[]' value='<?php echo $row[idtk];?>'>
											</td>";	
									$tem++;			
									}
									echo "</tr>";
									echo"<tr class='tr-h' style='height:90px;'>
											<td colspan='7'>
												<input class='tr-h' type='submit' name='xoataikhoan' value='Xóa tài khoản'>
											</td>
										</tr>";
							echo"</table>";
			 			}	

			 				
		 			 ?>
		 			</form>
		 		</div>
		 		
		 	</div>
		 </div>

		<?php
		include("bottom_qt.php");
 		?>
	</div>
	
</body>
</html>
	