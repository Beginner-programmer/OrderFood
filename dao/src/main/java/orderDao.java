import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class orderDao {
    private Connection conn = JDBCUtils.getConnection();
    private PreparedStatement ps;

    /**
     * 新增订单
     **/
    public int addorder(orderEntity order) throws SQLException {
        String sql = "INSERT INTO `order`(orderid,ordertime,ordername,orderprice,prderstate,paystate,paytime) VALUES(?,?,?,?,?,?,?)";
        ps = conn.prepareStatement(sql);
        ps.setObject(1, order.getOrderid());
        ps.setObject(2, order.getOrdertime());
        ps.setObject(3, order.getOrdername());
        ps.setObject(4, order.getOrderprice());
        ps.setObject(5, order.getPrderstate());
        ps.setObject(6, order.getPaystate());
        ps.setObject(7, order.getPaytime());
        return ps.executeUpdate();
    }

    /**
     * 支付事件
     **/
    public int updataord(orderEntity order) throws SQLException {
        String sql = "UPDATE `order` SET prderstate=?, paystate=?,paytime=? WHERE orderid=?";
        ps = conn.prepareStatement(sql);
        ps.setObject(1, order.getPrderstate());
        ps.setObject(2, order.getPaystate());
        ps.setObject(3, order.getPaytime());
        ps.setObject(4, order.getOrderid());
        return ps.executeUpdate();
    }

    /**
     * 查询个人所有订单
     **/
    public List<orderEntity> findorderu(String uname) throws SQLException {
        String sql = "SELECT * FROM `order` WHERE ordername=?";
        ps = conn.prepareStatement(sql);
        ps.setObject(1, uname);
        ResultSet rs = ps.executeQuery();
        List<orderEntity> forderu = new ArrayList<>();
        while (rs.next()) {
            String orderid = rs.getString("orderid");
            String ordertime = rs.getString("ordertime");
            String ordername = rs.getString("ordername");
            float orderprice = rs.getFloat("orderprice");
            int prderstate = rs.getInt("prderstate");
            int paystate = rs.getInt("paystate");
            String paytime = rs.getString("paytime");
            orderEntity ord = new orderEntity(orderid, ordertime, ordername, orderprice, prderstate, paystate, paytime);
            forderu.add(ord);
        }
        return forderu;
    }

    /**
     * 当前订单
     **/
    public orderEntity neworder(String uname) throws SQLException {
        String sql = "SELECT * FROM `order` WHERE ordername=? AND paystate=1";
        ps = conn.prepareStatement(sql);
        ps.setObject(1, uname);
        ResultSet rs = ps.executeQuery();
        orderEntity o = null;
        while (rs.next()) {
            String orderid = rs.getString("orderid");
            String ordertime = rs.getString("ordertime");
            String ordername = rs.getString("ordername");
            float orderprice = rs.getFloat("orderprice");
            int prderstate = rs.getInt("prderstate");
            int paystate = rs.getInt("paystate");
            o = new orderEntity(orderid, ordertime, ordername, orderprice, prderstate, paystate);
        }
        return o;
    }

    /**
     * 查询所有订单
     * **/
    public List<orderEntity> findallorder() throws SQLException {
        String sql = "SELECT * FROM `order`";
        ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<orderEntity> forderu = new ArrayList<>();
        while (rs.next()) {
            String orderid = rs.getString("orderid");
            String ordertime = rs.getString("ordertime");
            String ordername = rs.getString("ordername");
            float orderprice = rs.getFloat("orderprice");
            int prderstate = rs.getInt("prderstate");
            int paystate = rs.getInt("paystate");
            String paytime = rs.getString("paytime");
            orderEntity ord = new orderEntity(orderid, ordertime, ordername, orderprice, prderstate, paystate, paytime);
            forderu.add(ord);
        }
        return forderu;
    }
}
