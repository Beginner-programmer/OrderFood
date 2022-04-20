import java.sql.SQLException;
import java.util.List;

public class menuService {
    private menuDao menuDao=new menuDao();

    /**
     * 查询菜单
     * **/
    public List<setmenuEntity> findMenu(int rid) throws SQLException{
        return menuDao.findMenu(rid);
    }
}
