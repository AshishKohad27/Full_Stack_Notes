enum Laptop {
    Macbook, XPS(2200), Surface(2000), ThinkPad(1900);

    private int price;

    private Laptop() {
        price = 10;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    private Laptop(int price) {
        this.price = price;
    }
}

public class Hello {
    public static void main() {
        Laptop lap2 = Laptop.Macbook;
        System.out.println(lap2 + " : " + lap2.getPrice());

        for (Laptop lap : Laptop.values()) {
            System.out.println(lap + " : " + lap.getPrice());
        }

    }
}