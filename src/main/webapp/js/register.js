$(document).ready(function(){
	 var ordertime=20   //设置再次发送验证码等待时间
	    var timeleft=ordertime
	    var btn=$(".yzm")
	    var phone=$(".phone")
	    var tel
	    var reg = /^1[3|4|5|7|8][0-9]{9}$/;  //电话号码的正则匹配式
		phone.keyup(function() {
				if (reg.test(phone.val())) {
					tel = phone.val()
					btn.removeAttr("disabled") //当号码符合规则后发送验证码按钮可点击
				} else {
					btn.attr("disabled", true)
				}
			})

			//计时函数
			function timeCount() {
				timeleft -= 1
				if (timeleft > 0) {
					btn.val(timeleft + " 秒后重发");
					setTimeout(timeCount, 1000)
				} else {
					btn.val("重新发送");
					timeleft = ordertime //重置等待时间
					btn.removeAttr("disabled");
				}
			}

			//事件处理函数
			btn.on("click", function() {
				$(this).attr("disabled", true); //防止多次点击
				timeCount(this);
				
				var paras = "o_tel="+tel;
				//此处为向后台的请求，获取验证码
				$.post('http://localhost:8080/sendCode?'+paras,function(data) {
		            if(data!=null&&typeof(data)!="undefined"){
		                var msg = data.msg;  //返回值为json格式
		                if(msg!=null&&typeof(msg)!="undefined"&&msg=="SUCCESS"){
		                	
		                }else{
		                    alert("短信验证码发送失败！请重新获取。");
		                }
		            }else{
		                alert("短信验证码发送失败！请重新获取。");
		            }
		        },"json");
			});
	});