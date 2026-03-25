# Interface

## What is an Interface?

An interface is a **pure contract** — it tells WHAT to do, but NOT how to do it.

Think of it like a **blueprint/idea**:
- "Computer" is an IDEA — it should turn on, turn off, and process data
- HOW it does it depends on whether it's a Laptop, Desktop, or Server

```
Interface  = the IDEA (what should be done)
Class      = the IMPLEMENTATION (how it's actually done)
```

---

## FIRST — Let's Try with Abstract Class (Same Example)

Let's build Computer → Laptop, Desktop, Developer using abstract class and see the PROBLEMS.

```java
abstract class Computer {
    abstract void turnOn();
    abstract void turnOff();
    abstract void process(String task);
}

class Laptop extends Computer {
    void turnOn()  { System.out.println("Laptop: Opening lid, booting up..."); }
    void turnOff() { System.out.println("Laptop: Closing lid, shutting down..."); }
    void process(String task) { System.out.println("Laptop processing: " + task); }
}

class Desktop extends Computer {
    void turnOn()  { System.out.println("Desktop: Power button, fans spinning..."); }
    void turnOff() { System.out.println("Desktop: Saving state, powering off..."); }
    void process(String task) { System.out.println("Desktop processing: " + task); }
}
```

### Now the Developer needs to code AND use a computer:

```java
abstract class CodeWriter {
    abstract void writeCode(String language);
    abstract void deploy(String env);
}

// PROBLEM: Developer needs to be BOTH a CodeWriter AND use Computer
// class Developer extends Computer, CodeWriter { }   // ❌ ERROR!
// Java does NOT allow extending TWO classes!
```

### The Problem with Abstract

```
Computer ←── Laptop
         ←── Desktop

CodeWriter ←── Developer

Developer wants to:
  ✅ Use a Computer (Laptop/Desktop)
  ✅ Write code
  ✅ Deploy

But Developer can only EXTEND ONE class!
  extends Computer?  → can't extend CodeWriter
  extends CodeWriter? → can't extend Computer

STUCK! 🚫 Abstract class fails here.
```

### Workaround with Abstract — Ugly and Forced

```java
// Force everything into ONE abstract class
abstract class ComputerDeveloper {
    abstract void turnOn();
    abstract void turnOff();
    abstract void process(String task);
    abstract void writeCode(String language);
    abstract void deploy(String env);
}

// Now EVERY class must implement ALL methods — even if irrelevant
class Laptop extends ComputerDeveloper {
    void turnOn()  { System.out.println("Laptop ON"); }
    void turnOff() { System.out.println("Laptop OFF"); }
    void process(String task) { System.out.println("Processing " + task); }
    void writeCode(String language) { }   // ❌ Laptop doesn't write code!
    void deploy(String env) { }           // ❌ Laptop doesn't deploy!
}
// Laptop is forced to implement writeCode() and deploy() — makes NO sense!
```

**This is BAD because:**
- Laptop should NOT have writeCode() and deploy()
- Desktop should NOT have writeCode() and deploy()
- You're mixing unrelated responsibilities into one class
- Adding a new capability (Portable, Upgradeable) means changing the abstract class — breaks everything

---

## NOW — Same Example with Interface (The Right Way)

```java
interface Computer {
    void turnOn();
    void turnOff();
    void process(String task);
}

interface CodeWriter {
    void writeCode(String language);
}

interface Deployable {
    void deploy(String env);
}

class Laptop implements Computer {
    public void turnOn()  { System.out.println("Laptop: Opening lid, booting up..."); }
    public void turnOff() { System.out.println("Laptop: Closing lid, shutting down..."); }
    public void process(String task) { System.out.println("Laptop processing: " + task); }
}

class Desktop implements Computer {
    public void turnOn()  { System.out.println("Desktop: Power button, fans spinning..."); }
    public void turnOff() { System.out.println("Desktop: Saving state, powering off..."); }
    public void process(String task) { System.out.println("Desktop processing: " + task + " (full power!)"); }
}

// Developer implements MULTIPLE interfaces — no problem!
class Developer implements CodeWriter, Deployable {
    String name;
    Computer machine;

    Developer(String name, Computer machine) {
        this.name = name;
        this.machine = machine;
    }

    public void writeCode(String language) {
        System.out.println(name + " is writing " + language + " code");
    }

    public void deploy(String env) {
        System.out.println(name + " deploys to " + env);
    }

    void startWork() {
        machine.turnOn();
        System.out.println(name + " opens VS Code");
    }

    void endWork() {
        machine.turnOff();
    }
}

class Hello {
    public static void main(String args[]) {
        Computer laptop = new Laptop();
        Computer desktop = new Desktop();

        Developer dev1 = new Developer("Amit", laptop);
        Developer dev2 = new Developer("Priya", desktop);

        dev1.startWork();              // Laptop ON → opens VS Code
        dev1.writeCode("Java");        // Amit is writing Java code
        dev1.deploy("production");     // Amit deploys to production
        dev1.endWork();                // Laptop OFF

        System.out.println("===");

        dev2.startWork();              // Desktop ON → opens VS Code
        dev2.writeCode("Python");      // Priya is writing Python code
        dev2.deploy("staging");        // Priya deploys to staging
        dev2.endWork();                // Desktop OFF
    }
}
```

### Stack & Heap

```
Stack                              Heap
┌──────────────────┐              ┌──────────────────────────────────┐
│ main()           │              │ Laptop object                     │
│                  │              │ turnOn()  → "Opening lid..."      │
│ laptop ──────────┼──────┐       │ turnOff() → "Closing lid..."     │
│ (type: Computer) │      │       │ process() → "Laptop processing"  │
│                  │      │       └──────────────────────────────────┘
│                  │      │                ▲
│ dev1 ────────────┼──────┼──────►┌────────┼─────────────────────────┐
│                  │      │       │ Developer object                  │
│                  │      │       │ name = "Amit"                     │
│                  │      └───────│ machine ──┘                       │
│                  │              │ writeCode() → "writing Java code" │
│                  │              │ deploy() → "deploys to production"│
│                  │              └──────────────────────────────────┘
└──────────────────┘

Developer HAS-A Computer (Laptop) — composition through interface.
Developer IS-A CodeWriter + Deployable — multiple interfaces.
Laptop IS-A Computer — single interface.
Each class only has what it NEEDS. Nothing forced!
```

---

## WHY Interface Won Here — The Comparison

```
ABSTRACT CLASS APPROACH:
  ❌ Can only extend ONE class
  ❌ Laptop forced to have writeCode(), deploy()
  ❌ Developer can't be both Computer and CodeWriter
  ❌ Adding new capability = change abstract class = break all children
  ❌ Mixes unrelated things together

INTERFACE APPROACH:
  ✅ Laptop implements Computer ONLY (no irrelevant methods)
  ✅ Developer implements CodeWriter + Deployable (multiple!)
  ✅ Developer HAS-A Computer (composition — flexible)
  ✅ Adding new capability = new interface, no existing code breaks
  ✅ Each class has ONLY what it needs

RULE OF THUMB:
  Abstract = when classes SHARE code and ARE related (Animal → Dog, Cat)
  Interface = when classes SHARE behavior but are NOT related (Laptop, Developer both "work")
```

---

## 1. Basic Interface Syntax

- All methods are `public abstract` by default (no body)
- All variables are `public static final` by default (constants)
- A class `implements` an interface (not `extends`)

---

## 1b. Interface Variables — How They Are Defined

Variables in an interface are **automatically** `public static final` — you don't need to write it.

```java
interface Config {
    // You write this:
    int MAX_USERS = 100;
    String APP_NAME = "MyApp";
    double VERSION = 2.5;

    // Java reads it as:
    // public static final int MAX_USERS = 100;
    // public static final String APP_NAME = "MyApp";
    // public static final double VERSION = 2.5;
}

class Hello {
    public static void main(String args[]) {
        System.out.println(Config.APP_NAME);    // MyApp
        System.out.println(Config.MAX_USERS);    // 100
        System.out.println(Config.VERSION);      // 2.5

        // Config.MAX_USERS = 200;   // ❌ ERROR — it's final!
    }
}
```

### How interface variables are processed:

```
You write:          int MAX = 100;
Java makes it:      public static final int MAX = 100;

Step by step:
  public  → accessible from anywhere
  static  → belongs to interface, not an object (access via Config.MAX)
  final   → value CANNOT change once assigned

Because of this:
  ✅ Config.MAX_USERS       → works (it's static, access by interface name)
  ❌ Config.MAX_USERS = 200 → ERROR (it's final, can't change)
  ❌ You can't have non-final variables in interface
  ❌ You can't have instance variables in interface
```

### Stack & Heap — Interface Variables

```
System.out.println(Config.MAX_USERS);

Stack                              Method Area
┌──────────────────┐              ┌──────────────────────────────┐
│ main()           │              │ Config (interface)            │
│                  │              │                              │
│ (no object       │              │ MAX_USERS = 100  (final)     │
│  needed!)        │              │ APP_NAME = "MyApp" (final)   │
│                  │              │ VERSION = 2.5    (final)     │
└──────────────────┘              └──────────────────────────────┘
                                              Heap
                                  ┌──────────────────────────────┐
                                  │ String "MyApp" (String Pool)  │
                                  └──────────────────────────────┘

Interface variables live in Method Area (like static vars).
No object is created — access directly by interface name.
They are constants — set once, never changed.
```

### Where interface variables are useful:

```java
interface HttpStatus {
    int OK = 200;
    int NOT_FOUND = 404;
    int SERVER_ERROR = 500;
}

interface MathConstants {
    double PI = 3.14159;
    double E = 2.71828;
}

class Hello {
    public static void main(String args[]) {
        System.out.println(HttpStatus.OK);          // 200
        System.out.println(HttpStatus.NOT_FOUND);   // 404
        System.out.println(MathConstants.PI);        // 3.14159
    }
}
```

### Interface vs Class Variables

| Feature              | Interface Variable         | Class Variable          |
| -------------------- | -------------------------- | ----------------------- |
| Default modifiers    | `public static final`      | none (package-private)  |
| Can change value?    | NO (always final)          | YES (unless final)      |
| Need object?         | NO (always static)         | YES (unless static)     |
| Can be private?      | NO (always public)         | YES                     |
| Use case             | Constants, config values   | Any data                |

---

## 2. Multiple Interfaces — Java's Answer to Multiple Inheritance

A class can only `extends` ONE class. But it can `implements` MULTIPLE interfaces!

```java
interface Computer {
    void turnOn();
    void process(String task);
}

interface Portable {
    void carryAround();
    int getBatteryLife();
}

interface Upgradeable {
    void upgradeRAM(int gb);
    void upgradeStorage(int gb);
}

// Laptop implements ALL THREE interfaces
class Laptop implements Computer, Portable, Upgradeable {

    public void turnOn() {
        System.out.println("Laptop booting up...");
    }

    public void process(String task) {
        System.out.println("Processing: " + task);
    }

    public void carryAround() {
        System.out.println("Putting laptop in backpack");
    }

    public int getBatteryLife() {
        return 8;   // hours
    }

    public void upgradeRAM(int gb) {
        System.out.println("RAM upgraded to " + gb + "GB");
    }

    public void upgradeStorage(int gb) {
        System.out.println("Storage upgraded to " + gb + "GB");
    }
}

// Desktop implements only Computer and Upgradeable (NOT Portable)
class Desktop implements Computer, Upgradeable {

    public void turnOn() {
        System.out.println("Desktop powering on...");
    }

    public void process(String task) {
        System.out.println("Processing: " + task + " (high performance)");
    }

    public void upgradeRAM(int gb) {
        System.out.println("Desktop RAM upgraded to " + gb + "GB");
    }

    public void upgradeStorage(int gb) {
        System.out.println("Desktop storage upgraded to " + gb + "GB");
    }
}

class Hello {
    public static void main(String args[]) {

        Laptop l = new Laptop();
        l.turnOn();           // Laptop booting up...
        l.carryAround();      // Putting laptop in backpack
        l.upgradeRAM(16);     // RAM upgraded to 16GB

        System.out.println("---");

        // Can use any interface as the type
        Portable p = new Laptop();    // view as Portable
        p.carryAround();              // works
        // p.turnOn();                // ERROR — Portable doesn't have turnOn()

        Computer c = new Desktop();   // view as Computer
        c.turnOn();                   // works
        c.process("Rendering");       // works
    }
}
```

### Stack & Heap — Multiple Interfaces

```
Laptop l = new Laptop();
Portable p = new Laptop();
Computer c = new Desktop();

Stack                              Heap
┌──────────────────┐              ┌──────────────────────────────────────┐
│ main()           │              │ Laptop object                         │
│                  │              │ implements: Computer, Portable,       │
│ l ───────────────┼──────┐       │             Upgradeable               │
│ (type: Laptop)   │      ├──────►│                                      │
│                  │      │       │ turnOn(), process(), carryAround(),   │
│ p ───────────────┼──────┘       │ getBatteryLife(), upgradeRAM(),       │
│ (type: Portable) │              │ upgradeStorage()                      │
│                  │              └──────────────────────────────────────┘
│                  │
│ c ───────────────┼─────────────►┌──────────────────────────────────────┐
│ (type: Computer) │              │ Desktop object                        │
└──────────────────┘              │ implements: Computer, Upgradeable     │
                                  │                                      │
                                  │ turnOn(), process(), upgradeRAM(),   │
                                  │ upgradeStorage()                      │
                                  │ (NO carryAround — not Portable)       │
                                  └──────────────────────────────────────┘

l and p point to SAME Laptop object.
l (type Laptop) can access ALL methods.
p (type Portable) can only access carryAround() and getBatteryLife().
Same object, different "lens" — depends on reference type.
```

---

## 2b. Interface Extends Interface

- A class `implements` an interface
- But an interface `extends` another interface (NOT implements)
- One interface can extend MULTIPLE interfaces

```
class    → extends  → class       (single)
class    → implements → interface (multiple)
interface → extends → interface   (multiple!)
```

### Basic Example — Building on our Computer example

```java
// Base interface
interface Machine {
    void turnOn();
    void turnOff();
}

// Interface EXTENDS another interface
interface Computer extends Machine {
    void process(String task);
    // Computer inherits turnOn() and turnOff() from Machine
    // + adds its own process()
}

// Interface extends MULTIPLE interfaces
interface SmartDevice extends Computer, Portable {
    void voiceCommand(String command);
    // SmartDevice inherits:
    //   turnOn(), turnOff()    → from Machine (through Computer)
    //   process()              → from Computer
    //   carryAround()          → from Portable
    // + adds its own voiceCommand()
}

interface Portable {
    void carryAround();
}

// Class implements the final interface — must define ALL methods in the chain
class SmartLaptop implements SmartDevice {
    public void turnOn()              { System.out.println("Smart Laptop ON"); }
    public void turnOff()             { System.out.println("Smart Laptop OFF"); }
    public void process(String task)  { System.out.println("Processing: " + task); }
    public void carryAround()         { System.out.println("Carrying smart laptop"); }
    public void voiceCommand(String cmd) { System.out.println("Voice: " + cmd); }
}

class Hello {
    public static void main(String args[]) {
        // Can use ANY interface in the chain as reference type
        Machine m = new SmartLaptop();
        m.turnOn();        // works — Machine has turnOn()
        // m.process();    // ERROR — Machine doesn't have process()

        Computer c = new SmartLaptop();
        c.turnOn();           // works — inherited from Machine
        c.process("Coding");  // works — Computer has process()
        // c.voiceCommand()   // ERROR — Computer doesn't have voiceCommand()

        SmartDevice sd = new SmartLaptop();
        sd.turnOn();                    // works
        sd.process("AI Training");      // works
        sd.carryAround();               // works
        sd.voiceCommand("Open browser"); // works — SmartDevice has everything
    }
}
```

### The Inheritance Chain

```
        Machine
        ┌──────────────┐
        │ turnOn()      │
        │ turnOff()     │
        └──────┬───────┘
               │ extends
               ▼
        Computer              Portable
        ┌──────────────┐     ┌──────────────┐
        │ process()     │     │ carryAround() │
        │ + turnOn()    │     └──────┬───────┘
        │ + turnOff()   │            │
        └──────┬───────┘            │
               │ extends            │ extends
               └──────┬─────────────┘
                      ▼
              SmartDevice
              ┌──────────────────┐
              │ voiceCommand()    │
              │ + turnOn()        │  ← from Machine
              │ + turnOff()       │  ← from Machine
              │ + process()       │  ← from Computer
              │ + carryAround()   │  ← from Portable
              └──────┬───────────┘
                     │ implements
                     ▼
              SmartLaptop
              (defines ALL methods)
```

### Stack & Heap

```
SmartDevice sd = new SmartLaptop();

Stack                              Heap
┌──────────────────┐              ┌─────────────────────────────────────┐
│ main()           │              │ SmartLaptop object                   │
│                  │              │                                     │
│ sd ──────────────┼─────────────►│ turnOn()      → "Smart Laptop ON"   │ ← Machine
│ (type:           │              │ turnOff()     → "Smart Laptop OFF"  │ ← Machine
│  SmartDevice)    │              │ process()     → "Processing: ..."   │ ← Computer
│                  │              │ carryAround() → "Carrying smart..." │ ← Portable
└──────────────────┘              │ voiceCommand()→ "Voice: ..."        │ ← SmartDevice
                                  └─────────────────────────────────────┘

One object has ALL methods from the entire interface chain.
Reference type decides which methods are VISIBLE.
```

### Two Different Interfaces with Same Method — Same Class

What if two interfaces have the SAME method name?

```java
interface Printer {
    void start();    // same name
    void print(String text);
}

interface Scanner {
    void start();    // same name!
    void scan(String doc);
}

// Class implements BOTH — but start() is defined ONCE
class AllInOne implements Printer, Scanner {
    public void start() {
        // ONE definition serves BOTH interfaces
        System.out.println("All-in-One device starting...");
    }

    public void print(String text) {
        System.out.println("Printing: " + text);
    }

    public void scan(String doc) {
        System.out.println("Scanning: " + doc);
    }
}

class Hello {
    public static void main(String args[]) {
        AllInOne device = new AllInOne();
        device.start();              // All-in-One device starting...
        device.print("Report");      // Printing: Report
        device.scan("ID Card");      // Scanning: ID Card

        // Works through both interface references
        Printer p = new AllInOne();
        p.start();    // same start() method

        Scanner s = new AllInOne();
        s.start();    // same start() method
    }
}
```

### What if same method has DIFFERENT return types?

```java
interface A {
    int getValue();     // returns int
}

interface B {
    // String getValue();   // returns String — CONFLICT!
    // class C implements A, B { }  // ❌ ERROR — can't satisfy both
}

// RULE: If two interfaces have same method name with DIFFERENT return types,
// a class CANNOT implement both — it's a compile error.
// Same name + same return type = OK (one definition serves both)
```

### Quick Rules

```
interface extends interface     → YES (even multiple)
interface implements interface  → NO (use extends)
class extends interface         → NO (use implements)
class implements interface      → YES (multiple allowed)

Same method in 2 interfaces + same return type → ONE definition works for both
Same method in 2 interfaces + different return type → ERROR, can't implement both
```

---

## 3. Interface Variables (Constants)

All variables in interface are `public static final` by default.

```java
interface Config {
    // These are automatically public static final
    int MAX_USERS = 100;
    String APP_NAME = "MyApp";
    double VERSION = 2.5;
}

class Hello {
    public static void main(String args[]) {
        System.out.println(Config.APP_NAME);    // MyApp
        System.out.println(Config.MAX_USERS);    // 100
        System.out.println(Config.VERSION);      // 2.5

        // Config.MAX_USERS = 200;   // ERROR — it's final!
    }
}
```

---

## 4. Real-World Example — Developer System

A Developer is a person who uses a Computer and writes code. Different types of developers use different tools.

```java
interface Computer {
    void turnOn();
    void turnOff();
}

interface CodeEditor {
    void openEditor();
    void writeCode(String language);
}

interface Deployable {
    void deploy(String environment);
}

class Laptop implements Computer {
    public void turnOn()  { System.out.println("Laptop ON"); }
    public void turnOff() { System.out.println("Laptop OFF"); }
}

class Desktop implements Computer {
    public void turnOn()  { System.out.println("Desktop ON"); }
    public void turnOff() { System.out.println("Desktop OFF"); }
}

// Developer uses Computer + CodeEditor + Deployable
class Developer implements CodeEditor, Deployable {
    String name;
    Computer machine;   // can be Laptop OR Desktop

    Developer(String name, Computer machine) {
        this.name = name;
        this.machine = machine;
    }

    public void openEditor() {
        System.out.println(name + " opens VS Code");
    }

    public void writeCode(String language) {
        System.out.println(name + " is writing " + language + " code");
    }

    public void deploy(String environment) {
        System.out.println(name + " deploys to " + environment);
    }

    void startWork() {
        machine.turnOn();
        openEditor();
    }

    void endWork() {
        machine.turnOff();
    }
}

class Hello {
    public static void main(String args[]) {

        Computer laptop = new Laptop();
        Computer desktop = new Desktop();

        Developer dev1 = new Developer("Amit", laptop);
        Developer dev2 = new Developer("Priya", desktop);

        // Amit works on laptop
        dev1.startWork();                // Laptop ON → opens VS Code
        dev1.writeCode("Java");          // Amit is writing Java code
        dev1.deploy("production");       // Amit deploys to production
        dev1.endWork();                  // Laptop OFF

        System.out.println("===");

        // Priya works on desktop
        dev2.startWork();                // Desktop ON → opens VS Code
        dev2.writeCode("Python");        // Priya is writing Python code
        dev2.deploy("staging");          // Priya deploys to staging
        dev2.endWork();                  // Desktop OFF
    }
}
```

### Stack & Heap — Developer System

```
Developer dev1 = new Developer("Amit", laptop);

Stack                              Heap
┌──────────────────┐              ┌─────────────────────────────────────┐
│ main()           │              │ Developer object                     │
│                  │              │ name = "Amit"                        │
│ laptop ──────────┼──────┐       │ machine ──►┌───────────────────────┐│
│ (type: Computer) │      │       │            │ Laptop object         ││
│                  │      ├──────►│            │ turnOn() → "Laptop ON"││
│ dev1 ────────────┼──────┼──┐    │            │ turnOff()→ "Laptop OFF││
│                  │      │  │    │            └───────────────────────┘│
│                  │      │  └───►│ openEditor() → "opens VS Code"      │
│                  │      │       │ writeCode() → "writing Java code"   │
│ desktop ─────────┼──┐   │       │ deploy() → "deploys to production"  │
│ (type: Computer) │  │   │       └─────────────────────────────────────┘
│                  │  │   │
│ dev2 ────────────┼──┼───┼──────►┌─────────────────────────────────────┐
│                  │  │          │ Developer object                     │
└──────────────────┘  │          │ name = "Priya"                       │
                      │          │ machine ──►┌────────────────────────┐│
                      └─────────►│            │ Desktop object         ││
                                 │            │ turnOn()→ "Desktop ON" ││
                                 │            │ turnOff()→"Desktop OFF"││
                                 │            └────────────────────────┘│
                                 └─────────────────────────────────────┘

Developer HAS-A Computer (composition via interface).
Computer can be Laptop or Desktop — dev doesn't care!
Developer IS-A CodeEditor + Deployable (implements multiple interfaces).
```

**Output:**
```
Laptop ON
Amit opens VS Code
Amit is writing Java code
Amit deploys to production
Laptop OFF
===
Desktop ON
Priya opens VS Code
Priya is writing Python code
Priya deploys to staging
Desktop OFF
```

---

## 5. Interface vs Abstract Class

| Feature                 | Interface                        | Abstract Class                |
| ----------------------- | -------------------------------- | ----------------------------- |
| Methods                 | All abstract (by default)        | Can mix abstract + regular    |
| Variables               | Only `public static final`       | Any type                      |
| Constructor             | NO                               | YES                           |
| Multiple inheritance    | YES (implements many)            | NO (extends only one)         |
| Access modifiers        | Only `public`                    | Any (public, private, etc.)   |
| When to use             | Define a CONTRACT/capability     | Share code + force a contract |
| Keyword                 | `implements`                     | `extends`                     |

### When to use which?

```
Use INTERFACE when:
  - You want to define a CAPABILITY (what a class CAN do)
  - You need MULTIPLE inheritance
  - Different unrelated classes should follow the same contract
  - Example: Laptop and Phone both implement Portable

Use ABSTRACT CLASS when:
  - You want to share CODE (common methods) + force a contract
  - Classes are RELATED (parent-child)
  - You need constructor, instance variables
  - Example: Animal → Dog, Cat (share breathe(), force sound())
```

---

## 6. Interface with Anonymous Class

Same as before — implement interface inline without a separate class.

```java
interface Printer {
    void print(String text);
}

class Hello {
    public static void main(String args[]) {

        // Anonymous implementation — no separate class needed
        Printer consolePrinter = new Printer() {
            public void print(String text) {
                System.out.println("CONSOLE: " + text);
            }
        };

        Printer filePrinter = new Printer() {
            public void print(String text) {
                System.out.println("FILE: Writing '" + text + "' to file");
            }
        };

        consolePrinter.print("Hello");   // CONSOLE: Hello
        filePrinter.print("Hello");      // FILE: Writing 'Hello' to file
    }
}
```

---

## Quick Summary

```
interface = pure contract (WHAT to do)
class implements interface = fulfills the contract (HOW to do it)

interface Computer { void turnOn(); }     ← the IDEA
class Laptop implements Computer { ... }  ← the REALITY

A class can implement MULTIPLE interfaces → solves multiple inheritance
Interface variables are always public static final (constants)
```

---

## Remember

```
extends       → class to class (single)
implements    → class to interface (multiple allowed)

Interface = CAN DO  (capability)  → Portable, Serializable, Comparable
Abstract  = IS A    (identity)    → Animal, Shape, Vehicle

"A Laptop IS-A Computer" (could be abstract or interface)
"A Laptop CAN carry around" (Portable — should be interface)
```

---

## Common Mistakes

```java
// 1. Forgetting public on implemented methods
interface Animal { void sound(); }
class Dog implements Animal {
    void sound() { }      // ERROR — must be public (interface methods are public)
    public void sound() { }  // CORRECT
}

// 2. Trying to instantiate interface
// Computer c = new Computer();   // ERROR — can't instantiate interface

// 3. Not implementing ALL methods
interface Computer { void turnOn(); void turnOff(); }
// class Laptop implements Computer {
//     public void turnOn() { }
//     // forgot turnOff() → ERROR
// }

// 4. Trying to change interface variable
interface Config { int MAX = 100; }
// Config.MAX = 200;   // ERROR — it's final!
```
