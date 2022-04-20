import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/pay")
public class PayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        HttpSession session=req.getSession();
        orderService orderService = new orderService();

        //获取支付状态
        String paystate = req.getParameter("paystate");
        //获取订单状态
        String prderstate = req.getParameter("prderstate");
        //获取编号
        String orderid = req.getParameter("orderid");
        //获取当前时间
        SimpleDateFormat newtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = newtime.format(new Date());

        orderEntity ord = new orderEntity();
        ord.setPrderstate(Integer.valueOf(prderstate));
        ord.setPaystate(Integer.valueOf(paystate));
        ord.setOrderid(orderid);
        ord.setPaytime(time);
        int o = 0;
        try {
            o = orderService.updataord(ord);
            System.out.println(o);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (o == 1) {
            session.setAttribute("paymsg",1);
            resp.sendRedirect("bill.jsp");
        } else {
            session.setAttribute("paymsg",2);
            resp.sendRedirect("bill.jsp");
        }

    }
}
