import java.util.Date;

public class orderEntity {
    //订单实体类
    private int id;
    //订单编号
    private String orderid;
    private String ordertime;
    private String ordername;
    private float orderprice;
    //订单状态
    private int prderstate;
    private int paystate;
    private String paytime;

    public orderEntity() {

    }

    public orderEntity(String orderid, String ordertime, String ordername, float orderprice, int prderstate, int paystate, String paytime) {
        this.orderid = orderid;
        this.ordertime = ordertime;
        this.ordername = ordername;
        this.orderprice = orderprice;
        this.prderstate = prderstate;
        this.paystate = paystate;
        this.paytime = paytime;
    }

    public orderEntity(String orderid, String ordertime, String ordername, float orderprice, int prderstate, int paystate) {
        this.orderid = orderid;
        this.ordertime = ordertime;
        this.ordername = ordername;
        this.orderprice = orderprice;
        this.prderstate = prderstate;
        this.paystate = paystate;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderid() {
        return this.orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    public String getOrdername() {
        return ordername;
    }

    public void setOrdername(String ordername) {
        this.ordername = ordername;
    }

    public float getOrderprice() {
        return orderprice;
    }

    public void setOrderprice(float orderprice) {
        this.orderprice = orderprice;
    }

    public int getPrderstate() {
        return prderstate;
    }

    public void setPrderstate(int prderstate) {
        this.prderstate = prderstate;
    }

    public int getPaystate() {
        return paystate;
    }

    public void setPaystate(int paystate) {
        this.paystate = paystate;
    }

    public String getPaytime() {
        return paytime;
    }

    public void setPaytime(String paytime) {
        this.paytime = paytime;
    }
}
