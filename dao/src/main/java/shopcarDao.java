import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class shopcarDao {
    private Connection conn = JDBCUtils.getConnection();
    private PreparedStatement ps;

    /**
     * 添加购物车
     **/
    public int addshop(shopcarEntity shopcar) throws SQLException {
        String sql = "INSERT INTO shopcar(uname,foodname,foodnum,price,sumprice) VALUES(?,?,?,?,?)";
        ps = conn.prepareStatement(sql);
        ps.setObject(1, shopcar.getUname());
        ps.setObject(2, shopcar.getFoodname());
        ps.setObject(3, shopcar.getFoodnum());
        ps.setObject(4, shopcar.getPrice());
        ps.setObject(5, shopcar.getSumprice());
        return ps.executeUpdate();
    }

    /**
     * 查询购物车所有
     * **/
    public List<shopcarEntity> findAll()throws SQLException{
        String sql="SELECT *FROM shopcar";
        ps=conn.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();
        List<shopcarEntity> slist=new ArrayList<>();
        while (rs.next()){
            String uname=rs.getString("uname");
            String foodname=rs.getString("foodname");
            int foodnum=rs.getInt("foodnum");
            float price=rs.getFloat("price");
            float sumprice=rs.getFloat("sumprice");
            shopcarEntity s=new shopcarEntity(uname,foodname,foodnum,price,sumprice);
            slist.add(s);
        }
        return slist;
    }
    /**
     * 修改数量
     * **/
    public int updatashop(shopcarEntity ushop)throws SQLException {
        String sql="UPDATE shopcar SET foodnum=?,sumprice=? WHERE foodname=?";
        ps=conn.prepareStatement(sql);
        ps.setObject(1,ushop.getFoodnum());
        ps.setObject(2,ushop.getSumprice());
        ps.setObject(3,ushop.getFoodname());
        return ps.executeUpdate();
    }

    /**
     * 删除购物车
     **/
    public int delshop(String foodname) throws SQLException {
        String sql = "delete from shopcar where foodname=?";
        ps = conn.prepareStatement(sql);
        ps.setObject(1, foodname);
        return ps.executeUpdate();
    }

    /**
     * 清空购物车
     * **/
    public int delall()throws SQLException{
        String sql="delete from shopcar";
        ps=conn.prepareStatement(sql);
        return ps.executeUpdate();
    }
}
