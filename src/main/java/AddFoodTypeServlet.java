import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addfoodtype")
public class AddFoodTypeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        HttpSession session=req.getSession();

        String typename = req.getParameter("typename");

        foodtypeService fty = new foodtypeService();
        int f = 0;
        if (typename != null) {
            try {
                f=fty.addfty(typename);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (f==1){
                //添加成功
                session.setAttribute("backmsg",1);
                resp.sendRedirect("back.jsp");
            }else {
                //添加失败
                session.setAttribute("backmsg",2);
                resp.sendRedirect("back.jsp");
            }
        } else {
            //为空返回
            session.setAttribute("backmsg",0);
            resp.sendRedirect("back.jsp");
        }
    }
}
