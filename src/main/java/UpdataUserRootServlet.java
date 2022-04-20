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
 * @Date 2021/12/9 17:09
 * @Version 1.0
 */
@WebServlet("/updatauroot")
public class UpdataUserRootServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        HttpSession session=req.getSession();

        String username=req.getParameter("rname");
        String rid=req.getParameter("rid");

        userService u=new userService();
        int ur=0;
        if (username!=null&&rid!=null){
            userEntity user=new userEntity();
            user.setUname(username);
            user.setRid(Integer.valueOf(rid));
            try {
                ur=u.updatar(user);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (ur==1){
                //成功
                session.setAttribute("backmsg",3);
                resp.sendRedirect("back.jsp");
            }else {
                //失败
                session.setAttribute("backmsg",4);
                resp.sendRedirect("back.jsp");
            }
        }else {
            //为空返回
            session.setAttribute("backmsg",0);
            resp.sendRedirect("back.jsp");
        }

    }
}
