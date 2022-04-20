import java.sql.*;
import java.util.List;

public class testDao {
    public static void main(String[] args) throws SQLException {
        userDao user=new userDao();
        System.out.println();
        System.out.println();
        String sql = "select * from user";
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            //加载驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            long start = System.currentTimeMillis();
            //建立连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant", "root", "0618");
            long end = System.currentTimeMillis();
            System.out.println("建立连接耗时：" + (end - start) + "ms 毫秒");
            //创建PreparedStatement对象
            ps = conn.prepareStatement(sql);
            //执行SQL语句
            rs = ps.executeQuery();
            System.out.println("id  "+"uname  "+"password");
            while (rs.next()) {
                System.out.println(rs.getInt(1)+"   "+rs.getString(2)+"   "+rs.getString(3));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
            }
        }
    }
}
