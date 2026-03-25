import java.util.ArrayList;

class ShoppingCart {
    ArrayList<String> items = new ArrayList<String>();
    ArrayList<Double> prices = new ArrayList<Double>();   // must use Double, not double

    void addItem(String name, double price) {
        items.add(name);
        prices.add(price);     // auto-boxing: double → Double
    }

    double getTotal() {
        double total = 0;
        for (Double p : prices) {
            total += p;        // auto-unboxing: Double → double
        }
        return total;
    }

    void showCart() {
        System.out.println("--- Your Cart ---");
        for (int i = 0; i < items.size(); i++) {
            System.out.println(items.get(i) + " - Rs." + prices.get(i));
        }
        System.out.println("Total: Rs." + getTotal());
    }

    public static void main(String args[]) {
        ShoppingCart cart = new ShoppingCart();
        cart.addItem("Laptop", 50000.0);
        cart.addItem("Mouse", 500.0);
        cart.addItem("Keyboard", 1500.0);
        cart.showCart();
    }
}
