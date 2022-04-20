import java.sql.SQLException;
import java.util.List;

public class foodService {
    private foodDao foodDao = new foodDao();

    //添加食物
    public int addfood(foodEntity food) throws SQLException {
        return foodDao.add(food);
    }

    //修改食物信息
    public int updataf(foodEntity food) throws SQLException {
        if (food.getPicture() != null) {
            return foodDao.updatafi(food);
        } else {
            return foodDao.updataf(food);
        }
    }

    //修改食物状态
    public int updatafs(foodEntity food) throws SQLException {
        return foodDao.upstate(food);
    }

    //查询所有食物
    public List<foodEntity> findAllfood() throws SQLException {
        return foodDao.findAllfood();
    }

    //按照类型查找食物
    public List<foodEntity> findTypef(String tyid) throws SQLException {
        return foodDao.findTypefood(Integer.valueOf(tyid));
    }

    //模糊查询食物
    public List<foodEntity> findseaf(String search) throws SQLException {
        return foodDao.findseaf(search);
    }

    //删除食物
    public int del(String fname) throws SQLException {
        return foodDao.del(fname);
    }
}
