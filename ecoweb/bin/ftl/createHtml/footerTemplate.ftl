<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
	</head>

	<body>
		<div class="footer">
			<div class="container footer_box">
				<div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">
					<p>版权所有©贵州财经大学经济学院&emsp;技术支持：
						<a href="JavaScript:;">弈趣科技</a>
					</p>
				</div>
				<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
					<p>地址:贵州省贵安新区花溪大学城</p>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<p>
						<a href="JavaScript:;" class="weixin_weibo">微博</a>
						<a href="JavaScript:;" class="weixin_weibo wx">微信<span><img src="../img/footer-wx.jpg"/></span></a>
						<a href="JavaScript:;">院长信箱</a> |
						<a href="JavaScript:;">书记信箱</a>
					</p>
				</div>
			</div>
		</div>

		<script>
			$(".wx").hover(function() {
				$(".wx span").css("transform", "scale(1)");
			},function(){
				$(".wx span").css("transform", "scale(0)");
			})
		</script>
	</body>

</html>