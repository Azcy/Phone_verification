<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<script src="/js/jquery-1.11.3.min.js"></script>
<script src="/js/register.js"></script>
</head>
<body>
<div>
   <form action="validation" method="post">
	 <div align="left">
		 手机号：<input id="phone" name="phone" class="phone" type="number">
		    <br><hr>
		   验证码：<input  id="verification" name="verification" type="number">
		   
		   <input type="button" value="获取验证码" name="yzm" class="yzm" disabled="disabled">
		   <br><br>
		   <input type="submit" id="submit" value="提交">
	 </div>
   </form>
 </div>
</body>
</html>
