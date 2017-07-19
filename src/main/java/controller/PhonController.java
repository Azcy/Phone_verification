package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.Phone;
import tool.SendCode;
@Controller
public class PhonController {
	
	public String verification;
	
	@RequestMapping(value="/sendCode",method={RequestMethod.POST,RequestMethod.GET})
    public String sendCode(HttpServletRequest request,HttpServletResponse response) throws Exception{

	    HttpSession session=request.getSession();

        String ret="";
        String o_tel =request.getParameter("o_tel");//获取前端传送过来的电话号码
        
        if(o_tel!=null&&o_tel!=""){
            int Random  = (int) ((Math.random()*9+1)*100000);//随机生成的6位数（验证码）
            
            //调用封装的工具类SendCode  返回验证码
            SendCode s = new SendCode();
            verification = s.send(o_tel, Random);

            if(verification != null){
                //session.setAttribute("verification",verification);
                Map<String, Object> mapJson = JSONObject.fromObject(verification);
                System.out.println("obj"+mapJson.get("obj"));
                session.setAttribute("obj",mapJson.get("obj"));
            	ret = "{\"msg\":\"SUCCESS\"}";
            }else{
            	ret = "{\"msg\":\"ERROR\"}";
            }
        }else{
        	ret = "{\"msg\":\"ERROR\"}";
        }

        //JSONObject jsonObject = JSONObject.fromObject(verification);






        response.setContentType("application/json;charset=UTF-8");
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        writer.write(ret);//推送回前端
        return null;
    }
	
	
	@RequestMapping(value="/index")
	public String send(){
		return "/index.jsp";
	}
	
	@RequestMapping(value="/validation")
	//将前台界面form表单中的数据放入Phone类中
	//当获取不是POJO里面的参数的时候使用@RequestParam获取。
	public String login(@ModelAttribute("form") Phone phone,HttpServletRequest request){
		/*
		 * 验证数据
		System.out.println("验证码为："+verification);
		System.out.println(phone.getPhone()+"------"+phone.getVerification());
		*/
        System.out.println("验证码为："+verification);
        System.out.println(phone.getPhone()+"------"+phone.getVerification());
        HttpSession session=request.getSession();
        session.setAttribute("verification",phone.getVerification());
		//对验证码进行判断后跳转到相应的界面中
        System.out.println("phone.getUyzm="+phone.getUyzm()+",session.getAttribute(yzm)="+session.getAttribute("yzm"));
        if (phone.getUyzm().equals(session.getAttribute("yzm"))){
            return "success";
        }

		if(verification!=null&&phone.getVerification().equals(verification.split("\"")[9])){

			return "success";
		}
		else{
			return "failure";
		}
	}
}
	

