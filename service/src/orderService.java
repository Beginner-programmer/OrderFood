import java.sql.SQLException;
import java.util.List;

public class orderService {
    private orderDao orderDao=new orderDao();

    //新增订单
    public int addorder(orderEntity order)throws SQLException{
        return orderDao.addorder(order);
    }

    //支付事件
    public int updataord(orderEntity order)throws SQLException{
        return orderDao.updataord(order);
    }

    //个人查询所有订单信息
    public List<orderEntity> findorder(String uname)throws SQLException {
        return orderDao.findorderu(uname);
    }

    //查看当前订单
    public orderEntity neworder(String name)throws SQLException{
        return orderDao.neworder(name);
    }

    //查看所有订单
    public List<orderEntity> findallo()throws SQLException{
        return orderDao.findallorder();
    }

}
