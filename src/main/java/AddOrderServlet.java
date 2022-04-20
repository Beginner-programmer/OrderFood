import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@WebServlet("/addorder")
public class AddOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        HttpSession session = req.getSession();
        orderService order = new orderService();
        shopcarService shop=new shopcarService();

        //15位随机数订单编号
        Long now = new Date().getTime();
        String ran = (String.valueOf((Math.random() * 9 + 1) * 10)).substring(0, 2);
        String orderid = now + ran;
        //获取当前时间
        SimpleDateFormat newtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = newtime.format(new Date());
        //获取下单人姓名
        userEntity u = (userEntity) session.getAttribute("user");
        String ordername = u.getUname();
        //获取订单总价
        float zj = (float) session.getAttribute("zj");
        //订单状态
        int prderstate = 1;
        //支付状态
        int paystate = 1;



        if (zj != 0) {
            orderEntity ord = new orderEntity();
            ord.setOrderid(orderid);
            ord.setOrdertime(time);
            ord.setOrdername(ordername);
            ord.setOrderprice(zj);
            ord.setPrderstate(prderstate);
            ord.setPaystate(paystate);

            int add = 0;
            try {
                add = order.addorder(ord);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (add == 1) {
                //清空购物车
                try {
                    shop.delall();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                session.setAttribute("addmsg",1);
                resp.sendRedirect("shop.jsp");
            } else {
                session.setAttribute("addmsg",2);
                resp.sendRedirect("shop.jsp");
            }


        } else {
            //总价为0
            session.setAttribute("addmsg",3);
            resp.sendRedirect("shop.jsp");
        }
    }
}
