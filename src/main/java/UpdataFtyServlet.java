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
 * @Date 2021/12/9 18:08
 * @Version 1.0
 */
@WebServlet("/updatafty")
public class UpdataFtyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        HttpSession session = req.getSession();

        String typename = req.getParameter("typename");
        String newtypename = req.getParameter("newtypename");

        foodtypeService f=new foodtypeService();
        int ft=0;
        if (typename!=null&&newtypename!=null){
            try {
                ft=f.updatafty(typename,newtypename);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (ft==1){
                //修改成功
                session.setAttribute("backmsg",3);
                resp.sendRedirect("back.jsp");
            }else {
                //修改失败
                session.setAttribute("backmsg",4);
                resp.sendRedirect("back.jsp");
            }
        } else {
            //为空返回
            session.setAttribute("backmsg",0);
            resp.sendRedirect("back.jsp");
        }
    }
}
