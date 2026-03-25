# Final Keyword

`final` = once set, CANNOT be changed. Used with variables, methods, and classes.

---

## 1. Final Variable (Constant)

- Once assigned, value CANNOT change
- Convention: use UPPER_CASE for final variables

```java
class Hello {
    public static void main(String args[]) {

        final int MAX = 100;
        System.out.println(MAX);   // 100

        // MAX = 200;   // ERROR: cannot assign a value to final variable MAX
    }
}
```

### Stack & Heap

```
Stack
┌──────────────────┐
│ main()           │
│                  │
│ MAX = 100 (final)│   ← primitive, lives on Stack only
│ (CANNOT change)  │
└──────────────────┘

Heap
(empty — no objects created)
```

---

## 2. Final with Reference Variables

- The REFERENCE cannot change (can't point to new object)
- But the OBJECT's fields CAN still change

```java
class Student {
    String name;
    int age;

    Student(String name, int age) {
        this.name = name;
        this.age = age;
    }
}

class Hello {
    public static void main(String args[]) {

        final Student s = new Student("Amit", 20);

        s.age = 21;           // ALLOWED — changing object's field
        s.name = "Rahul";    // ALLOWED — changing object's field

        // s = new Student("New", 25);  // ERROR — cannot reassign final reference

        System.out.println(s.name + " " + s.age);  // Rahul 21
    }
}
```

### Stack & Heap

```
Stack                              Heap
┌──────────────────┐              ┌────────────────────────┐
│ main()           │              │ Student object          │
│                  │              │                        │
│ s (final) ───────┼─────────────►│ name = "Rahul"  ✅ CAN │
│                  │              │ age  = 21       ✅ CAN │
└──────────────────┘              └────────────────────────┘

s = new Student(...)   ❌ CANNOT (reference is final)
s.age = 21             ✅ CAN    (object's data is NOT final)

Think of it like: you can't move to a new house, but you CAN rearrange furniture inside.
```

---

## 3. Final Method

- A final method CANNOT be overridden by child class

```java
class Animal {
    final void breathe() {
        System.out.println("Breathing...");
    }

    void sound() {
        System.out.println("Some sound");
    }
}

class Dog extends Animal {
    // void breathe() { }    // ERROR: cannot override final method

    void sound() {           // ALLOWED — sound() is not final
        System.out.println("Bark!");
    }
}

class Hello {
    public static void main(String args[]) {
        Dog d = new Dog();
        d.breathe();   // Breathing...  (parent's method, can't override)
        d.sound();     // Bark!         (overridden)
    }
}
```

### Stack & Heap

```
Stack                              Heap
┌──────────────────┐              ┌───────────────────────────────┐
│ main()           │              │ Dog object                     │
│                  │              │                               │
│ d ───────────────┼─────────────►│ breathe() → "Breathing..."    │ ← LOCKED (final)
│                  │              │ sound()   → "Bark!"           │ ← overridden
└──────────────────┘              └───────────────────────────────┘

breathe() is final in Animal → Dog MUST use Animal's version
sound() is NOT final → Dog CAN override it
```

**Why use final methods?** When you want child classes to use your logic exactly — no changes allowed. Example: security checks, core business rules.

---

## 4. Final Class

- A final class CANNOT be extended (no child classes allowed)

```java
final class MathUtils {
    static int square(int n) {
        return n * n;
    }

    static int cube(int n) {
        return n * n * n;
    }
}

// class AdvMath extends MathUtils { }   // ERROR: cannot inherit from final class

class Hello {
    public static void main(String args[]) {
        System.out.println(MathUtils.square(5));   // 25
        System.out.println(MathUtils.cube(3));     // 27
    }
}
```

**Real-world:** `String` class in Java is `final` — nobody can extend it and mess with how Strings work.

---

## 5. Final with Arrays

- The reference is final, but array ELEMENTS can change

```java
class Hello {
    public static void main(String args[]) {

        final int nums[] = {10, 20, 30};

        nums[0] = 99;         // ALLOWED — changing element
        nums[1] = 88;         // ALLOWED — changing element

        // nums = new int[5]; // ERROR — cannot reassign final reference

        System.out.println(nums[0]);   // 99
    }
}
```

### Stack & Heap

```
Stack                              Heap
┌──────────────────┐              ┌────────────────────┐
│ main()           │              │ int[] object        │
│                  │              │                    │
│ nums (final) ────┼─────────────►│ [0] = 99   ✅ CAN  │
│                  │              │ [1] = 88   ✅ CAN  │
│                  │              │ [2] = 30   ✅ CAN  │
└──────────────────┘              └────────────────────┘

nums = new int[5]   ❌ CANNOT (reference is final)
nums[0] = 99        ✅ CAN    (elements are NOT final)

Same rule as final objects — reference locked, content is free.
```

---

## 6. Real-World Example - Configuration Settings

```java
class AppConfig {
    // Constants — never change during app lifetime
    static final String APP_NAME = "MyApp";
    static final int MAX_USERS = 1000;
    static final double VERSION = 2.5;
}

final class DatabaseCredentials {
    // Final class — nobody should extend and expose credentials
    private static final String URL = "jdbc:mysql://localhost:3306/mydb";
    private static final String USER = "admin";

    static String getUrl() { return URL; }
    static String getUser() { return USER; }
}

class Hello {
    public static void main(String args[]) {
        System.out.println(AppConfig.APP_NAME);     // MyApp
        System.out.println(AppConfig.MAX_USERS);     // 1000

        System.out.println(DatabaseCredentials.getUrl());   // jdbc:mysql://...
        System.out.println(DatabaseCredentials.getUser());  // admin

        // AppConfig.MAX_USERS = 5000;   // ERROR — final variable
    }
}
```

---

## Quick Summary

| What is final?     | What it means                          | Can change content? |
| ------------------ | -------------------------------------- | ------------------- |
| `final int x = 5`  | Value CANNOT change                    | No                  |
| `final Student s`   | Reference CANNOT change (can't reassign) | Yes (fields can)    |
| `final int[] arr`   | Reference CANNOT change                | Yes (elements can)  |
| `final void method` | Method CANNOT be overridden            | N/A                 |
| `final class Foo`   | Class CANNOT be extended               | N/A                 |

---

## Common Mistakes

```java
// 1. Forgetting to initialize final variable
final int x;
x = 10;        // OK — first assignment is allowed (blank final)
// x = 20;     // ERROR — second assignment not allowed

// 2. Thinking final object means frozen object
final Student s = new Student("A", 20);
s.age = 25;    // This WORKS! Only reference is final, not the object

// 3. Thinking final = immutable
// final only locks the reference/value
// For true immutability, make fields private + no setters + final class
```

## Remember

```
final variable → value locked
final reference → arrow locked, object free
final method   → can't override
final class    → can't extend
```
