import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class foodtypeDao {
    private Connection conn=JDBCUtils.getConnection();
    private PreparedStatement ps;

    /**
     *查询食物类型
     **/
    public List<foodtypeEntity> findtypeAll() throws SQLException{
        String sql="SELECT * FROM foodtype";
        ps=conn.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();
        List<foodtypeEntity> foodty=new ArrayList<>();
        while (rs.next()){
            int id = rs.getInt("id");
            String tyname=rs.getString("tyname");
            foodtypeEntity f=new foodtypeEntity(id,tyname);
            foodty.add(f);
        }
        return foodty;
    }

    /**
     * 添加食物类型
     * **/
    public int addfty(String ftyname)throws SQLException{
        String sql="INSERT INTO foodtype(tyname) VALUES(?)";
        ps=conn.prepareStatement(sql);
        ps.setObject(1,ftyname);
        return ps.executeUpdate();
    }

    /**
     * 修改食物类型
     * **/
    public int updatafty(String fty,String nfty)throws SQLException{
        String sql="UPDATE foodtype SET tyname=? WHERE tyname=?";
        ps=conn.prepareStatement(sql);
        ps.setObject(1,fty);
        ps.setObject(2,nfty);
        return ps.executeUpdate();
    }

    /**
     * 删除食物类型
     * **/
    public int delfty(String tyname)throws SQLException{
        String sql="DELETE FROM foodtype WHERE tyname=?";
        ps=conn.prepareStatement(sql);
        ps.setObject(1,tyname);
        return ps.executeUpdate();
    }
}
