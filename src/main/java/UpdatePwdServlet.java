import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updatepwd")
public class UpdatePwdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        userService u = new userService();
        HttpSession session = req.getSession();
        int up = 0;
        Integer id = Integer.valueOf(req.getParameter("id"));
        String pwd = req.getParameter("pwd");
        String newpwd = req.getParameter("newpwd");
        userEntity us = (userEntity) session.getAttribute("user");
        if (pwd.equals(us.getPassword())) {
            //修改密码
            userEntity user = new userEntity();
            user.setId(id);
            user.setPassword(newpwd);
            try {
                up = u.updatapwd(user);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (up==1){
                session.setAttribute("upde",1);
                resp.sendRedirect("user.jsp");
            } else {
                session.setAttribute("upde",2);
                resp.sendRedirect("user.jsp");
            }
        } else {
            //密码错误
            session.setAttribute("upde",3);
            resp.sendRedirect("user.jsp");
        }

    }
}
