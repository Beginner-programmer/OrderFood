public class foodEntity {
    //食物实体类
    private int id;
    private String foodname;
    private String foodinf;
    private float price;
    private int foodtypeid;
    private String picture;
    private int state;

    public foodEntity() {

    }

    public foodEntity(int id, String foodname, String foodinf, float price, int foodtypeid, String picture, int state) {
        this.id=id;
        this.foodname=foodname;
        this.foodinf=foodinf;
        this.price=price;
        this.foodtypeid=foodtypeid;
        this.picture=picture;
        this.state=state;
    }

    @Override
    public String toString() {
        return "Food {id" + id +
                "foodname" + foodname
                + "foodinf" + foodinf +
                "price" + price +
                "foodtypeid" + foodtypeid +
                "picture" + picture +
                "state" + state+"}";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFoodname() {
        return foodname;
    }

    public void setFoodname(String foodname) {
        this.foodname = foodname;
    }

    public String getFoodinf() {
        return foodinf;
    }

    public void setFoodinf(String foodinf) {
        this.foodinf = foodinf;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getFoodtypeid() {
        return foodtypeid;
    }

    public void setFoodtypeid(int foodtypeid) {
        this.foodtypeid = foodtypeid;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
