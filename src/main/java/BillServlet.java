import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        HttpSession session = req.getSession();
        //获取用户信息
        userEntity u = (userEntity) session.getAttribute("user");
        String ordername = u.getUname();

        orderService uorder = new orderService();

        try {
            //用户个人订单
            orderEntity newo = uorder.neworder(ordername);

            //用户查询个人订单历史记录
            List<orderEntity> ufindor = uorder.findorder(ordername);
            session.setAttribute("uor",newo);
            session.setAttribute("uorder", ufindor);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        resp.sendRedirect("bill.jsp");
    }
}
