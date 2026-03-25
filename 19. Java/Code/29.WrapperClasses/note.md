# Wrapper Classes, Boxing & Unboxing

Every primitive type has a corresponding **wrapper class** (object version).
Why? Because some things in Java ONLY work with objects (Collections, Generics, etc.)

```
Primitive  →  Wrapper Class
────────────────────────────
byte       →  Byte
short      →  Short
int        →  Integer
long       →  Long
float      →  Float
double     →  Double
char       →  Character
boolean    →  Boolean
```

---

## 1. Why Do We Need Wrapper Classes?

```java
// ArrayList ONLY works with objects, NOT primitives
// ArrayList<int> nums = new ArrayList<int>();    // ERROR!
// ArrayList<Integer> nums = new ArrayList<Integer>();  // WORKS!

// Also useful for:
// - Converting String to number: Integer.parseInt("123")
// - Null values: Integer can be null, int cannot
// - Utility methods: Integer.MAX_VALUE, Integer.toBinaryString()
```

---

## 2. Boxing (Primitive → Object) — Manual

Converting a primitive into its wrapper class object **manually**.

```java
class Hello {
    public static void main(String args[]) {

        // Boxing — wrapping primitive inside an object
        int a = 10;
        Integer num = Integer.valueOf(a);   // boxing (manual)

        double d = 5.5;
        Double dObj = Double.valueOf(d);    // boxing

        char c = 'A';
        Character cObj = Character.valueOf(c);  // boxing

        System.out.println(num);    // 10
        System.out.println(dObj);   // 5.5
        System.out.println(cObj);   // A
    }
}
```

### Stack & Heap — Boxing

```
int a = 10;
Integer num = Integer.valueOf(a);

Stack                              Heap
┌──────────────────┐              ┌──────────────────────┐
│ main()           │              │ Integer object        │
│                  │              │                      │
│ a = 10           │              │ value = 10            │
│ (primitive)      │              └──────────────────────┘
│                  │                        ▲
│ num ─────────────┼────────────────────────┘
│ (reference)      │
└──────────────────┘

a lives directly on Stack (primitive)
num is a reference on Stack → points to Integer object on Heap
Both hold value 10, but stored differently in memory
```

---

## 3. Unboxing (Object → Primitive) — Manual

Converting a wrapper class object BACK to primitive **manually**.

```java
class Hello {
    public static void main(String args[]) {

        Integer num = Integer.valueOf(20);

        // Unboxing — extracting primitive from object
        int a = num.intValue();         // unboxing (manual)

        Double dObj = Double.valueOf(9.8);
        double d = dObj.doubleValue();  // unboxing

        Boolean bObj = Boolean.valueOf(true);
        boolean b = bObj.booleanValue(); // unboxing

        System.out.println(a);    // 20
        System.out.println(d);    // 9.8
        System.out.println(b);    // true
    }
}
```

### Stack & Heap — Unboxing

```
Integer num = Integer.valueOf(20);
int a = num.intValue();

Stack                              Heap
┌──────────────────┐              ┌──────────────────────┐
│ main()           │              │ Integer object        │
│                  │              │                      │
│ num ─────────────┼─────────────►│ value = 20            │
│ (reference)      │              └──────────────────────┘
│                  │
│ a = 20           │   ← value COPIED from Heap object to Stack
│ (primitive)      │
└──────────────────┘

Unboxing = extracting the value from the Heap object into a Stack primitive
```

---

## 4. Auto-Boxing (Primitive → Object) — Automatic

Java does the boxing **automatically** — no need to write `Integer.valueOf()`.

```java
class Hello {
    public static void main(String args[]) {

        // Auto-boxing — Java wraps automatically
        Integer num = 10;        // auto-boxing (int → Integer)
        Double d = 5.5;          // auto-boxing (double → Double)
        Character c = 'A';       // auto-boxing (char → Character)
        Boolean b = true;        // auto-boxing (boolean → Boolean)

        // Behind the scenes Java does:
        // Integer num = Integer.valueOf(10);

        System.out.println(num);   // 10
        System.out.println(d);     // 5.5
        System.out.println(c);     // A
        System.out.println(b);     // true
    }
}
```

### Stack & Heap — Auto-Boxing

```
Integer num = 10;    // Java internally does: Integer.valueOf(10)

Stack                              Heap
┌──────────────────┐              ┌──────────────────────┐
│ main()           │              │ Integer object        │
│                  │              │                      │
│ num ─────────────┼─────────────►│ value = 10            │
│                  │              └──────────────────────┘
│ d ───────────────┼─────────────►┌──────────────────────┐
│                  │              │ Double object         │
│                  │              │ value = 5.5           │
│                  │              └──────────────────────┘
│ c ───────────────┼─────────────►┌──────────────────────┐
│                  │              │ Character object      │
│                  │              │ value = 'A'           │
│                  │              └──────────────────────┘
│ b ───────────────┼─────────────►┌──────────────────────┐
│                  │              │ Boolean object        │
│                  │              │ value = true          │
└──────────────────┘              └──────────────────────┘

You write: Integer num = 10;
Java does:  Integer num = Integer.valueOf(10);
Same result, less code.
```

---

## 5. Auto-Unboxing (Object → Primitive) — Automatic

Java extracts the primitive **automatically** — no need to write `.intValue()`.

```java
class Hello {
    public static void main(String args[]) {

        Integer num = 20;       // auto-boxing
        int a = num;            // auto-unboxing (Integer → int)

        Double dObj = 9.8;      // auto-boxing
        double d = dObj;        // auto-unboxing (Double → double)

        // Behind the scenes Java does:
        // int a = num.intValue();

        System.out.println(a);   // 20
        System.out.println(d);   // 9.8

        // Works in expressions too!
        Integer x = 10;
        Integer y = 20;
        int sum = x + y;        // auto-unboxing both, then adding
        System.out.println(sum); // 30
    }
}
```

### Stack & Heap — Auto-Unboxing in Expressions

```
Integer x = 10;
Integer y = 20;
int sum = x + y;

Stack                              Heap
┌──────────────────┐              ┌──────────────────────┐
│ main()           │              │ Integer object        │
│                  │              │ value = 10            │
│ x ───────────────┼─────────────►└──────────────────────┘
│                  │
│ y ───────────────┼─────────────►┌──────────────────────┐
│                  │              │ Integer object        │
│                  │              │ value = 20            │
│                  │              └──────────────────────┘
│ sum = 30         │
│ (primitive)      │   ← Java auto-unboxes x and y, adds them, stores result
└──────────────────┘

x + y → Java does: x.intValue() + y.intValue() → 10 + 20 → 30
```

---

## 6. Integer Caching (Tricky Interview Topic)

Java caches Integer objects for values **-128 to 127**. Same value = same object.

```java
class Hello {
    public static void main(String args[]) {

        // Values in cache range (-128 to 127)
        Integer a = 100;
        Integer b = 100;
        System.out.println(a == b);       // true  (same cached object)
        System.out.println(a.equals(b));  // true

        // Values OUTSIDE cache range
        Integer c = 200;
        Integer d = 200;
        System.out.println(c == d);       // false (different objects!)
        System.out.println(c.equals(d));  // true  (same value)
    }
}
```

### Stack & Heap — Integer Cache

```
Integer a = 100;  Integer b = 100;    (cached range)

Stack                              Heap (Integer Cache)
┌──────────────────┐              ┌──────────────────────┐
│ a ───────────────┼──────┐       │ Integer object        │
│                  │      ├──────►│ value = 100           │
│ b ───────────────┼──────┘       └──────────────────────┘
└──────────────────┘              (SAME object — cached!)


Integer c = 200;  Integer d = 200;    (outside cache)

Stack                              Heap
┌──────────────────┐              ┌──────────────────────┐
│ c ───────────────┼─────────────►│ Integer object        │
│                  │              │ value = 200           │
│ d ───────────────┼──────┐       └──────────────────────┘
│                  │      │
└──────────────────┘      └──────►┌──────────────────────┐
                                  │ Integer object        │
                                  │ value = 200           │
                                  └──────────────────────┘
                                  (DIFFERENT objects!)

== checks reference (are they same object?)
.equals() checks value (do they hold same number?)
ALWAYS use .equals() for comparing wrapper objects!
```

---

## 7. Useful Wrapper Methods

```java
class Hello {
    public static void main(String args[]) {

        // String → Number
        int a = Integer.parseInt("123");          // 123
        double d = Double.parseDouble("9.8");     // 9.8

        // Number → String
        String s1 = Integer.toString(456);        // "456"
        String s2 = String.valueOf(789);          // "789"

        // Useful constants
        System.out.println(Integer.MAX_VALUE);    // 2147483647
        System.out.println(Integer.MIN_VALUE);    // -2147483648
        System.out.println(Double.MAX_VALUE);     // 1.7976931348623157E308

        // Number system conversions
        System.out.println(Integer.toBinaryString(10));  // 1010
        System.out.println(Integer.toHexString(255));    // ff
        System.out.println(Integer.toOctalString(8));    // 10

        // Character utility methods
        System.out.println(Character.isLetter('A'));     // true
        System.out.println(Character.isDigit('5'));      // true
        System.out.println(Character.toUpperCase('a'));  // A
        System.out.println(Character.toLowerCase('Z'));  // z
    }
}
```

---

## 8. Real-World Example — Shopping Cart

```java
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
}

class Hello {
    public static void main(String args[]) {
        ShoppingCart cart = new ShoppingCart();
        cart.addItem("Laptop", 50000.0);
        cart.addItem("Mouse", 500.0);
        cart.addItem("Keyboard", 1500.0);
        cart.showCart();
    }
}
```

### Stack & Heap — Shopping Cart

```
Stack                              Heap
┌──────────────────┐              ┌─────────────────────────────────────┐
│ main()           │              │ ShoppingCart object                  │
│                  │              │                                     │
│ cart ────────────┼─────────────►│ items ──►ArrayList["Laptop","Mouse"]│
│                  │              │ prices ─►ArrayList[50000.0, 500.0]  │
└──────────────────┘              │                     ▲               │
                                  │          Double objects (auto-boxed)│
                                  └─────────────────────────────────────┘

prices.add(500.0) → Java auto-boxes: prices.add(Double.valueOf(500.0))
total += p         → Java auto-unboxes: total += p.doubleValue()
You never see it, but boxing/unboxing happens behind the scenes!
```

---

## Quick Summary

| Term           | What it does               | Example                        | Who does it? |
| -------------- | -------------------------- | ------------------------------ | ------------ |
| Boxing         | primitive → object         | `Integer.valueOf(10)`          | You (manual) |
| Unboxing       | object → primitive         | `num.intValue()`               | You (manual) |
| Auto-Boxing    | primitive → object (auto)  | `Integer num = 10;`            | Java (auto)  |
| Auto-Unboxing  | object → primitive (auto)  | `int a = num;`                 | Java (auto)  |

---

## Remember

```
int → Integer       = Boxing        (manual: Integer.valueOf())
Integer → int       = Unboxing      (manual: .intValue())
int → Integer       = Auto-Boxing   (automatic: Integer num = 10)
Integer → int       = Auto-Unboxing (automatic: int a = num)

Collections need objects → use Wrapper classes
Always use .equals() to compare wrappers, NOT ==
Integer caches -128 to 127 → == works only in this range (tricky!)
```

## Common Mistakes

```java
// 1. Using == instead of .equals()
Integer a = 200;
Integer b = 200;
System.out.println(a == b);        // false! (different objects)
System.out.println(a.equals(b));   // true   (same value)

// 2. NullPointerException with auto-unboxing
Integer num = null;
int a = num;    // CRASH! NullPointerException — can't unbox null

// 3. Unnecessary boxing in loops (performance issue)
// BAD:
Long sum = 0L;
for (int i = 0; i < 1000000; i++) {
    sum += i;   // creates a new Long object every iteration!
}
// GOOD:
long sum2 = 0L;   // use primitive for calculations
for (int i = 0; i < 1000000; i++) {
    sum2 += i;
}
```
