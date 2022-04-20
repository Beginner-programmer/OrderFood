import java.sql.SQLException;
import java.util.List;

public class userService {
    private userDao userDao = new userDao();

    /**
     * 添加用户
     **/
    public int add(userEntity user) throws SQLException {
        return userDao.add(user);
    }

    /**
     * 修改
     **/
    public int updateu(userEntity user) throws SQLException {
        return userDao.updateu(user);
    }

    /**
     * 根据id修改密码
     **/
    public int updatapwd(userEntity user) throws SQLException {
        return userDao.updatepwd(user);
    }

    /**
     * 修改用户权限
     * **/
    public int updatar(userEntity user)throws SQLException{
        return userDao.updatar(user);
    }

    /**
     * 管理员查询所有
     **/
    public List<userEntity> findAll() throws SQLException {
        return userDao.findAll();
    }

    /**
     * 用户查询信息
     **/
    public userEntity finduser(int uid) throws SQLException {
        return userDao.Finduser(uid);
    }

    /**
     * 登录
     **/
    public userEntity login(userEntity user) throws SQLException {
        return userDao.login(user);
    }
}
