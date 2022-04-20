public class setmenuEntity {
    private int id;
    private int rid;
    private int wid;
    private int id1;
    private String wname;
    private String whtml;

    public setmenuEntity(int rootid, int wid, String wname, String whtml) {
        this.rid = rootid;
        this.wid = wid;
        this.wname = wname;
        this.whtml = whtml;
    }
    @Override
    public String toString(){
        return
               wname+
                whtml
                ;
    }
    public setmenuEntity() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }

    public String getWname() {
        return wname;
    }

    public void setWname(String wname) {
        this.wname = wname;
    }

    public String getWhtml() {
        return whtml;
    }

    public void setWhtml(String whtml) {
        this.whtml = whtml;
    }
}
