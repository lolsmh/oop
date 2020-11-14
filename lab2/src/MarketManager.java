import java.util.ArrayList;

public class MarketManager {

    private final ArrayList<Market> list = new ArrayList<>();

    public Market makeMarket(final String name) {
        var temp = new Market(name);
        list.add(temp);
        return temp;
    }

    public Market findCheapestID(ArrayList<IdWithCount> ProductList) throws Exception {
        Market temp = null;
        int min = (int) Double.POSITIVE_INFINITY;
        for (var i : list) {
            var sum = 0;
            for (var j : ProductList) {
                if (i.getCount(j.getUid()) - j.getCount() >= 0) {
                    sum += i.getCost(j.getUid()) * j.getCount();
                }
                else {
                    sum = (int) Double.POSITIVE_INFINITY;
                    break;
                }
            }
            if (min > sum) {
                min = sum;
                temp = i;
            }
        }
        if (temp == null) {
            throw new Exception("Продуктов не хватает во всех магазинах");
        }
        return temp;
    }

    public Market findCheapestOneID(String id) throws Exception {
        try {
            return findCheapestID(new ArrayList<IdWithCount>() {{ add(new IdWithCount(id, 1)); }});
        } catch (Exception ignored) {
            throw new Exception("Продукт отсутствует во всех магазинах");
        }
    }
}