<div class="thongbao">
		<br>
		<div class="taikhoan">
			<table style="margin: auto; margin-top: 10%;">
				<tr>
					<td>
						<div style="border-radius: 16px 16px 16px 16px; background-color:yellow;">
							<img src="../IMG/user.png">
						</div>
					</td>
					<td> Xin chào :
						 <?php echo $_SESSION['tendangnhap']; ?> 
						
					</td>
				</tr>
				<tr><td colspan="2" style="height: 4px;"></td></tr>
				<tr>
					<td colspan="2" style="text-align: center; "><a style="text-decoration: none;"  href="dangxuat.php" title="">Đăng xuât</a></td>
				</tr>
			</table>
		</div>
		<div class="menu1" style="padding-bottom: 20px;" >
			<ul class="menu">
			    <li><a href="../index.php">Trang chủ</a></li>
			    <?php 
			    	if ($_SESSION['capdotruycap']==2) {
			    		echo "
						    <li><a href='#'>Quản lý Giới thiệu:</a></li>
							<li><a href='#''>Quản lý Văn Bản</a></li>
						";
					}
				?>
				<li><a href='ql_bantin.php'>Quản lý  Bản tin</a>
					<?php 
				    	if ($_SESSION['capdotruycap']==2) {
				    		echo "
								<ul class='sub-menu'>
									<li><a href='#'>Tin Đoàn Trường</a></li>
									<li><a href='#' >Tin Đoàn Khoa</a>
										<ul class='sub-menu'>
											<li><a href='#'>Thông Tin & Truyền Thông</a></li>
											<li><a href='#'>Kinh Tế Du Lịch</a></li>
											<li><a href='#'>Thực Phẩm</a></li>
											<li><a href='#'>Nông Nghiệp</a></li>
											<li ><a href='#'>Kỹ Thuật Xây Dựng</a></li>
										</ul> 
									</li>
								</ul>
							";
						}
					?>
				</li>
				<?php 
			    	if ($_SESSION['capdotruycap']==2) {
			    		echo "
			    			<li><a href='#'>Quản lý Liên hệ</a></li>
							<li><a href='ql_nguoidung.php'>Quản lý Người dùng</a></li>

						";
						echo $_SESSION['capdotruycap'];
			   		 }
			    ?>
				<li style="border-bottom: 2px solid;"><a href="ql_taikhoan.php">Quản lý Tài khoản</a></li>
			</ul>	
		</div>
	</div>	
