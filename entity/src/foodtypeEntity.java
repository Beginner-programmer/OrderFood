public class foodtypeEntity {
    //食物类型实体类
    private int id;
    private String tyname;

    public foodtypeEntity(int id, String tyname) {
        this.id = id;
        this.tyname = tyname;
    }

    @Override
    public String toString() {
        return "食物类型{" + "id" + id +
                "tyname" + tyname + "}";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTyname() {
        return tyname;
    }

    public void setTyname(String tyname) {
        this.tyname = tyname;
    }
}
