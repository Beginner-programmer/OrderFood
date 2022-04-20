import java.sql.SQLException;
import java.util.List;

public class shopcarService {
    private shopcarDao shopcarDao=new shopcarDao();

    /**
     * 添加到购物车
     * **/
    public int add(shopcarEntity shopc) throws SQLException{
        return shopcarDao.addshop(shopc);
    }

    /**
     * 查询购物车所有
     * **/
    public List<shopcarEntity> FindAll() throws SQLException {
        return shopcarDao.findAll();
    }
    /**
     * 修改购物车数量
     * **/
    public int updatashop(shopcarEntity ushop)throws SQLException{
        return shopcarDao.updatashop(ushop);
    }

    /**
     * 删除购物车
     * **/
    public int del(String foodname)throws SQLException{
        return shopcarDao.delshop(foodname);
    }

    /**
     * 清空购物车
     * **/
    public int delall()throws SQLException{
        return shopcarDao.delall();
    }
}
