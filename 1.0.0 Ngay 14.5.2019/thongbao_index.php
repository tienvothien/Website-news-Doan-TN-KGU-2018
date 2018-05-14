<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link rel="stylesheet" type="text/css" href="./css/thongbao_css.css">
</head>
<body>
	
	<div class="thongbao" style="padding-bottom: 20px; padding-top: 0px">
		<div style="width: 100%; height: vo">
			Đồng hồ
		</div>
		<div class="tinmoi">
			<div  class="tintucmoitieude">
				<h3 >Tin tức mới</h3>
			</div>
			<div class="chua-tintucmoi">
				<marquee onmouseover="this.stop()" onmouseout="this.start()" scrollamount="3" direction="up" width="100%" height="80%" align="center">
					<ul> 
						<?php 
							include ("conn.php");
							$sqltinmoi = "SELECT * FROM goibantin ORDER BY ngaygoi LIMIT 0,5";
							$querytinmoi = mysqli_query($con, $sqltinmoi);					
							while ($rowtinmoi = mysqli_fetch_array($querytinmoi)) {
								$tieudetinmoi = $rowtinmoi['tieude'];
								$idtin =$rowtinmoi['idtingoi'];
								echo "
									<li><a href='xemnoidungbantin.php?idtin=$idtin' title=''>$tieudetinmoi </a><span style='background-color:#ffcc00; color:white;'> &nbsp..new &nbsp</span></li>
								";
							}
						?>				
					</ul>
				</marquee>
			</div>
		</div>
		<div class="video" style="width: 90%; height: auto; margin: auto; margin-top: -30px;">
			<div  class="tintucmoitieude">
				<h3 >VIDEO CLIP</h3>
			</div>
			<div class="chua-tintucmoi">
				<video width="100%" height="auto" src="./IMG/dangweb.mp4" autobuffer autoloop loop controls poster=""></video>
			</div>
		</div>
	</div>
	
</body>
</html>