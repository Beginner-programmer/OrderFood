import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/shop")
public class ShopServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        shopcarService s = new shopcarService();
        //调用session
        HttpSession session = req.getSession();
        //修改购物车数量
        String price=req.getParameter("price");
        String updatanum = req.getParameter("num");
        String foodname = req.getParameter("foodname");
        if (updatanum != null) {
            if (updatanum .equals("0")) {
                //删除购物车
                try {
                    s.del(foodname);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {
                float sumprice=Float.valueOf(price)*Float.valueOf(updatanum);
                //修改购物车数量
                shopcarEntity updatas = new shopcarEntity();
                updatas.setFoodnum(Integer.valueOf(updatanum));
                updatas.setFoodname(foodname);
                updatas.setSumprice(sumprice);
                try {
                    s.updatashop(updatas);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        //查询购物车所有
        try {
            List<shopcarEntity> shop = s.FindAll();
            float zj= 0;
            for (int i=0;i<shop.size();i++){
                zj+=shop.get(i).getSumprice();
            }
            session.setAttribute("Allshop", shop);
            session.setAttribute("zj",zj);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("shop.jsp");
    }
}
