# Abstract Keyword

## Declare vs Define — First Understand This

```
Declare = just tell WHAT to do (no body, no implementation)
Define  = tell HOW to do it (has body, has implementation)
```

```java
// DECLARING a method (no body — just signature)
abstract void sound();

// DEFINING a method (has body — tells HOW)
void sound() {
    System.out.println("Bark!");
}
```

Think of it like a **menu card** vs **actual cooking**:
- Menu says "Paneer Butter Masala" → that's **declaring** (what)
- Kitchen makes it → that's **defining** (how)

---

## What is Abstract?

- `abstract` = incomplete, must be completed by someone else
- Can be used with **classes** and **methods**
- Abstract class = a class that CANNOT be instantiated (no `new`)
- Abstract method = a method with NO body (only declaration)

---

## 1. Abstract Method

- Has NO body — just the signature ending with `;`
- The child class MUST provide the body (define it)
- Can ONLY exist inside an abstract class

```java
abstract class Animal {
    // Abstract method — DECLARED here, no body
    abstract void sound();

    // Regular method — DEFINED here, has body
    void breathe() {
        System.out.println("Breathing...");
    }
}

class Dog extends Animal {
    // MUST define sound() — or Dog also becomes abstract
    void sound() {
        System.out.println("Bark!");
    }
}

class Cat extends Animal {
    // MUST define sound() — each child gives its own implementation
    void sound() {
        System.out.println("Meow!");
    }
}

class Hello {
    public static void main(String args[]) {
        // Animal a = new Animal();   // ERROR — cannot instantiate abstract class

        Dog d = new Dog();
        d.sound();     // Bark!
        d.breathe();   // Breathing...

        Cat c = new Cat();
        c.sound();     // Meow!
        c.breathe();   // Breathing...
    }
}
```

### Stack & Heap

```
Stack                              Heap
┌──────────────────┐              ┌───────────────────────────────┐
│ main()           │              │ Dog object                     │
│                  │              │                               │
│ d ───────────────┼─────────────►│ sound()   → "Bark!"           │ ← defined by Dog
│                  │              │ breathe() → "Breathing..."     │ ← inherited from Animal
│                  │              └───────────────────────────────┘
│                  │
│ c ───────────────┼─────────────►┌───────────────────────────────┐
│                  │              │ Cat object                     │
└──────────────────┘              │                               │
                                  │ sound()   → "Meow!"           │ ← defined by Cat
                                  │ breathe() → "Breathing..."     │ ← inherited from Animal
                                  └───────────────────────────────┘

Animal is abstract — it exists ONLY as a blueprint in memory.
You CANNOT create an Animal object directly.
Dog and Cat objects have everything: their own sound() + inherited breathe().
```

---

## 2. Abstract Class

- A class declared with `abstract` keyword
- CAN have both abstract methods (no body) AND regular methods (with body)
- CANNOT be instantiated (`new Animal()` → ERROR)
- EXISTS only to be extended by child classes

```java
abstract class Shape {
    String color;

    // Constructor — yes, abstract classes CAN have constructors
    Shape(String color) {
        this.color = color;
    }

    // Abstract method — child MUST define
    abstract double area();

    // Regular method — child inherits as-is
    void display() {
        System.out.println(color + " shape, Area = " + area());
    }
}

class Circle extends Shape {
    double radius;

    Circle(String color, double radius) {
        super(color);
        this.radius = radius;
    }

    double area() {
        return 3.14 * radius * radius;
    }
}

class Rectangle extends Shape {
    double length, width;

    Rectangle(String color, double length, double width) {
        super(color);
        this.length = length;
        this.width = width;
    }

    double area() {
        return length * width;
    }
}

class Hello {
    public static void main(String args[]) {
        Circle c = new Circle("Red", 5);
        c.display();    // Red shape, Area = 78.5

        Rectangle r = new Rectangle("Blue", 4, 6);
        r.display();    // Blue shape, Area = 24.0

        // Polymorphism works too!
        Shape s = new Circle("Green", 3);
        s.display();    // Green shape, Area = 28.26
    }
}
```

### Stack & Heap

```
Circle c = new Circle("Red", 5);

Stack                              Heap
┌──────────────────┐              ┌────────────────────────────────────┐
│ main()           │              │ Circle object                      │
│                  │              │                                    │
│ c ───────────────┼─────────────►│ color = "Red"    (from Shape)      │
│                  │              │ radius = 5.0     (from Circle)     │
│                  │              │                                    │
│                  │              │ area() → 3.14 * 5 * 5 = 78.5      │ ← defined by Circle
│                  │              │ display() → inherited from Shape   │
└──────────────────┘              └────────────────────────────────────┘

Shape s = new Circle("Green", 3);

Stack                              Heap
┌──────────────────┐              ┌────────────────────────────────────┐
│ s ───────────────┼─────────────►│ Circle object                      │
│ (type: Shape)    │              │ color = "Green"                    │
└──────────────────┘              │ radius = 3.0                       │
                                  │ area() → 28.26                     │
                                  └────────────────────────────────────┘

s is type Shape but actual object is Circle → area() runs Circle's version
This is polymorphism + abstraction working together!
```

---

## 3. What CAN and CANNOT be in an Abstract Class

```java
abstract class Demo {
    // ✅ CAN have — instance variables
    int x = 10;

    // ✅ CAN have — static variables
    static int count = 0;

    // ✅ CAN have — constructor
    Demo() {
        count++;
    }

    // ✅ CAN have — regular methods (with body)
    void show() {
        System.out.println("Regular method");
    }

    // ✅ CAN have — static methods
    static void staticMethod() {
        System.out.println("Static method");
    }

    // ✅ CAN have — abstract methods (no body)
    abstract void doSomething();

    // ❌ CANNOT instantiate
    // Demo d = new Demo();   // ERROR
}
```

---

## 4. What Happens If Child Doesn't Define Abstract Method?

```java
abstract class Animal {
    abstract void sound();
    abstract void move();
}

// If you define ONLY some abstract methods → class must also be abstract
abstract class Dog extends Animal {
    void sound() {
        System.out.println("Bark!");
    }
    // move() is NOT defined → Dog must be abstract too
}

// GermanShepherd defines the remaining method → can be concrete
class GermanShepherd extends Dog {
    void move() {
        System.out.println("Running fast!");
    }
}

class Hello {
    public static void main(String args[]) {
        // Dog d = new Dog();   // ERROR — Dog is still abstract
        GermanShepherd gs = new GermanShepherd();
        gs.sound();    // Bark!      (defined in Dog)
        gs.move();     // Running fast! (defined in GermanShepherd)
    }
}
```

### Stack & Heap

```
Stack                              Heap
┌──────────────────┐              ┌──────────────────────────────────────┐
│ main()           │              │ GermanShepherd object                 │
│                  │              │                                      │
│ gs ──────────────┼─────────────►│ sound() → "Bark!"        (from Dog)  │
│                  │              │ move()  → "Running fast!" (from GS)  │
└──────────────────┘              └──────────────────────────────────────┘

Abstract methods can be defined across multiple levels:
Animal (declares) → Dog (defines sound) → GermanShepherd (defines move)
Only the LAST class that defines ALL methods can be instantiated.
```

---

## 5. Real-World Example — Payment System

```java
abstract class Payment {
    String userName;
    double amount;

    Payment(String userName, double amount) {
        this.userName = userName;
        this.amount = amount;
    }

    // Every payment type MUST implement this differently
    abstract void processPayment();

    // Common for all payment types
    void receipt() {
        System.out.println("Receipt: " + userName + " paid Rs." + amount);
    }
}

class CreditCard extends Payment {
    String cardNumber;

    CreditCard(String userName, double amount, String cardNumber) {
        super(userName, amount);
        this.cardNumber = cardNumber;
    }

    void processPayment() {
        System.out.println("Processing credit card " + cardNumber);
        System.out.println("Rs." + amount + " charged to card");
    }
}

class UPI extends Payment {
    String upiId;

    UPI(String userName, double amount, String upiId) {
        super(userName, amount);
        this.upiId = upiId;
    }

    void processPayment() {
        System.out.println("Processing UPI payment to " + upiId);
        System.out.println("Rs." + amount + " sent via UPI");
    }
}

class Cash extends Payment {

    Cash(String userName, double amount) {
        super(userName, amount);
    }

    void processPayment() {
        System.out.println("Rs." + amount + " received in cash");
    }
}

class Hello {
    public static void main(String args[]) {

        // Polymorphism + Abstraction
        Payment payments[] = {
            new CreditCard("Amit", 5000, "1234-5678"),
            new UPI("Priya", 2000, "priya@upi"),
            new Cash("Rahul", 500)
        };

        for (Payment p : payments) {
            p.processPayment();
            p.receipt();
            System.out.println("---");
        }
    }
}
```

### Stack & Heap — Payment Array

```
Stack                              Heap
┌──────────────────┐              ┌─────────────────────────────────┐
│ main()           │              │ Payment[] array                  │
│                  │              │ [0] → CreditCard object          │
│ payments ────────┼─────────────►│        userName = "Amit"         │
│                  │              │        amount = 5000             │
└──────────────────┘              │        cardNumber = "1234-5678"  │
                                  │        processPayment() → card   │
                                  │                                  │
                                  │ [1] → UPI object                 │
                                  │        userName = "Priya"        │
                                  │        amount = 2000             │
                                  │        upiId = "priya@upi"      │
                                  │        processPayment() → UPI    │
                                  │                                  │
                                  │ [2] → Cash object                │
                                  │        userName = "Rahul"        │
                                  │        amount = 500              │
                                  │        processPayment() → cash   │
                                  └─────────────────────────────────┘

Array type is Payment (abstract) but actual objects are CreditCard, UPI, Cash.
Each processPayment() runs differently based on actual object — polymorphism!
receipt() is same for all — defined once in abstract class, inherited by all.
```

**Output:**
```
Processing credit card 1234-5678
Rs.5000.0 charged to card
Receipt: Amit paid Rs.5000.0
---
Processing UPI payment to priya@upi
Rs.2000.0 sent via UPI
Receipt: Priya paid Rs.2000.0
---
Rs.500.0 received in cash
Receipt: Rahul paid Rs.500.0
---
```

---

## Abstract vs Regular Class

| Feature               | Abstract Class              | Regular Class              |
| --------------------- | --------------------------- | -------------------------- |
| Instantiate (new)?    | NO                          | YES                        |
| Abstract methods?     | YES (can have)              | NO (cannot have)           |
| Regular methods?      | YES (can have both)         | YES                        |
| Constructor?          | YES (called via super())    | YES                        |
| Variables?            | YES                         | YES                        |
| Purpose               | Blueprint for child classes  | Complete, usable class     |

---

## Remember

```
abstract class  = incomplete class, CANNOT create object
abstract method = no body, child MUST define it

Declare = WHAT (abstract void sound();)
Define  = HOW  (void sound() { ... })

If child doesn't define all abstract methods → child is also abstract
Abstract class CAN have constructors, variables, regular methods
```

## Common Mistakes

```java
// 1. Trying to instantiate abstract class
abstract class Animal { }
// Animal a = new Animal();   // ERROR!

// 2. Abstract method with a body
// abstract void sound() { }  // ERROR — abstract means NO body

// 3. Abstract method in non-abstract class
// class Dog {
//     abstract void sound();  // ERROR — only in abstract class
// }

// 4. Forgetting to define all abstract methods in child
abstract class Animal {
    abstract void sound();
    abstract void move();
}
// class Dog extends Animal {
//     void sound() { }
//     // forgot move() → ERROR: Dog must be abstract or define move()
// }
```
