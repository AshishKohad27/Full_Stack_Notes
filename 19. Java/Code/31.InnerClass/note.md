# Inner Classes

An inner class = a class INSIDE another class.

**Why?** When a class only makes sense in the context of another class — it doesn't need to exist independently.

---

## Types of Inner Classes

```
1. Non-Static Inner Class (Regular Inner Class)
2. Static Inner Class (Static Nested Class)
3. Anonymous Inner Class ← most important for interviews
```

---

## 1. Non-Static Inner Class

- Belongs to an INSTANCE of the outer class
- Can access ALL members of outer class (even private)
- Needs an outer object to exist

```java
class Outer {
    int x = 10;
    private int secret = 99;

    class Inner {
        void show() {
            // Can access outer class members directly — even private!
            System.out.println("x = " + x);
            System.out.println("secret = " + secret);
        }
    }
}

class Hello {
    public static void main(String args[]) {

        // Step 1: Create outer object
        Outer out = new Outer();

        // Step 2: Create inner object USING outer object
        Outer.Inner in = out.new Inner();

        in.show();
        // x = 10
        // secret = 99
    }
}
```

### Stack & Heap

```
Stack                              Heap
┌──────────────────┐              ┌─────────────────────────────────┐
│ main()           │              │ Outer object                     │
│                  │              │ x = 10                           │
│ out ─────────────┼─────────────►│ secret = 99                      │
│                  │              │                                  │
│                  │              │  ┌─────────────────────────────┐ │
│ in ──────────────┼──────────────┼─►│ Inner object               │ │
│                  │              │  │ (has reference to Outer)    │ │
└──────────────────┘              │  └─────────────────────────────┘ │
                                  └─────────────────────────────────┘

Inner object lives INSIDE the context of Outer object.
Inner can access Outer's private members because it's part of the same class.
```

### When to use?
- When Inner class has no meaning without Outer class
- Example: `Engine` inside `Car`, `Node` inside `LinkedList`

---

## 2. Static Inner Class (Static Nested Class)

- Belongs to the CLASS, not an instance
- Can ONLY access static members of outer class
- Does NOT need an outer object to exist

```java
class Outer {
    int x = 10;             // instance variable
    static int y = 20;      // static variable

    static class Inner {
        void show() {
            // System.out.println(x);  // ERROR — can't access non-static
            System.out.println("y = " + y);   // OK — static member
        }
    }
}

class Hello {
    public static void main(String args[]) {

        // No need for outer object!
        Outer.Inner in = new Outer.Inner();
        in.show();   // y = 20
    }
}
```

### Stack & Heap

```
Stack                              Heap
┌──────────────────┐              ┌──────────────────────────┐
│ main()           │              │ Inner object              │
│                  │              │ (independent, no Outer)   │
│ in ──────────────┼─────────────►│                          │
│                  │              └──────────────────────────┘
└──────────────────┘
                                  Method Area
                                  ┌──────────────────────────┐
                                  │ Outer.y = 20 (static)    │
                                  └──────────────────────────┘

No Outer object exists — Inner is independent.
Can only access Outer's static members from the Method Area.
```

### When to use?
- When inner class is logically related but doesn't need outer instance
- Example: `Builder` pattern, utility grouping

---

## 3. Non-Static vs Static Inner Class

| Feature                | Non-Static Inner          | Static Inner               |
| ---------------------- | ------------------------- | -------------------------- |
| Needs outer object?    | YES (`out.new Inner()`)   | NO (`new Outer.Inner()`)   |
| Access instance vars?  | YES (even private)        | NO (only static)           |
| Access static vars?    | YES                       | YES                        |
| Use case               | Tightly coupled to outer  | Loosely coupled, utility   |

---

## 4. Anonymous Inner Class — THE MOST IMPORTANT

An anonymous class = a class with **no name** that is **created and used in one place**.

### The Problem — Why Not Just Extend?

```java
abstract class Animal {
    abstract void sound();
}

// Normal way — create a named class for every animal
class Dog extends Animal {
    void sound() {
        System.out.println("Bark!");
    }
}

class Cat extends Animal {
    void sound() {
        System.out.println("Meow!");
    }
}

class Parrot extends Animal {
    void sound() {
        System.out.println("Hello!");
    }
}
// ... what if you need 50 animals? 50 separate class files!
```

**Problem with extending:**
- You need a **separate class file** for EVERY variation
- If you use it only ONCE, creating a whole class is overkill
- Your project gets cluttered with tiny single-use classes

### The Solution — Anonymous Inner Class

```java
abstract class Animal {
    abstract void sound();
}

class Hello {
    public static void main(String args[]) {

        // Anonymous class — no name, created right here, used once
        Animal dog = new Animal() {
            void sound() {
                System.out.println("Bark!");
            }
        };

        Animal cat = new Animal() {
            void sound() {
                System.out.println("Meow!");
            }
        };

        dog.sound();   // Bark!
        cat.sound();   // Meow!

        // No Dog.java, no Cat.java needed!
        // The class is defined AND used in one place
    }
}
```

### Wait — `new Animal()`? But Animal is abstract!

```
You're NOT creating an Animal object.
You're creating an UNNAMED class that extends Animal, and creating its object.

new Animal() {           ← this creates a hidden class like "Animal$1"
    void sound() { }     ← this defines the abstract method
};                       ← this creates an object of that hidden class
```

### Stack & Heap — Anonymous Class

```
Animal dog = new Animal() { void sound() { ... } };

Stack                              Heap
┌──────────────────┐              ┌───────────────────────────────────┐
│ main()           │              │ Anonymous class object (Animal$1)  │
│                  │              │                                   │
│ dog ─────────────┼─────────────►│ sound() → "Bark!"                 │
│ (type: Animal)   │              └───────────────────────────────────┘
│                  │
│ cat ─────────────┼─────────────►┌───────────────────────────────────┐
│ (type: Animal)   │              │ Anonymous class object (Animal$2)  │
│                  │              │                                   │
└──────────────────┘              │ sound() → "Meow!"                 │
                                  └───────────────────────────────────┘

Java internally creates Animal$1 and Animal$2 classes.
You never see these names — that's why they're "anonymous".
```

---

## 5. Anonymous Class with Interface

Works the same way — define the interface methods right where you need them.

```java
interface Greeting {
    void greet();
}

class Hello {
    public static void main(String args[]) {

        // Without anonymous class — need a separate class
        // class EnglishGreeting implements Greeting {
        //     public void greet() { System.out.println("Hello!"); }
        // }

        // With anonymous class — done in one place
        Greeting english = new Greeting() {
            public void greet() {
                System.out.println("Hello!");
            }
        };

        Greeting hindi = new Greeting() {
            public void greet() {
                System.out.println("Namaste!");
            }
        };

        english.greet();   // Hello!
        hindi.greet();     // Namaste!
    }
}
```

---

## 6. Anonymous Class with Regular Class (Override a method)

You can even override methods of a regular (non-abstract) class anonymously.

```java
class Calculator {
    int calculate(int a, int b) {
        return a + b;   // default: addition
    }
}

class Hello {
    public static void main(String args[]) {

        // Normal calculator — adds
        Calculator adder = new Calculator();
        System.out.println("Add: " + adder.calculate(5, 3));   // 8

        // Anonymous class — override to subtract
        Calculator subtractor = new Calculator() {
            int calculate(int a, int b) {
                return a - b;
            }
        };
        System.out.println("Sub: " + subtractor.calculate(5, 3));   // 2

        // Anonymous class — override to multiply
        Calculator multiplier = new Calculator() {
            int calculate(int a, int b) {
                return a * b;
            }
        };
        System.out.println("Mul: " + multiplier.calculate(5, 3));   // 15
    }
}
```

---

## 6b. Abstract + Anonymous Combined — The Full Picture

This is where it all clicks. Abstract forces a contract, anonymous fulfills it instantly.

### The Problem

```java
abstract class Notification {
    String to;

    Notification(String to) {
        this.to = to;
    }

    // WHAT to send — every notification type is different
    abstract void send();

    // HOW to log — same for all
    void log() {
        System.out.println("Notification sent to " + to);
    }
}

// Normal way — separate class for each type
class EmailNotification extends Notification {
    EmailNotification(String to) { super(to); }
    void send() { System.out.println("Email sent to " + to); }
}

class SMSNotification extends Notification {
    SMSNotification(String to) { super(to); }
    void send() { System.out.println("SMS sent to " + to); }
}

// What if you need a one-time push notification?
// Do you really need PushNotification.java for ONE use?
```

### The Solution — Abstract + Anonymous

```java
abstract class Notification {
    String to;

    Notification(String to) {
        this.to = to;
    }

    abstract void send();

    void log() {
        System.out.println("Notification sent to " + to);
    }
}

class Hello {
    public static void main(String args[]) {

        // Reusable types — use named classes
        // One-time types — use anonymous classes

        // Anonymous: Email (one-time use)
        Notification email = new Notification("amit@gmail.com") {
            void send() {
                System.out.println("📧 Email sent to " + to);
            }
        };

        // Anonymous: SMS (one-time use)
        Notification sms = new Notification("9876543210") {
            void send() {
                System.out.println("📱 SMS sent to " + to);
            }
        };

        // Anonymous: Push with extra logic (one-time use)
        Notification push = new Notification("user123") {
            void send() {
                System.out.println("🔔 Push notification sent to " + to);
                System.out.println("   Priority: HIGH");
            }
        };

        // Process all — polymorphism + abstract + anonymous
        Notification all[] = { email, sms, push };

        for (Notification n : all) {
            n.send();
            n.log();
            System.out.println("---");
        }
    }
}
```

**Output:**
```
📧 Email sent to amit@gmail.com
Notification sent to amit@gmail.com
---
📱 SMS sent to 9876543210
Notification sent to 9876543210
---
🔔 Push notification sent to user123
   Priority: HIGH
Notification sent to user123
---
```

### Stack & Heap — Abstract + Anonymous

```
Stack                              Heap
┌──────────────────┐              ┌─────────────────────────────────────┐
│ main()           │              │ Anonymous Notification$1 object      │
│                  │              │ to = "amit@gmail.com"                │
│ email ───────────┼─────────────►│ send() → "Email sent to..."         │
│ (type:           │              │ log()  → inherited from Notification │
│  Notification)   │              └─────────────────────────────────────┘
│                  │
│ sms ─────────────┼─────────────►┌─────────────────────────────────────┐
│ (type:           │              │ Anonymous Notification$2 object      │
│  Notification)   │              │ to = "9876543210"                    │
│                  │              │ send() → "SMS sent to..."            │
│                  │              │ log()  → inherited from Notification │
│                  │              └─────────────────────────────────────┘
│                  │
│ push ────────────┼─────────────►┌─────────────────────────────────────┐
│ (type:           │              │ Anonymous Notification$3 object      │
│  Notification)   │              │ to = "user123"                       │
│                  │              │ send() → "Push notification..."      │
└──────────────────┘              │ log()  → inherited from Notification │
                                  └─────────────────────────────────────┘

3 anonymous classes created: Notification$1, $2, $3
Each has:
  - "to" field from abstract class constructor
  - Their own send() implementation
  - Inherited log() from abstract class
All stored as Notification type → polymorphism works!
```

### Why This Combo is Powerful

```
Abstract class gives you:
  ✅ Constructor (initialize data like "to")
  ✅ Common methods (log() — write once, all inherit)
  ✅ Contract (send() — MUST be defined)

Anonymous class gives you:
  ✅ No separate file needed
  ✅ Inline implementation
  ✅ Quick one-time use

Together:
  Abstract = the RULES
  Anonymous = the quick ANSWER to those rules
```

---

## 7. When to Use What?

### Use Named Class (extend/implement) When:
- You'll reuse the class in MANY places
- The class has multiple methods or complex logic
- You need multiple instances across the project

### Use Anonymous Class When:
- You use it ONLY ONCE
- You just need to override 1-2 methods
- You want quick, inline implementation
- Event handlers (button clicks, etc.)

```
Named Class = reusable, multi-use → separate file
Anonymous Class = one-time, quick → inline
```

---

## 8. Real-World Example — Event Handling (Button Clicks)

```java
interface OnClickListener {
    void onClick(String buttonName);
}

class Button {
    String name;
    OnClickListener listener;

    Button(String name) {
        this.name = name;
    }

    void setOnClickListener(OnClickListener listener) {
        this.listener = listener;
    }

    void click() {
        if (listener != null) {
            listener.onClick(name);
        }
    }
}

class Hello {
    public static void main(String args[]) {

        Button loginBtn = new Button("Login");
        Button signupBtn = new Button("Signup");

        // Anonymous class — different behavior for each button
        loginBtn.setOnClickListener(new OnClickListener() {
            public void onClick(String buttonName) {
                System.out.println(buttonName + " clicked → Logging in...");
            }
        });

        signupBtn.setOnClickListener(new OnClickListener() {
            public void onClick(String buttonName) {
                System.out.println(buttonName + " clicked → Signing up...");
            }
        });

        loginBtn.click();    // Login clicked → Logging in...
        signupBtn.click();   // Signup clicked → Signing up...
    }
}
```

### Stack & Heap — Event Handling

```
Stack                              Heap
┌──────────────────┐              ┌─────────────────────────────────────┐
│ main()           │              │ Button "Login"                       │
│                  │              │ name = "Login"                       │
│ loginBtn ────────┼─────────────►│ listener ──►┌─────────────────────┐ │
│                  │              │             │ Anonymous class obj  │ │
│                  │              │             │ onClick() → "Log in" │ │
│                  │              │             └─────────────────────┘ │
│                  │              └─────────────────────────────────────┘
│                  │
│ signupBtn ───────┼─────────────►┌─────────────────────────────────────┐
│                  │              │ Button "Signup"                      │
└──────────────────┘              │ name = "Signup"                      │
                                  │ listener ──►┌─────────────────────┐ │
                                  │             │ Anonymous class obj  │ │
                                  │             │ onClick() → "Sign up"│ │
                                  │             └─────────────────────┘ │
                                  └─────────────────────────────────────┘

Each button has its own anonymous OnClickListener object.
No need for LoginClickListener.java, SignupClickListener.java etc.
This is how Android, Swing, JavaFX handle events!
```

---

## Quick Summary

| Type               | Syntax                          | Needs Outer Object? | Use Case                       |
| ------------------ | ------------------------------- | ------------------- | ------------------------------ |
| Non-Static Inner   | `out.new Inner()`               | YES                 | Tightly coupled to outer       |
| Static Inner       | `new Outer.Inner()`             | NO                  | Utility, loosely coupled       |
| Anonymous Class    | `new Interface() { ... }`       | NO                  | One-time use, event handlers   |

---

## Named Class vs Anonymous Class — The Decision

```
Q: Will I use this class more than once?
   YES → Make a named class (extend/implement normally)
   NO  → Use anonymous class

Q: Does the class have complex logic or many methods?
   YES → Make a named class
   NO  → Use anonymous class

Q: Is it just an event handler or callback?
   YES → Anonymous class (or lambda in Java 8+)
```

---

## Common Mistakes

```java
// 1. Forgetting semicolon after anonymous class
Animal a = new Animal() {
    void sound() { }
}    // ERROR — missing semicolon!
};   // CORRECT — anonymous class is an expression, needs ;

// 2. Trying to access non-static outer var from static inner
class Outer {
    int x = 10;
    static class Inner {
        // void show() { System.out.println(x); }  // ERROR
    }
}

// 3. Trying to create inner without outer
class Outer {
    class Inner { }
}
// Outer.Inner in = new Outer.Inner();   // ERROR for non-static
// Outer.Inner in = new Outer().new Inner();  // CORRECT
```
