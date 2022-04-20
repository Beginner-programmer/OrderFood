import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/reg")
public class RegUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        //接受请求参数
        String uname = req.getParameter("username");
        String password = req.getParameter("password");
        String telephone = req.getParameter("telephone");

        userEntity user = new userEntity();
        user.setUname(uname);
        user.setPassword(password);
        user.setTelephone(telephone);

        //存储数据
        userService us = new userService();
        int i = 0;
        try {
            i = us.add(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //跳转
        if (i > 0) {
            req.setAttribute("mess", "注册成功");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            req.setAttribute("mess", "注册失败");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
