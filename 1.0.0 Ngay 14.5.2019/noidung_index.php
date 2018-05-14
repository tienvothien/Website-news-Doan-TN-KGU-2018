<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link rel="stylesheet" type="text/css" href="./css/noidung_index_css.css">
</head>
<body>
	<div class="noidung">		
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
			$sql11="select * from goibantin order by idtingoi DESC limit $start,$soluongnoidung"; 
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
					<div class='hiennoidung'>
					<table class='table-noidung'>
						<tr>
							<th rowspan='2'>
								<div class='chuahinh'>
									<img class='img' src='./IMG/$avata' >
								</div>	
							</th>
							<td class='td-1'><a href='xemnoidungbantin.php?idtin=$idtin' title=''>$tieude</a></td>
						
						</tr>
						<tr>
							<td class='td-2'>$trichdan<a href='xemnoidungbantin.php?idtin=$idtin' title=''>...xem thêm</a></td>
						</tr>
					</table>
				</div>
				<br>

				";
				
			}
		?>
		<div style="text-align: center;">
			<?php
				echo "<a href='index.php?page=1'>&nbsp&nbspTrang đầu&nbsp&nbsp</a>";
				for($trangbandau=1;$trangbandau<=$tongsotrang;$trangbandau++){
					echo "<a href='index.php?page={$trangbandau}'>{$trangbandau}</a>";
					echo "&nbsp&nbsp";
				}
				echo "<a href='index.php?page=9999'>&nbsp&nbspTrang cuối&nbsp&nbsp</a>";
			?>
		</div>
	</div>
	
	<div class="chen-1">
		
	</div>
</body>
</html>