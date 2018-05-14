<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>
	
	<?php 
   		session_start();
    	if (isset($_SESSION['tendangnhap']) && isset($_SESSION['idtk'])){
          
   		}   		
   		else{
        $_SESSION['tendangnhap']="Khách";
   		$_SESSION['capdotruycap']="";
        $_SESSION['idtk']="";
   			
   		}
   		if (isset($_SESSION['tendangnhap'])&& $_SESSION['capdotruycap']!="") {
		include("conn.php");
		}
		else{
			header("location:./php/dangnhap.php");
			exit();
		}
	
		echo "<link rel='shortcut icon' type='image/jpg' href='IMG/huyhieudoan.jpg'/>";
		if (isset($_POST['dangbai'])) {
		//chuyen hinh anh ao thu muc
			$target_dir = "./IMG/";
			$target_file = $target_dir . basename($_FILES["image"]["name"]);
			$uploadOk = 1;
			$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
			// Check if image file is a actual image or fake image
			if(isset($_POST["dangbai"])) {
			    $check = getimagesize($_FILES["image"]["tmp_name"]);
			    if($check !== false) {
			        // echo "File is an image - " . $check["mime"] . ".";
			        $uploadOk = 1;
			    } else {
			        // echo "File is not an image.";
			        $uploadOk = 0;
			    }
			}
			// Check if file already exists
			if (file_exists($target_file)) {
			    //echo "Sorry, file already exists.";
			    $uploadOk = 1;
			}
			// Check file size
			if ($_FILES["image"]["size"] > 50000000) {
			    // echo "Sorry, your file is too large.";
			    $uploadOk = 0;
			}
			// Allow certain file formats
			if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
			&& $imageFileType != "gif" ) {
			    // echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
			    $uploadOk = 0;
			}
			// Check if $uploadOk is set to 0 by an error
			if ($uploadOk == 0) {
			    // echo "Sorry, your file was not uploaded.";
			// if everything is ok, try to upload file
			} else {
				$uploadOk==1;
			    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
			        // echo "The file ". basename( $_FILES["image"]["name"]). " has been uploaded.";
			    } else {
			        // echo "Sorry, there was an error uploading your file.";
			    }
			}
	//insert vao csdl
			if ($uploadOk ==1) {
				
				$sql10="select * from taikhoan where tendangnhap='".$_SESSION['tendangnhap']."'"	;
				$query10 = mysqli_query($con,$sql10);
				$row10= mysqli_fetch_array($query10);
				$idtk= $row10['idtk'];
				$tieude = $_POST['tieude'];
				$avata = $_FILES['image']['name'];
				$trichdan = $_POST['trichdan'];
				$capdotruycap =$_SESSION['capdotruycap'];
				$loaitin = $_POST['loaitin'];

				$thoigian = date("Y/m/d");
				$noidungtin = $_POST['noidungtin'];		
			
				$sql="insert into goibantin (tieude,avata,trichdan,maloaitin,noidung,idtk,capdotruycap,ngaygoi) values ('$tieude','$avata','$trichdan','$loaitin','$noidungtin','$idtk','$capdotruycap','$thoigian')";
				if (mysqli_query($con, $sql)) {
					echo "
						<script type='text/javascript'>
							alert('Đã gởi bài đăng thành công');
						</script>";
					
				} 
				else {
		   				 // echo "Lỗi: " . $sql . "<br>" . mysqli_error($con);
					echo "
						<script type='text/javascript'>
							alert('Lỗi kết nối cơ sở dữ liệu');
						</script>";
					}
			}
			if ($uploadOk==0) {
				echo "
					<script type='text/javascript'>
						alert('Gởi bài thất bại');
					</script>
				";
			}		
			
		}
	?>

<script>
	// Hàm khởi tạo đồng hồ
	    function startTime()
	    {
	    			// Lấy Object ngày hiện tại
			var today = new Date();
	// Giờ, phút, giây hiện tại
			var h = today.getHours();
			var m = today.getMinutes();
			var s = today.getSeconds();
	// Chuyển đổi sang dạng 01, 02, 03
			m = checkTime(m);
			s = checkTime(s);
	 // Ghi ra trình duyệt
	 		document.getElementById('timer').innerHTML = h + ":" + m + ":" + s;
	 		// Dùng hàm setTimeout để thiết lập gọi lại 0.5 giây / lần
			var t = setTimeout(function() {
			startTime();
			}, 500);
		}

		          // Hàm này có tác dụng chuyển những số bé hơn 10 thành dạng 01, 02, 03, ...
		function checkTime(i)
		{
			if (i < 10) {
			    i = "0" + i;
			}
			return i;
		}
</script>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link rel="stylesheet" type="text/css" href="./css/dangtin_css.css">
</head>
<body onload="startTime()" >
	<?php 
		include ('menutop.php'); 
	?>
	
	<div class="layout-1">
		<div class="title">
		 		<br>
		 		<h1 style="text-align: center; color: Orange;">Đăng bản tin</h1>
		 	</div>
		 	<br>
		<form action="dangtin.php" method="POST" accept-charset="utf-8" enctype="multipart/form-data">
			<table class="table-1">
				 <tr>
					<th>Tiêu đề bản tin</th>
					<td><textarea class="font-size" name="tieude" rows="3" cols="80" placeholder="nhập tiêu đề" required></textarea></td>
				</tr>
				<tr>
					<th>Hình bản tin</th>
					<td>
						<input type="file" name="image" required> 
						
					</td>
				</tr>
				<tr>
					<th>Trích dẫn bản tin</th>
					<td> <textarea class="font-size" name="trichdan" rows="3" cols="80" placeholder="nhập trích dẫn" required></textarea></td>
				</tr>
				<tr>
					<th>Loại bản tin</th>
					<td>
						<select name="loaitin" required style="font-size: 20px; height: 36px;">
						 	<option value="">Chọn loại tin</option>
						 	<?php 
						 		include("./php/conn.php");
  								$sql="select * from loaitin";
  								$query = mysqli_query($con,$sql);
  								while ($row = mysqli_fetch_array($query) ){
  									$loaibantin=$row['tenloaitin'];
  									$maloaitin= $row['maloaitin'];
  									echo "<option value='$maloaitin'>$loaibantin</option>}
  									option";
  								}

						 	?>
						 </select> 
					</td>
				</tr>
				<tr>
					<th>Time tin gởi tin</th>
					<td> 
						<div id="timer" style="float:left; text-align: left;"> 
						</div>
						<?php
						echo "&nbsp &nbsp --- &nbsp &nbsp";
							$ngaygoi= new DateTime();
							echo $ngaygoi->format('d-m-Y');

  						?>
						 
				</tr>
				<tr>
					<th>Chọn noi dung sẵn</th>
					<td><input type="file" name="noidungsan" value="" placeholder=""></td>
				</tr>
				<tr>
					<th>Nội dung bản tin</th>
					<td>
						<textarea class="font-size"  name="noidungtin" rows="20" cols="80"></textarea>
					</td>
				</tr> 
				<tr>
					<td colspan="2" style="text-align: center;">
						<input class="input-1" style="width: 20%;" type="submit" name="dangbai" value="Đăng bài">					
						<input class="input-1" style="width: 20%;" type="reset" name="reset" value="Reset">
						<a href="../index.php" title=""><input class="input-1" style="width: 20%;" type="button" name="back" value="Back"></a>
					</td>
				</tr>
				<tr> 
					<td>
						<br><br> 
					</td>
				</tr>
			</table>
		</form><br>
	</div>
	
	 <div class="chen-1">
	 	
	 </div><?php
		
		include ('thongbao_index.php');
		include ('bottom.php');
	?>	
</body>
</html>

	
	
