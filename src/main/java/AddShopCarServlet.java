import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/addshop")
public class AddShopCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        //调用session
        HttpSession session = req.getSession();

        int s = 0;
        String uname=req.getParameter("uname");
        String foodname = req.getParameter("foodname");
        String foodnum = req.getParameter("foodnum");
        String price = req.getParameter("price");
        float sumprice=Float.valueOf(price)*Float.valueOf(foodnum);

        /**
         * 购物车操作
         * **/
        //添加购物车
            shopcarEntity shopcar = new shopcarEntity();
            shopcar.setUname(uname);
            shopcar.setFoodname(foodname);
            shopcar.setFoodnum(Integer.valueOf(foodnum));
            shopcar.setPrice(Float.valueOf(price));
            shopcar.setSumprice(sumprice);

            try {
                shopcarService shop = new shopcarService();
                //添加购物车
                s = shop.add(shopcar);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (s > 0) {
                session.setAttribute("mess", "1");
                resp.sendRedirect("menu.jsp");
            } else {
                session.setAttribute("mess", "2");
                resp.sendRedirect("menu.jsp");
            }
    }
}
