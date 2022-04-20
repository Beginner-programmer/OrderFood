import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class menuDao {
    private Connection conn = JDBCUtils.getConnection();
    private PreparedStatement ps;


    /**
     * 根据权限获取菜单id
     *
     * @return
     */
    public List<setmenuEntity> findMenu(int rid) throws SQLException {
        String sql = "SELECT * FROM root LEFT JOIN menu On root.wid=menu.id where rid = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, rid);
        ResultSet rs = ps.executeQuery();
        List<setmenuEntity> list = new ArrayList<>();
        while (rs.next()) {
            setmenuEntity m=new setmenuEntity();
            int rootid=rs.getInt("rid");
            int wid = rs.getInt("wid");
            String wname=rs.getString("wname");
            String whtml = rs.getString("whtml");
            m.setRid(rootid);
            m.setWid(wid);
            m.setWname(wname);
            m.setWhtml(whtml);
            list.add(m);
        }
        return list;
    }
}

