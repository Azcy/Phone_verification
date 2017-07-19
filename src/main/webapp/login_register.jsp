<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>

		<meta charset="utf-8" />
		<title></title>
		
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
		<%--<script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>--%>

		<script src="js/jquery-1.11.3.min.js"></script>
		<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/register.js"></script>
	
		<style type="text/css">
			#container{
				width: 200px;
				margin: 0 auto;
			}
			#img{
				margin-top: 100px;
				width: 100%;
			}
			#img img{
				margin-left: 25px;
				width: 150px;
			}
			.nav{
				border: 1px solid transparent;
			}
			.nav-tabs>li>a{
				color: gray;
				font-size: 18px;
				margin-top: 30px;
				margin-left: 18px;
			}
			.nav-tabs>li>a:hover{
				background-color: #f5f5f5;
				border: 1px solid transparent;
			}
			.nav-tabs>li.active>a,
			.nav-tabs>li.active>a:focus,
			.nav-tabs>li.active>a:hover {
			    color: red;
			    /*cursor: default;*/
			    background-color: #f5f5f5;
			    border: 1px solid transparent;
			    border-bottom: 1px solid red;
			}
			.login{
				width: 360px;
				height: 48px;
				margin-top: 20px;
				margin-left: -80px;
			}
			.login1{
				width: 200px;
				float: left;
			}
			.checkbox{
				float: left;
				margin-top: 30px;
				margin-left: -60px;
				color: #b7b9bd;
			}
			.forget{
				position: absolute;
				margin-top: 30px;
				margin-left: 220px;
				width: 60px;
				color: #b7b9bd;
			}
			.btn{
				margin-top: 30px;
				margin-left: -80px;
				height: 48px;
				width: 360px;
				line-height: 32px;
				font-size: 18px;
				background-color: #e43e3e;
			}
			.btn:hover{
				background-color: #e21525;
			}
			.code{
				border: 2px solid #46B8DA;
				width: 80px;
				height: 48px;
				margin-top: 20px;
				margin-left: 140px;
			}
			.code1{
				margin-top: -47px;
				width: 140px;
			}
			.next{
				position: absolute;
				margin-left: 235px;
				margin-top: -30px;
				color: #b7b9bd;
			}
			.label{
				position: absolute;
				color: gray;
				margin-left: 30px;
				margin-top: 10px;
			}
			.tip1,.tip2,.tip3,.tip4,.tip5,.tip6{
				display: none;
			}
			.glyphicon{
				position: relative;
				display: block;
				color: red;
				margin-left: -70px;
			}
			.error-tip {
			    /*display: none;*/
			   position: absolute;
			    clear: both;
			    min-height: 17px;
			    line-height: 17px;
			    margin-left: -50px;
			   margin-top: -13px;
			    font-size: 12px;
			    color: red;
			}
		</style>
		<script type="text/javascript">
  			$(function() {
				$("#test1").blur(function() {
					var a1=document.getElementById("test1");
					if(a1.value.length==0)
						$('.tip1').css("display","block");
					else
						$('.tip1').css("display","none");
				});
				
				$("#test2").blur(function() {
					var a1=document.getElementById("test2");
					if(a1.value.length==0)
						$('.tip2').css("display","block");
					else
						$('.tip2').css("display","none");
				});
				
				$("#test3").blur(function() {
					var a1=document.getElementById("test3");
					if(a1.value.length==0)
						$('.tip3').css("display","block");
					else
						$('.tip3').css("display","none");
				});
				
				$("#test4").blur(function() {
					var a1=document.getElementById("test4");
					if(a1.value.length==0)
						$('.tip4').css("display","block");
					else
						$('.tip4').css("display","none");
				});
				
				$("#test5").blur(function() {
					var a1=document.getElementById("test5");
					if(a1.value.length==0)
						$('.tip5').css("display","block");
					else
						$('.tip5').css("display","none");
				});
				
				$("#test6").blur(function() {
					var a1=document.getElementById("test6");
					if(a1.value.length==0)
						$('.tip6').css("display","block");
					else
						$('.tip6').css("display","none");
				});
  			});
  				
  				
		</script>
	</head>
	<body style="background-color: #f5f5f5">
		<div id="container">
			<div id="img">
				<img src="img/img_login_logo.png"/>
			</div>
				<div>

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">登录</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">注册</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
    	<input type="text" name="" id="test1" class="login form-control" placeholder="请输入注册时的手机号码" />
    	<div class="tip1">
    		<span class="glyphicon glyphicon-info-sign"></span>
    	<span class="error-tip ng-binding">请输入手机号码</span>
    	</div>
    	
    	<input type="password" name="" id="test2" class="login form-control" placeholder="请输入密码"/>
    	<div class="tip2">
    		<span class="glyphicon glyphicon-info-sign"></span>
    	<span class="error-tip ng-binding">请输入密码</span>
    	</div>
    	<div class="checkbox">
    		<input type="checkbox" name="" class="" value="" />7天内自动登录
    	</div>
    	<div class="forget">忘记密码</div>
    	<div class="btn btn-danger">登录</div>
    </div>
    <div role="tabpanel" class="tab-pane" id="profile">
		<form action="validation" method="post">
    	<input type="text" id="phone" name="phone" class="phone login form-control" value="" placeholder="请填写11位手机号码"/>
    	<div class="tip3">
    		<span class="glyphicon glyphicon-info-sign"></span>
    	<span class="error-tip ng-binding">请输入手机号</span>
    	</div>
    	<input type="text" name="uyzm" id="uyzm" class="login login1 form-control" value="" placeholder="图形验证码"/>
    	<div class="code"><img borde=0 src="/yz" ></div><div class="next">换一张</div>
    	<div class="tip4">
    		<span class="glyphicon glyphicon-info-sign"></span>
    	<span class="error-tip ng-binding">请输入图形验证码</span>
    	</div>
    	<input type="text" id="verification" name="verification" class="login login1 form-control" value="" placeholder="短信验证码"/>
			<input type="button" value="获取验证码" name="yzm" class="yzm code code1" disabled="disabled">
    	<div class="tip5">
    		<span class="glyphicon glyphicon-info-sign"></span>
    	<span class="error-tip ng-binding">请输入短信验证码</span>
    	</div>
    	<input type="password" name="password" id="test6" class="login form-control" value="" placeholder="6-16位密码，区分大小写，不能用空格" />
    	<div class="tip6">
    		<span class="glyphicon glyphicon-info-sign"></span>
    	<span class="error-tip ng-binding">请输入密码</span>
    	</div>
    	<input type="submit" id="submit" class="btn btn-danger " >同意协议并注册</input>
    	<div class="label">《美好学院用户协议》 </div>

		</form>



    </div>
  </div>

</div>
		</div>
	</body>
</html>
