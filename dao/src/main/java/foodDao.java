import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class foodDao {
    private Connection conn = JDBCUtils.getConnection();
    private PreparedStatement ps;

    /**
     * 添加食物信息
     **/
    public int add(foodEntity food) throws SQLException {
        String sql = "INSERT INTO food(foodname,foodinf,price,foodtypeid,picture,state) VALUES(?,?,?,?,?,1)";
        ps = conn.prepareStatement(sql);
        ps.setObject(1, food.getFoodname());
        ps.setObject(2, food.getFoodinf());
        ps.setObject(3, food.getPrice());
        ps.setObject(4, food.getFoodtypeid());
        ps.setObject(5, food.getPicture());
        return ps.executeUpdate();
    }

    /**
     * 修改食物信息(有图片)
     */
    public int updatafi(foodEntity food) throws SQLException {
        String sql="UPDATE food SET foodname=?, foodinf=? , price=? , foodtypeid=? , picture=? WHERE id=?";
        ps=conn.prepareStatement(sql);
        ps.setObject(1,food.getFoodname());
        ps.setObject(2,food.getFoodinf());
        ps.setObject(3,food.getPrice());
        ps.setObject(4,food.getFoodtypeid());
        ps.setObject(5,food.getPicture());
        ps.setObject(6,food.getId());
        return ps.executeUpdate();
    }

    /**
     * 修改食物信息(无图片)
     */
    public int updataf(foodEntity food) throws SQLException {
        String sql="UPDATE food SET foodname=?, foodinf=? , price=? , foodtypeid=? WHERE id=?";
        ps=conn.prepareStatement(sql);
        ps.setObject(1,food.getFoodname());
        ps.setObject(2,food.getFoodinf());
        ps.setObject(3,food.getPrice());
        ps.setObject(4,food.getFoodtypeid());
        ps.setObject(5,food.getId());
        return ps.executeUpdate();
    }
    /**
     * 修改食物状态（1为上架，2为沽清）
     * */
    public int upstate(foodEntity food)throws SQLException{
        String sql="UPDATE food SET state=? WHERE foodname=?";
        ps=conn.prepareStatement(sql);
        ps.setObject(1,food.getState());
        ps.setObject(2,food.getFoodname());
        return  ps.executeUpdate();
    }

    /**
     * 删除食物信息
     */
    public int del(String fname) throws SQLException {
        String sql="DELETE FROM food WHERE foodname=?";
        ps=conn.prepareStatement(sql);
        ps.setObject(1,fname);
        return ps.executeUpdate();
    }

    /**
     * 查询所有食物
     */
    public List<foodEntity> findAllfood() throws SQLException {
        String sql = "SELECT * FROM food";
        ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<foodEntity> flist = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt("id");
            String foodname = rs.getString("foodname");
            String foodinf = rs.getString("foodinf");
            float price = rs.getFloat("price");
            int foodtypeid = rs.getInt("foodtypeid");
            String picture = rs.getString("picture");
            int state = rs.getInt("state");
            foodEntity f = new foodEntity(id, foodname, foodinf, price, foodtypeid, picture, state);
            flist.add(f);
        }
        return flist;
    }

    /**
     * 根据食物类型id查找
     */
    public List<foodEntity> findTypefood(int typeid) throws SQLException {
        String sql = "SELECT * FROM food WHERE foodtypeid=?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, typeid);
        ResultSet rs = ps.executeQuery();
        List<foodEntity> ftylist = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt("id");
            String foodname = rs.getString("foodname");
            String foodinf = rs.getString("foodinf");
            float price = rs.getFloat("price");
            int foodtypeid = rs.getInt("foodtypeid");
            String picture = rs.getString("picture");
            int state = rs.getInt("state");
            foodEntity f = new foodEntity(id, foodname, foodinf, price, foodtypeid, picture, state);
            ftylist.add(f);
        }
        return ftylist;
    }

    /**
     * 模糊查询，查询搜索的食物
     * **/
    public List<foodEntity> findseaf(String search)throws SQLException{
        String sql="SELECT *FROM food WHERE foodname LIKE ?";
        ps=conn.prepareStatement(sql);
        ps.setObject(1,"%"+search+"%");
        ResultSet rs=ps.executeQuery();
        List<foodEntity> sflist = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt("id");
            String foodname = rs.getString("foodname");
            String foodinf = rs.getString("foodinf");
            float price = rs.getFloat("price");
            int foodtypeid = rs.getInt("foodtypeid");
            String picture = rs.getString("picture");
            int state = rs.getInt("state");
            foodEntity sf = new foodEntity(id, foodname, foodinf, price, foodtypeid, picture, state);
            sflist.add(sf);
        }
        return sflist;
    }

}
