class Mobile {
    // Instance variables
    String brand;
    int price;
    static String name; // belongs to class, not an object
    // static keyword: making class member not an object member

    static {
        // This block will only be called once when the class is loaded
        name = "Phone";
        System.out.println("in static block");
    }

    public Mobile() {
        brand = "";
        price = 200;
        System.out.println("in constructor");
    }

    public void show() {
        System.out.println(brand + " : " + price + " : " + name);
    }

    public static void show1() {
        System.out.println("in static method");
    }

    public static void show2(Mobile obj) {
        // non-static variables cannot be referenced from a static context
        // so we pass the object as a parameter
        System.out.println(obj.brand + " : " + obj.price + " : " + name);
    }
}

class Keywords {
    public static void main(String args[]) {

        Mobile obj1 = new Mobile();
        obj1.brand = "Apple";
        obj1.price = 1500;
        Mobile.name = "Smartphone";

        Mobile obj2 = new Mobile();
        obj2.brand = "Samsung";
        obj2.price = 1700;
        Mobile.name = "Smartphone";

        Mobile obj3 = new Mobile();

        obj1.show();
        obj2.show();
        obj3.show();

        Mobile.show1(); // call static method directly with class name

        Mobile.show2(obj1); // passing object to access non-static members in static method
    }
}
