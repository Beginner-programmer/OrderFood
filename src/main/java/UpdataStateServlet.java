import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * @Author Wangbaba
 * @Date 2021/12/10 20:17
 * @Version 1.0
 */
@WebServlet("/updatastate")
public class UpdataStateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        HttpSession session = req.getSession();

        String foodname = req.getParameter("foodn");
        String state = req.getParameter("state");

        foodService food = new foodService();
        int f = 0;
        try {
            foodEntity fe = new foodEntity();
            fe.setFoodname(foodname);
            fe.setState(Integer.valueOf(state));
            f = food.updatafs(fe);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (f == 1) {
            //修改成功
            session.setAttribute("backmsg", 3);
            resp.sendRedirect("back.jsp");
        } else {
            //修改失败
            session.setAttribute("backmsg", 4);
            resp.sendRedirect("back.jsp");
        }
    }
}
