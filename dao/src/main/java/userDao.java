import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class userDao {
    private Connection conn = JDBCUtils.getConnection();
    private PreparedStatement ps;

    /**
     * 添加用户对象
     **/
    public int add(userEntity user) throws SQLException {
        String sql = "insert into user(uname,password,rid,telephone) values(?,?,2,?)";
        ps = conn.prepareStatement(sql);
        ps.setObject(1, user.getUname());
        ps.setObject(2, user.getPassword());
        ps.setObject(3, user.getTelephone());
        return ps.executeUpdate();
    }

    /**
     * 修改用户信息
     **/
    public int updateu(userEntity user) throws SQLException {
        String sql = "UPDATE user SET telephone=?,name=?,sex=?, address=? WHERE id=?";
        ps = conn.prepareStatement(sql);
        ps.setObject(1, user.getTelephone());
        ps.setObject(2, user.getName());
        ps.setObject(3, user.getSex());
        ps.setObject(4, user.getAddress());
        ps.setObject(5, user.getId());
        return ps.executeUpdate();
    }

    /**
     * 根据id修改密码
     **/
    public int updatepwd(userEntity user) throws SQLException {
        String sql = "UPDATE user SET password=? WHERE id=?";
        ps = conn.prepareStatement(sql);
        ps.setObject(1, user.getPassword());
        ps.setObject(2, user.getId());
        return ps.executeUpdate();
    }

    /**
     * 修改用户权限
     * **/
    public int updatar(userEntity user)throws SQLException{
        String sql="UPDATE `user` SET rid=? WHERE uname=?";
        ps=conn.prepareStatement(sql);
        ps.setObject(1,user.getRid());
        ps.setObject(2,user.getUname());
        return ps.executeUpdate();
    }

    /**
     * 管理员查询所有用户信息
     **/
    public List<userEntity> findAll() throws SQLException {
        String sql = "select * from user";
        ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<userEntity> list = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt("id");
            String uname = rs.getString("uname");
            String password = rs.getString("password");
            int rid = rs.getInt("rid");
            String telephone = rs.getString("telephone");
            String name = rs.getString("name");
            String sex = rs.getString("sex");
            String address = rs.getString("address");
            userEntity u = new userEntity(id, uname, password, rid, telephone, name, sex, address);
            list.add(u);
        }
        return list;
    }

    /**
     * 用户查询所有
     **/
    public userEntity Finduser(int uid) throws SQLException {
        String sql = "SELECT * FROM user WHERE id=?";
        ps = conn.prepareStatement(sql);
        ps.setObject(1, uid);
        ResultSet rs = ps.executeQuery();
        userEntity user = null;
        while (rs.next()) {
            int id = rs.getInt("id");
            String uname = rs.getString("uname");
            String telephone = rs.getString("telephone");
            String name = rs.getString("name");
            String sex = rs.getString("sex");
            String address = rs.getString("address");
            user = new userEntity(id, uname, telephone, name, sex, address);
        }
        return user;
    }



    /**
     * 登录方法
     **/
    public userEntity login(userEntity user) throws SQLException {
        String sql = "select * from user where uname=? and password=?";
        ps = conn.prepareStatement(sql);
        ps.setObject(1, user.getUname());
        ps.setObject(2, user.getPassword());
        ResultSet rs = ps.executeQuery();
        userEntity u = null;
        while (rs.next()) {
            int id = rs.getInt("id");
            String uname = rs.getString("uname");
            String password = rs.getString("password");
            int rid = rs.getInt("rid");
            u = new userEntity(id, uname, password, rid);
        }
        return u;
    }
}
