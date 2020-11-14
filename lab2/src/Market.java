import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class Market {
    private static class Product {
        private final String name;
        private final String uid;
        private int cost;
        private int count;

        Product(String name, int cost, int count) {
            this.name = name;
            this.uid = UUID.randomUUID().toString();
            this.cost = cost;
            this.count = count;
        }
    }

    private final HashMap<String, Product> _map = new HashMap<>();
    private final String name;
    private final String uid;
    private String addres = "default";

    public Market(String name) {
        this.name = name;
        this.uid = UUID.randomUUID().toString();
    }

    public String getName() { return this.name; }

    public void setAdress(final String addres) {
        this.addres = addres;
    }

    public String getAddres() {
        return this.addres;
    }

    public String addShipment(String name, int cost, int count) throws Exception {
        Product prod = new Product(name, cost, count);
        if (!_map.containsKey(prod.uid)) {
            _map.put(prod.uid, prod);
        } else {
            throw new Exception("Error: Product is already presented in this market: " + this.name);
        }
        return prod.uid;
    }

    public int getCost(String id) throws Exception {
        try {
            return _map.get(id).cost;
        } catch (Exception ex) {
            throw new Exception("Цена на продукт не установлена");
        }
    }

    public int getCount(String id) {
        try {
            return _map.get(id).count;
        } catch (Exception ignored) {
            return 0;
        }
    }

    public void setCost(String id, int cost) throws Exception {
        if(_map.containsKey(id)) {
            _map.get(id).cost = cost;
        } else {
            throw new Exception("Error: Product is not presented in this market: " + this.name);
        }
    }
    public void setCount (String id, int count) throws Exception {
        if(_map.containsKey(id)) {
            _map.get(id).count = count;
        } else {
            throw new Exception("Error: Product is not presented in this market: " + this.name);
        }
    }

    public void getByBudget(int budget) {
        for (Map.Entry<String, Product> entry : _map.entrySet()) {
            int tempBudget = budget;
            int tempCount = entry.getValue().count;
            int count = 0;
            while ((tempBudget -= entry.getValue().cost) > 0 && tempCount > 0) {
                count++;
                tempCount--;
            }
            if (count != 0) {
                System.out.println("Вы можете купить " + count + " единиц продукта " + entry.getValue().name + " в магазине " + this.name);
            }
        }
    }

    public int buy(ArrayList<IdWithCount> id) throws Exception {
        int sum = 0;
        for (var i : id) {
            if(!_map.containsKey(i.getUid())) {
                throw new Exception("Продукта не существует в магазине");
            }
            if (_map.get(i.getUid()).count - i.getCount() < 0) {
                throw new Exception("Не хватает товара " + _map.get(i.getUid()).name);
            }
        }
        for (var i : id) {
            _map.get(i.getUid()).count -= i.getCount();
            sum += _map.get(i.getUid()).cost * i.getCount();
        }
        return sum;
    }
}
