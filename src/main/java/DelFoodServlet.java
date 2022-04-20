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
 * @Date 2021/12/9 19:03
 * @Version 1.0
 */
@WebServlet("/delfood")
public class DelFoodServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        HttpSession session = req.getSession();

        String foodname = req.getParameter("foodname");

        foodService food = new foodService();
        int f = 0;
        if (foodname != null) {
            try {
                f = food.del(foodname);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (f == 1) {
                //删除成功
                session.setAttribute("backmsg", 5);
                resp.sendRedirect("back.jsp");
            } else {
                //删除失败
                session.setAttribute("backmsg", 6);
                resp.sendRedirect("back.jsp");
            }
        } else {
            //为空返回
            session.setAttribute("backmsg", 0);
            resp.sendRedirect("back.jsp");
        }
    }
}
