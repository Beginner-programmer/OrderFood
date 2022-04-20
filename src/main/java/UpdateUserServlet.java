import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updateuser")
public class UpdateUserServlet extends HttpServlet {
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
        String telephone = req.getParameter("telephone");
        String name = req.getParameter("name");
        String sex = req.getParameter("sex");
        String address = req.getParameter("address");

        //修改信息
        if (telephone != null) {
            userEntity upu = new userEntity();
            upu.setId(id);
            upu.setTelephone(telephone);
            upu.setName(name);
            upu.setSex(sex);
            upu.setAddress(address);
            try {
                up = u.updateu(upu);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (up == 1) {
                session.setAttribute("upde", 1);
                resp.sendRedirect("user.jsp");
            } else {
                session.setAttribute("upde", 2);
                resp.sendRedirect("user.jsp");
            }
        }
    }
}
