```java
class Mobile
{
    // Instance variables
    String brand;
    int price;
    // Static
    static String name; // its belong to class not an object
    // static keyword: making class member not a object member

    public void show(){
        // if we create a variable inside this it will be local variable
        System.out.println(brand + " : " + price + " : " + name);
    }
}

class Hello {
    public static void main(String args[]) {

        Mobile obj1 = new Mobile();
        obj1.brand = "Apple";
        obj1.price = 1500;
        Mobile.name = "Smartphone";

        Mobile obj2 = new Mobile();
        obj2.brand = "Samsung";
        obj2.price = 1700;
        Mobile.name = "Smartphone";

        // obj1.name = "Phone"; // since name as used static for that we have to use Mobile.name method for static now same value of name given to all objects

        obj1.show();
        obj2.show();
    }
}
```

### Stack & Heap

After `obj2.brand = "Samsung"` and `Mobile.name = "Smartphone"`:

```
Stack (main)                   Heap                              Method Area (Static)
┌──────────────┐              ┌──────────────────┐              ┌──────────────────────┐
│ obj1         │─────────────►│ Mobile object    │              │ Mobile.name =        │
│ (reference)  │              │ brand = "Apple"  │              │   "Smartphone"       │
└──────────────┘              │ price = 1500     │              └──────────────────────┘
┌──────────────┐              └──────────────────┘                  ▲          ▲
│ obj2         │─────────────►┌──────────────────┐                  │          │
│ (reference)  │              │ Mobile object    │    obj1.show()───┘          │
└──────────────┘              │ brand = "Samsung"│    obj2.show()──────────────┘
                              │ price = 1700     │
                              └──────────────────┘

Note: static variable "name" lives in the Method Area (shared by all objects).
      Instance variables "brand" and "price" live inside each object on the Heap.
```

# Static Block
```java
class Mobile {
    // Instance variables
    String brand;
    int price;
    static String name; // its belong to class not an object
    // static keyword: making class member not a object member

    static // this block will only called once when we used static keyword
    {
        // It will called once
        name = "Phone";
        System.out.println("in static blocked");
    }

    public Mobile() // default constructor
    {
        brand = "";
        price = 200;
        System.out.println("in constructor");
    }

    public void show() {
        // if we create a variable inside this it will be local variable
        System.out.println(brand + " : " + price + " : " + name);
    }

    public static void show1() { // static method WITH static key_word
        System.out.println("in static method");
    }

    public static void show2(Mobile obj) { // static method
        // non-static variable brand cannot be referenced from a static context
        // System.out.println(brand + " : " + price + " : " + name);

        // for that
        System.out.println(obj.brand + " : " + obj.price + " : " + name);

    }
}

class Hello {
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

        // obj1.name = "Phone"; // since name as used static for that we have t o use
        // Mobile.name method for static

        obj1.show();
        obj2.show();
        obj3.show();

        Mobile.show1(); // we call static method directly with class name

        // if we want to use non static variable under static method
        // non-static variable brand cannot be referenced from a static context
        // Mobile.show2();

        // for that
        Mobile.show2(obj1);
    }
}
```

### Stack & Heap

After all three objects are created and `Mobile.name = "Smartphone"`:

```
Stack (main)                   Heap                              Method Area (Static)
┌──────────────┐              ┌──────────────────┐              ┌──────────────────────┐
│ obj1         │─────────────►│ Mobile object    │              │ Mobile.name =        │
│ (reference)  │              │ brand = "Apple"  │              │   "Smartphone"       │
└──────────────┘              │ price = 1500     │              ├──────────────────────┤
┌──────────────┐              └──────────────────┘              │ static block ran     │
│ obj2         │─────────────►┌──────────────────┐              │ once at class load   │
│ (reference)  │              │ Mobile object    │              ├──────────────────────┤
└──────────────┘              │ brand = "Samsung"│              │ show1() method       │
┌──────────────┐              │ price = 1700     │              │ show2() method       │
│ obj3         │──────┐       └──────────────────┘              └──────────────────────┘
│ (reference)  │      │       ┌──────────────────┐
└──────────────┘      └──────►│ Mobile object    │
                              │ brand = ""       │
                              │ price = 200      │
                              └──────────────────┘

Note: The static block runs ONCE when the class is first loaded (before any constructor).
      Static methods (show1, show2) belong to the class, not to any object.
      show2(obj) receives an object reference on the stack to access instance fields.
```