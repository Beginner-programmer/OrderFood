import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        //获取前端传回的食品id
        String tyid = req.getParameter("typeid");
        if (tyid == null) {
            tyid = "0";
        }
        //获取前端需要查询的食物
        String search=req.getParameter("search");

        //查询食物分类
        foodtypeService fty = new foodtypeService();
        //查询食品
        foodService food = new foodService();

        //调用session
        HttpSession session = req.getSession();
        try {
            /**
             * 食物操作
             * **/
            if (tyid.equals("0")) {

                //查询所有食物
                List<foodEntity> f = food.findAllfood();
                session.setAttribute("food", f);

            } else {
                //按类型查找食品
                List<foodEntity> ftype = food.findTypef(tyid);
                session.setAttribute("food", ftype);
            }

            //查询食品类型
            List<foodtypeEntity> ft = fty.findtypeAll();
            session.setAttribute("foodtype", ft);
            session.setAttribute("actid", tyid);

            if (search!=null) {
                //模糊查询食物
                List<foodEntity> sfind = food.findseaf(search);
                session.setAttribute("food", sfind);
            }
            //跳转
            resp.sendRedirect("menu.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
