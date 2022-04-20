import java.sql.SQLException;
import java.util.List;

public class foodtypeService {
    private foodtypeDao foodtypeDao=new foodtypeDao();
    /**
     * 查询食物类型
     * **/
    public List<foodtypeEntity> findtypeAll() throws SQLException{
        return foodtypeDao.findtypeAll();
    }

    /**
     * 添加食物类型
     * **/
    public int addfty(String ftyname)throws SQLException{
        return foodtypeDao.addfty(ftyname);
    }

    /**
     * 修改食物类型
     * **/
    public int updatafty(String fty,String nfty)throws SQLException{
        return foodtypeDao.updatafty(fty,nfty);
    }

    /**
     * 删除食物类型
     * **/
    public int delfty(String tyname)throws SQLException{
        return foodtypeDao.delfty(tyname);
    }
}
