public class IdWithCount {
    private String _id;
    private int _count;

    IdWithCount(String id, int count) {
        this._id = id;
        this._count = count;
    }

    public int getCount() { return this._count; }
    public String getUid() { return this._id; }

    public void setCount(int count) { this._count = count; }
}