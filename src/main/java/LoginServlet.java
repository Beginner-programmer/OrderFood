import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        //接收请求参数（账号和密码）
        String uname = req.getParameter("username");
        String password = req.getParameter("password");
        userEntity user = new userEntity();
        user.setUname(uname);
        user.setPassword(password);

        //调用session
        HttpSession session = req.getSession();

        //查询数据
        userService us = new userService();
        userEntity u = null;

        try {
            //用户
            u = us.login(user);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        //跳转
        if (u == null) {
            req.setAttribute("mess", "账号或密码错误");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
//            //获取权限
//            menuService men=new menuService();
//            try {
//                List<setmenuEntity> list=men.findMenu(u.getRid());
//                System.out.println(list.toString());
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
            session.setAttribute("user", u);
            resp.sendRedirect("index.jsp");

        }
    }
}