	<?php 
   		session_start();
    	if (isset($_SESSION['tendangnhap']) && $_SESSION['capdotruycap']==2) {
           
   		}else
      	if(isset($_SESSION['tendangnhap']) && $_SESSION['capdotruycap']!=2){
   				header("location:../index.php");
   				exit();
   		}else{   			
   			header("location:dangnhap.php");
   			exit();
   		}
   		if (isset($_POST['themtaikhoan'])) {
   			include("conn.php");
   			$tendangnhapdk = $_POST['tendangnhapdk'];
   			$dodaitendanhnhapdk  = strlen($tendangnhapdk);
   			if ($dodaitendanhnhapdk>7 && $dodaitendanhnhapdk<51) {
   				$sqltennhap = "SELECT COUNT(*) as sl FROM taikhoan WHERE tendangnhap ='".$tendangnhapdk."'";
	   			$querytendangnhap = mysqli_query($con, $sqltennhap);
	   			$demsl = mysqli_fetch_array($querytendangnhap);
	   			$sl=$demsl['sl'];
	   			if ($sl==0) {
	   				$matkhaudk = $_POST['matkhaudk'];
	   				$dodaimatkhaudk = strlen($matkhaudk);
			   		$nhaplaimatkhaudk = $_POST['nhaplaimatkhaudk'];
			   		if ($dodaimatkhaudk>7 && $dodaimatkhaudk<51) {
			   			if ($matkhaudk==$nhaplaimatkhaudk) {
			   				$quyentruycapdk = $_POST['quyentruycapdk'];
			   				$msttdk = $_POST['msttdk'];
			   				$dodaims = strlen($msttdk);
			   				if($dodaims==10) {
			   					$sqlmstt = "SELECT COUNT(*) slms FROM thongtintaikhoan WHERE mstt ='".$msttdk."'";
			   					$querymstt = mysqli_query($con,$sqlmstt);
			   					$demslms = mysqli_fetch_array($querymstt);
			   					if ($demslms['slms']==0) {
			   						$sodienthoaidk = $_POST['sodienthoaidk'];
			   						if (strlen($sodienthoaidk)==10 || strlen($sodienthoaidk)==11) {
			   							$hovatendk = $_POST['hovatendk'];
								   		$gioitinhdk = $_POST['gioitinhdk'];
								   		$ngaysinhdk = $_POST['ngaysinhdk'];
								   		$madoankhoadk = $_POST['donvidk'];
								   		$machucvudk = $_POST['machucvudk'];
								   		$namdaudk = $_POST['namdaudk'];
								   		$namcuoidk = $_POST['namcuoidk'];								   		
								   		$emaildk = $_POST['emaildk'];
								   		$ngaytaodk = date('Y-m-d');
								   		// ISERT vào bả thông tin truoc
								   		$insert_tttk = "INSERT INTO thongtintaikhoan (mstt,hoten,gioitinh,ngaysinh,madoankhoa, sdt, email) VALUES ('$msttdk','$hovatendk', '$gioitinhdk','$ngaysinhdk','$madoankhoadk','$sodienthoaidk','$emaildk')";
								   		if (mysqli_query($con, $insert_tttk)) {
								   			echo "
												<script type='text/javascript'>
													alert('Thành công : Thêm vào bảng Thông tin tài khoản ');
													history.back(-1)
												</script>";
												// inser vao tai khoan
											$insert_tk = "INSERT INTO taikhoan(tendangnhap, matkhau, capdotruycap, mstt, ngaytao) VALUES ('$tendangnhapdk', '$matkhaudk', '$quyentruycapdk', '$msttdk','ngaytaodk') ";
											if (mysqli_query($con, $insert_tk)) {
									   			echo "
													<script type='text/javascript'>
														alert('Thành công : Thêm vào bảng tai khoan ');
														history.back(-1)
													</script>";
									   		}else{
												echo "
													<script type='text/javascript'>
														alert('Lỗi : Không thêm được bảng tai khoan');
														history.back(-1)
													</script>";
									   		}
									   		// isert vao ban chuc vu truoc
									   		$insert_chucvu = "INSERT INTO cochucvu(mstt, machucvudoan,madoankhoa, nambatdau,namketthuc) VALUES  ('$msttdk', '$machucvudk','$madoankhoadk','namdaudk','namcuoidk')";
									   		if (mysqli_query($con, $insert_chucvu)) {
									   			echo "
													<script type='text/javascript'>
														alert('Thành công : Thêm vào bảng chúc vụ ');
														history.back(-1)
													</script>";
									   		} else{
									   			echo "
													<script type='text/javascript'>
														alert('Lỗi : Không thêm được ban có chức vụ');
														history.back(-1)
													</script>";
									   		} 
									   	}else{
									   			echo "
													<script type='text/javascript'>
														alert('Lỗi : Không thêm được');
														history.back(-1)
													</script>";
											}

				   					} else{
				   							echo "
												<script type='text/javascript'>
													alert('Lỗi : lỗi nhập số điện thọai ');
													history.back(-1)
												</script>";
				   					}
				   				} else{
			   						echo "
										<script type='text/javascript'>
											alert('Lỗi nhập mã số : Mã số đã tồn tại ');
											history.back(-1)
										</script>";
			   					}
			   				}else{
			   					echo "
								<script type='text/javascript'>
									alert('Lỗi nhập mã số : chiều độ dài không đúng ');
									history.back(-1)
								</script>";
			   				}
			   			}else{
			   				echo "
								<script type='text/javascript'>
									alert('Lỗi Nhập lại mật khẩu và Mật khẩu khác nhau ');
									history.back(-1)
								</script>";
			   			}
			   		}else{
			   			echo "
							<script type='text/javascript'>
								alert('Lỗi độ dài mật khẩu ');
								history.back(-1)
							</script>";
			   		}
	   			}else{
	   				echo "
						<script type='text/javascript'>
							alert('Tên đăng nhập đã tồn tại');
							history.back(-1)
						</script>";
	   			}
   			}else{
   				echo "
					<script type='text/javascript'>
						alert('Độ dài tên đăng nhập không đúng');
						history.back(-1)
					</script>";
   			}
   		}else{
   			header("location:dangnhap.php");
   		}
	 ?>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>xoat tài khoản</title>
	<link rel="stylesheet" href="">
</head>
<body>
	thêm tài khoản
</body>
</html>