public class shopcarEntity {
    //购物车实体类
    private String uname;
    private String foodname;
    private int foodnum;
    private float price;
    private float sumprice;

    @Override
    public String toString() {
        return "shopcar {" +
                "foodname" + foodname
                + "foodnum" + foodnum +
                "price" + price +
                "}";
    }

    public shopcarEntity(String uname, String foodname, int foodnum, float price, float sumprice) {
        this.uname = uname;
        this.foodname = foodname;
        this.foodnum = foodnum;
        this.price = price;
        this.sumprice=sumprice;
    }

    public shopcarEntity() {

    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getFoodname() {
        return foodname;
    }

    public void setFoodname(String foodname) {
        this.foodname = foodname;
    }

    public int getFoodnum() {
        return foodnum;
    }

    public void setFoodnum(int foodnum) {
        this.foodnum = foodnum;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getSumprice() {
        return sumprice;
    }

    public void setSumprice(float sumprice) {
        this.sumprice = sumprice;
    }
}
