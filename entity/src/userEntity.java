public class userEntity {
    //用户实体类
    int id;
    String uname;
    String password;
    int rid;
    String telephone;
    String name;
    String sex;
    String address;

    public userEntity() {
    }

    //登录方法
    public userEntity(int id, String uname, String password, int rid) {
        this.id = id;
        this.uname = uname;
        this.password = password;
        this.rid = rid;
    }

    //管理员查询所有
    public userEntity(int id, String uname, String password, int rid, String telephone, String name, String sex, String address) {
        this.id = id;
        this.uname = uname;
        this.password = password;
        this.rid = rid;
        this.telephone = telephone;
        this.name = name;
        this.sex = sex;
        this.address = address;
    }

    //用户查询所有
    public userEntity(int id, String uname, String telephone, String name, String sex, String address) {
        this.id = id;
        this.uname = uname;
        this.telephone = telephone;
        this.name = name;
        this.sex = sex;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }


    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
