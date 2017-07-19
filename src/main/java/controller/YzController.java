package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * Created by zcy on 2017/7/19.
 */
@Controller
public class YzController  {
    @RequestMapping("/yz")
    public void yz(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //设置页面不缓存
        resp.setHeader("Pragma","No-cache");
        resp.setHeader("Cache-Control","no-cache");
        resp.setDateHeader("Expires",0);
        //在内存中创建图像
        int width=80,height=48;
        BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        //获取图形上下文
        Graphics g=image.getGraphics();
        //创建随机数对象
        Random random=new Random();
        //设定背景色
        g.setColor(new Color(122,123,100));
        g.fillRect(0,0,width,height);
        //设定字体
        g.setFont(new Font("Times New Roman",Font.PLAIN,28));
        //随机产生干扰线，使图像中的认证码不易被其他程序探测到
        for (int i=0;i<200;i++){
            int x=random.nextInt(width);
            int y=random.nextInt(height);
            int x1=random.nextInt(12);
            int y1=random.nextInt(12);
            g.drawLine(x,y,x1,y1);
        }

        //获取随机产生的认证吗(四位数)

        String sRand="";
        for (int i=0;i<4;i++){
            String rand=String.valueOf(random.nextInt(10));
            sRand+=rand;
            //将认证码显示到图像中
            g.setColor(new Color(30+random.nextInt(160),40+random.nextInt(170),40+random.nextInt(180)));
            g.drawString(rand,13*i+8,30);

        }

        //将认证码存入SESSION
        req.getSession().setAttribute("yzm",sRand);
        g.dispose();
        //输出图像到页面
        ImageIO.write(image,"PNG",resp.getOutputStream());
    }
}
