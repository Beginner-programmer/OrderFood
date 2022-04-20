import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/backstage")
public class BackStageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        HttpSession session=req.getSession();

        userService user=new userService();
        foodtypeService foodtype=new foodtypeService();
        foodService food=new foodService();
        orderService order=new orderService();
        try {
            //查询所有用户
            List<userEntity> allu=user.findAll();

            //查询所有食物分类
            List<foodtypeEntity> allft=foodtype.findtypeAll();

            //查询所有食物
            List<foodEntity> allf=food.findAllfood();

            //查询所有订单
            List<orderEntity> allo=order.findallo();

            session.setAttribute("allu",allu);
            session.setAttribute("allft",allft);
            session.setAttribute("allf",allf);
            session.setAttribute("allo",allo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("backstage.jsp");
    }
}
