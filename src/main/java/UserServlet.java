import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        //调取登录的个人信息
        userEntity us = (userEntity) session.getAttribute("user");
        userService user = new userService();
        try {
            //用户查询信息
            userEntity findu = user.finduser(us.getId());
            session.setAttribute("findu", findu);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("user.jsp");
    }
}
