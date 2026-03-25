# Enum (Enumeration)

Enum = a special class that represents a **fixed set of constants**.

When you have values that NEVER change and are LIMITED in number — use enum.

```
Days     → Mon, Tue, Wed, Thu, Fri, Sat, Sun (only 7, never changes)
Months   → Jan, Feb, Mar... (only 12)
Seasons  → SPRING, SUMMER, AUTUMN, WINTER (only 4)
Sizes    → SMALL, MEDIUM, LARGE, XL (fixed set)
```

**Without enum** — you use Strings or ints, and mistakes happen:
```java
String size = "SMAL";   // typo! No error at compile time, bug at runtime
int day = 9;            // there's no 9th day — no error, just wrong
```

**With enum** — Java catches mistakes at compile time:
```java
Size size = Size.SMAL;  // ❌ COMPILE ERROR — SMAL doesn't exist
Size size = Size.SMALL; // ✅ correct
```

---

## 1. Basic Enum

```java
enum Day {
    MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY
}

class Hello {
    public static void main(String args[]) {

        Day today = Day.WEDNESDAY;
        System.out.println(today);   // WEDNESDAY

        // Use in if-else
        if (today == Day.SATURDAY || today == Day.SUNDAY) {
            System.out.println("Weekend!");
        } else {
            System.out.println("Weekday");  // this runs
        }

        // Use in switch — perfect match!
        switch (today) {
            case MONDAY:    System.out.println("Start of week"); break;
            case FRIDAY:    System.out.println("Almost weekend"); break;
            case WEDNESDAY: System.out.println("Midweek"); break;   // this runs
            default:        System.out.println("Regular day");
        }
    }
}
```

### Stack & Heap

```
Day today = Day.WEDNESDAY;

Stack                              Heap / Method Area
┌──────────────────┐              ┌─────────────────────────────────┐
│ main()           │              │ Day enum class                   │
│                  │              │                                 │
│ today ───────────┼─────────────►│ MONDAY    (ordinal 0)           │
│ (type: Day)      │              │ TUESDAY   (ordinal 1)           │
│                  │              │ WEDNESDAY (ordinal 2) ◄── today │
└──────────────────┘              │ THURSDAY  (ordinal 3)           │
                                  │ FRIDAY    (ordinal 4)           │
                                  │ SATURDAY  (ordinal 5)           │
                                  │ SUNDAY    (ordinal 6)           │
                                  └─────────────────────────────────┘

Enum constants are created ONCE when the class loads.
today is a reference pointing to the WEDNESDAY constant.
All enum values live in Method Area (like static final objects).
```

---

## 2. Enum is a Class (Not Just Constants)

Enums can have **fields, constructors, and methods** — just like a class!

```java
enum Size {
    SMALL(30),
    MEDIUM(40),
    LARGE(50),
    XL(60);       // semicolon required when enum has fields/methods

    int chest;    // field

    // Constructor — called automatically for each constant
    Size(int chest) {
        this.chest = chest;
    }

    // Method
    String getLabel() {
        return this.name() + " (Chest: " + chest + " inches)";
    }
}

class Hello {
    public static void main(String args[]) {

        Size s = Size.LARGE;
        System.out.println(s);              // LARGE
        System.out.println(s.chest);        // 50
        System.out.println(s.getLabel());   // LARGE (Chest: 50 inches)

        // Loop through all values
        for (Size size : Size.values()) {
            System.out.println(size.getLabel());
        }
        // SMALL (Chest: 30 inches)
        // MEDIUM (Chest: 40 inches)
        // LARGE (Chest: 50 inches)
        // XL (Chest: 60 inches)
    }
}
```

### Stack & Heap

```
Size s = Size.LARGE;

Stack                              Heap / Method Area
┌──────────────────┐              ┌──────────────────────────────────┐
│ main()           │              │ Size enum class                   │
│                  │              │                                  │
│ s ───────────────┼──────┐       │ SMALL  → { chest = 30 }          │
│ (type: Size)     │      │       │ MEDIUM → { chest = 40 }          │
│                  │      └──────►│ LARGE  → { chest = 50 } ◄── s   │
└──────────────────┘              │ XL     → { chest = 60 }          │
                                  └──────────────────────────────────┘

Each enum constant is an OBJECT with its own fields.
Size(30) constructor runs for SMALL, Size(40) for MEDIUM, etc.
All created once at class load time — never again.
```

### How the Constructor Works

```
When Java loads the Size enum, it internally does:

Size.SMALL  = new Size(30);    // constructor called with 30
Size.MEDIUM = new Size(40);    // constructor called with 40
Size.LARGE  = new Size(50);    // constructor called with 50
Size.XL     = new Size(60);    // constructor called with 60

You CANNOT call the constructor yourself:
Size s = new Size(70);   // ❌ ERROR — enum constructors are always private
```

---

## 2b. Enum Constructor — Deep Dive

### Default Constructor (No constructor written)

When you DON'T write any constructor, Java gives a **default no-arg constructor** — same as regular classes.

```java
enum Color {
    RED, GREEN, BLUE
    // No constructor written
    // Java internally does: private Color() { }
}

class Hello {
    public static void main(String args[]) {
        Color c = Color.RED;
        System.out.println(c);   // RED

        // Internally what happened when class loaded:
        // Color.RED   = new Color();   ← default constructor
        // Color.GREEN = new Color();   ← default constructor
        // Color.BLUE  = new Color();   ← default constructor
    }
}
```

```
With default constructor:
  enum Color { RED, GREEN, BLUE }
  → Each constant is an empty object (no fields, no data)
  → Java auto-creates: private Color() { }

Without default (you write your own):
  enum Size { SMALL(30), LARGE(50); int chest; Size(int c) { chest = c; } }
  → Default constructor is GONE — just like regular classes
  → Size.SMALL needs to pass a value: SMALL(30)
  → Size.SMALL without () → ❌ ERROR if no no-arg constructor exists
```

### Rule: Enum constructor is ALWAYS private

```java
enum Fruit {
    APPLE, BANANA, MANGO;

    // This is private by default — you don't even need to write "private"
    Fruit() {
        System.out.println("Constructor called for: " + this.name());
    }

    // public Fruit() { }    // ❌ ERROR — cannot be public
    // protected Fruit() { } // ❌ ERROR — cannot be protected
}

class Hello {
    public static void main(String args[]) {
        Fruit f = Fruit.APPLE;
        // Output (printed when enum class LOADS — not when you access it):
        // Constructor called for: APPLE
        // Constructor called for: BANANA
        // Constructor called for: MANGO

        // Constructor runs for ALL constants when class loads — only ONCE
    }
}
```

### When does the constructor run?

```
Timeline:
1. Java loads the Fruit enum class
2. Constructor runs for APPLE → BANANA → MANGO (all 3, in order)
3. All constants are created and stored
4. NEVER runs again — even if you access Fruit.APPLE 100 times

You CANNOT do:
  Fruit f = new Fruit();   // ❌ ERROR — enum has no public constructor
```

### Multiple Fields — Multiple Constructor Parameters

```java
enum Planet {
    MERCURY(3.303e+23, 2.4397e6),
    VENUS(4.869e+24, 6.0518e6),
    EARTH(5.976e+24, 6.37814e6),
    MARS(6.421e+23, 3.3972e6);

    double mass;      // in kg
    double radius;    // in meters

    // Constructor with 2 parameters
    Planet(double mass, double radius) {
        this.mass = mass;
        this.radius = radius;
    }

    // Method using the fields
    double surfaceGravity() {
        final double G = 6.67300E-11;
        return G * mass / (radius * radius);
    }

    double surfaceWeight(double earthWeight) {
        return earthWeight * surfaceGravity() / 9.8;
    }
}

class Hello {
    public static void main(String args[]) {
        double earthWeight = 70;   // kg

        for (Planet p : Planet.values()) {
            System.out.printf("Weight on %s: %.2f kg%n", p, p.surfaceWeight(earthWeight));
        }
        // Weight on MERCURY: 26.44 kg
        // Weight on VENUS: 63.37 kg
        // Weight on EARTH: 70.00 kg
        // Weight on MARS: 26.51 kg
    }
}
```

### Multiple Constructors (Overloaded)

```java
enum Drink {
    WATER(),                         // calls no-arg constructor
    COLA("Cola", 150),               // calls 2-arg constructor
    JUICE("Orange Juice", 120),      // calls 2-arg constructor
    COFFEE("Coffee", 80);            // calls 2-arg constructor

    String name;
    int calories;

    // No-arg constructor
    Drink() {
        this.name = "Plain Water";
        this.calories = 0;
    }

    // 2-arg constructor
    Drink(String name, int calories) {
        this.name = name;
        this.calories = calories;
    }

    void display() {
        System.out.println(name + " → " + calories + " cal");
    }
}

class Hello {
    public static void main(String args[]) {
        for (Drink d : Drink.values()) {
            d.display();
        }
        // Plain Water → 0 cal
        // Cola → 150 cal
        // Orange Juice → 120 cal
        // Coffee → 80 cal
    }
}
```

### Stack & Heap — Multiple Constructors

```
Drink enum loads:

  WATER()                → calls Drink()           → { name="Plain Water", calories=0 }
  COLA("Cola", 150)      → calls Drink(String,int) → { name="Cola", calories=150 }
  JUICE("Orange Juice", 120) → calls Drink(String,int) → { name="Orange Juice", calories=120 }
  COFFEE("Coffee", 80)   → calls Drink(String,int) → { name="Coffee", calories=80 }

Method Area
┌──────────────────────────────────────────┐
│ Drink enum                                │
│                                          │
│ WATER  → { name="Plain Water", cal=0 }   │  ← no-arg constructor
│ COLA   → { name="Cola", cal=150 }        │  ← 2-arg constructor
│ JUICE  → { name="Orange Juice", cal=120 }│  ← 2-arg constructor
│ COFFEE → { name="Coffee", cal=80 }       │  ← 2-arg constructor
└──────────────────────────────────────────┘

Each constant calls whichever constructor matches its arguments.
Just like method overloading — Java picks the right constructor.
```

### Constructor Flow — Basic to Advanced

```
Level 1: No constructor (default)
  enum Color { RED, GREEN, BLUE }
  → Java creates empty objects, no fields

Level 2: One constructor
  enum Size { SMALL(30), LARGE(50); int chest; Size(int c) { chest = c; } }
  → Each constant passes value to constructor

Level 3: Multiple constructors (overloaded)
  enum Drink { WATER(), COLA("Cola", 150); ... }
  → Different constants use different constructors

Level 4: Constructor + abstract method
  enum Op { ADD { int apply(a,b) { return a+b; } }; abstract int apply(a,b); }
  → Each constant is like an anonymous class

Level 5: Constructor + interface
  enum Status implements Printable { ... }
  → Enum behaves like a full class
```

---

## 2c. Enum with Getter & Setter

### Getter — The Right Way (Enums should be read-only)

```java
enum Employee {
    DEVELOPER("Amit", 80000),
    MANAGER("Priya", 120000),
    INTERN("Rahul", 20000);

    private String name;      // private fields — encapsulated
    private int salary;

    Employee(String name, int salary) {
        this.name = name;
        this.salary = salary;
    }

    // Getters — access private fields
    String getName()   { return name; }
    int getSalary()    { return salary; }

    void display() {
        System.out.println(getName() + " → Rs." + getSalary());
    }
}

class Hello {
    public static void main(String args[]) {
        Employee e = Employee.DEVELOPER;
        System.out.println(e.getName());     // Amit
        System.out.println(e.getSalary());   // 80000

        // e.name = "Ravi";   // ❌ ERROR — name is private

        for (Employee emp : Employee.values()) {
            emp.display();
        }
        // Amit → Rs.80000
        // Priya → Rs.120000
        // Rahul → Rs.20000
    }
}
```

### Setter — Possible but NOT Recommended

Enum constants should be **immutable** (don't change after creation). But Java doesn't stop you from adding setters — just know it's bad practice.

```java
enum Setting {
    VOLUME(50),
    BRIGHTNESS(80);

    private int value;

    Setting(int value) {
        this.value = value;
    }

    int getValue() { return value; }

    // Setter — works but breaks the idea of "constant"
    void setValue(int value) {
        this.value = value;
    }
}

class Hello {
    public static void main(String args[]) {
        System.out.println(Setting.VOLUME.getValue());   // 50

        Setting.VOLUME.setValue(100);                      // changed!
        System.out.println(Setting.VOLUME.getValue());   // 100

        // This WORKS but is DANGEROUS:
        // Enum constants are shared (like static) — everyone sees the change
        // Enum should be constant → don't add setters unless you have a strong reason
    }
}
```

### Best Practice

```
✅ Use getters — always (keep fields private, expose via getter)
❌ Avoid setters — enum = constant = should NOT change

If you need mutable data → use a regular class, not enum
Enum is for FIXED, UNCHANGING values
```

---

## 3. Built-in Enum Methods

Every enum automatically gets these methods:

```java
enum Color {
    RED, GREEN, BLUE
}

class Hello {
    public static void main(String args[]) {

        Color c = Color.GREEN;

        // name() — returns the constant name as String
        System.out.println(c.name());      // GREEN

        // ordinal() — returns the position (0-based index)
        System.out.println(c.ordinal());   // 1 (RED=0, GREEN=1, BLUE=2)

        // values() — returns array of ALL enum constants
        Color all[] = Color.values();
        for (Color color : all) {
            System.out.println(color + " → index " + color.ordinal());
        }
        // RED → index 0
        // GREEN → index 1
        // BLUE → index 2

        // valueOf() — convert String to enum constant
        Color fromString = Color.valueOf("RED");
        System.out.println(fromString);    // RED

        // Color.valueOf("YELLOW");   // ❌ RuntimeException — YELLOW doesn't exist

        // compareTo() — compares ordinal values
        System.out.println(Color.RED.compareTo(Color.BLUE));   // -2 (RED is before BLUE)
    }
}
```

---

## 3b. Daily Used Enum Methods — Quick Reference

```java
enum Status { ACTIVE, INACTIVE, BANNED }
```

```java
// 1. Get name as String
Status.ACTIVE.name()          // "ACTIVE"
Status.ACTIVE.toString()      // "ACTIVE" (same as name())

// 2. Get index position
Status.ACTIVE.ordinal()       // 0
Status.BANNED.ordinal()       // 2

// 3. String → Enum
Status s = Status.valueOf("ACTIVE");    // Status.ACTIVE
// Status.valueOf("active");            // ❌ ERROR — case sensitive!

// 4. Get ALL values as array
Status[] all = Status.values();         // [ACTIVE, INACTIVE, BANNED]

// 5. Compare (by ordinal)
Status.ACTIVE.compareTo(Status.BANNED)  // negative (ACTIVE comes before)
Status.BANNED.compareTo(Status.ACTIVE)  // positive (BANNED comes after)

// 6. Equality — use == (safe for enums)
Status s1 = Status.ACTIVE;
s1 == Status.ACTIVE          // true  ← preferred for enums
s1.equals(Status.ACTIVE)     // true  ← also works

// 7. Loop through all
for (Status st : Status.values()) {
    System.out.println(st);
}

// 8. Check if String is valid enum value
static boolean isValid(String value) {
    for (Status s : Status.values()) {
        if (s.name().equals(value)) return true;
    }
    return false;
}
```

### Cheat Sheet

```
.name()         → enum to String         "ACTIVE"
.ordinal()      → enum to int index      0
.valueOf("X")   → String to enum         Status.ACTIVE
.values()       → all enum constants     Status[]
.compareTo()    → compare two enums      by ordinal
==              → check equality         preferred over .equals()
```

---

## 4. Enum with Abstract Method

Each constant can have its OWN implementation — like anonymous classes!

```java
enum Operation {
    ADD {
        int apply(int a, int b) { return a + b; }
    },
    SUBTRACT {
        int apply(int a, int b) { return a - b; }
    },
    MULTIPLY {
        int apply(int a, int b) { return a * b; }
    },
    DIVIDE {
        int apply(int a, int b) { return a / b; }
    };

    // Abstract method — each constant MUST define it
    abstract int apply(int a, int b);
}

class Hello {
    public static void main(String args[]) {

        int a = 10, b = 3;

        for (Operation op : Operation.values()) {
            System.out.println(op + ": " + op.apply(a, b));
        }
        // ADD: 13
        // SUBTRACT: 7
        // MULTIPLY: 30
        // DIVIDE: 3
    }
}
```

### Stack & Heap

```
Stack                              Heap / Method Area
┌──────────────────┐              ┌──────────────────────────────────────┐
│ main()           │              │ Operation enum class                  │
│                  │              │                                      │
│ a = 10           │              │ ADD      → { apply() → a + b }       │
│ b = 3            │              │ SUBTRACT → { apply() → a - b }       │
│                  │              │ MULTIPLY → { apply() → a * b }       │
└──────────────────┘              │ DIVIDE   → { apply() → a / b }       │
                                  └──────────────────────────────────────┘

Each constant is like an anonymous class — has its OWN apply() implementation.
This is enum + abstract method + anonymous class combined!
```

---

## 5. Enum Implements Interface

Enums can implement interfaces (but cannot extend classes).

```java
interface Printable {
    void print();
}

enum Status implements Printable {
    ACTIVE("User is active"),
    INACTIVE("User is inactive"),
    BANNED("User is banned");

    String message;

    Status(String message) {
        this.message = message;
    }

    public void print() {
        System.out.println(this.name() + ": " + message);
    }
}

class Hello {
    public static void main(String args[]) {

        Status s = Status.ACTIVE;
        s.print();   // ACTIVE: User is active

        // Works with interface reference too
        Printable p = Status.BANNED;
        p.print();   // BANNED: User is banned

        // Loop all
        for (Status status : Status.values()) {
            status.print();
        }
    }
}
```

---

## 6. Real-World Example — Order Status System

```java
enum OrderStatus {
    PLACED("Order has been placed") {
        OrderStatus next() { return CONFIRMED; }
    },
    CONFIRMED("Order is confirmed") {
        OrderStatus next() { return SHIPPED; }
    },
    SHIPPED("Order has been shipped") {
        OrderStatus next() { return DELIVERED; }
    },
    DELIVERED("Order delivered successfully") {
        OrderStatus next() { return DELIVERED; }   // no next state
    };

    String description;

    OrderStatus(String description) {
        this.description = description;
    }

    abstract OrderStatus next();

    void display() {
        System.out.println(this.name() + " → " + description);
    }
}

class Order {
    int orderId;
    OrderStatus status;

    Order(int orderId) {
        this.orderId = orderId;
        this.status = OrderStatus.PLACED;
    }

    void moveToNext() {
        this.status = status.next();
        System.out.println("Order #" + orderId + " → " + status);
    }

    void showStatus() {
        System.out.print("Order #" + orderId + " : ");
        status.display();
    }
}

class Hello {
    public static void main(String args[]) {

        Order order = new Order(101);

        order.showStatus();    // Order #101 : PLACED → Order has been placed
        order.moveToNext();    // Order #101 → CONFIRMED
        order.moveToNext();    // Order #101 → SHIPPED
        order.moveToNext();    // Order #101 → DELIVERED
        order.showStatus();    // Order #101 : DELIVERED → Order delivered successfully
    }
}
```

### Stack & Heap

```
Order order = new Order(101);

Stack                              Heap
┌──────────────────┐              ┌──────────────────────────────────┐
│ main()           │              │ Order object                      │
│                  │              │ orderId = 101                     │
│ order ───────────┼─────────────►│ status ──┐                       │
│                  │              └──────────┼───────────────────────┘
└──────────────────┘                         │
                                             ▼    Method Area
                                  ┌──────────────────────────────────┐
                                  │ OrderStatus enum                  │
                                  │                                  │
                                  │ PLACED    → next() = CONFIRMED   │ ◄── initially
                                  │ CONFIRMED → next() = SHIPPED     │
                                  │ SHIPPED   → next() = DELIVERED   │
                                  │ DELIVERED → next() = DELIVERED   │
                                  └──────────────────────────────────┘

status reference changes as moveToNext() is called:
PLACED → CONFIRMED → SHIPPED → DELIVERED
Each constant knows what comes NEXT — state machine pattern!
```

---

## Enum vs Constants (Why Not Just Use static final?)

```java
// Without enum — using constants
class Size {
    static final int SMALL = 0;
    static final int MEDIUM = 1;
    static final int LARGE = 2;
}
int size = 999;   // no error! But 999 is not a valid size

// With enum
enum Size { SMALL, MEDIUM, LARGE }
Size size = Size.SMALL;   // only valid values allowed
// Size size = 999;        // ❌ COMPILE ERROR — type safety!
```

| Feature            | static final int/String    | Enum                        |
| ------------------ | -------------------------- | --------------------------- |
| Type safe?         | NO (any value allowed)     | YES (only defined values)   |
| Can have methods?  | NO                         | YES                         |
| Can have fields?   | NO                         | YES                         |
| Works in switch?   | YES                        | YES (cleaner)               |
| Iterable?          | NO                         | YES (values())              |
| Printable name?    | NO (prints 0, 1, 2)       | YES (prints SMALL, MEDIUM)  |

---

## Quick Summary

```
enum = fixed set of constants (type-safe, no typos, no invalid values)

enum Day { MON, TUE, WED }          ← basic
enum Size { SMALL(30), LARGE(50) }   ← with fields + constructor
enum Op { ADD { ... }, SUB { ... } } ← with abstract methods

Built-in methods:
  .name()     → constant name as String
  .ordinal()  → position index (0-based)
  .values()   → array of all constants
  .valueOf()  → String to enum
```

---

## Remember

```
Enum CAN have:
  ✅ Fields, constructors, methods
  ✅ Abstract methods (each constant defines its own)
  ✅ Implement interfaces
  ✅ Switch-case (perfect match)

Enum CANNOT:
  ❌ Be instantiated (no new)
  ❌ Extend a class (already extends java.lang.Enum)
  ❌ Have public constructor (always private)
```

---

## Common Mistakes

```java
// 1. Trying to create new enum object
// Day d = new Day();   // ❌ ERROR — constructor is private

// 2. Forgetting semicolon when enum has fields/methods
enum Size {
    SMALL, LARGE    // ❌ needs semicolon when adding fields below
    int x;
}
enum Size {
    SMALL, LARGE;   // ✅ correct
    int x;
}

// 3. valueOf with wrong String
// Day.valueOf("monday");   // ❌ RuntimeException — case sensitive!
// Day.valueOf("MONDAY");   // ✅ correct

// 4. Comparing with == is OK for enums (unlike objects)
Day d1 = Day.MONDAY;
Day d2 = Day.MONDAY;
System.out.println(d1 == d2);       // true — enums are singletons
System.out.println(d1.equals(d2));  // true — also works, but == is preferred
```
