# Type Casting (Upcasting & Downcasting)

Type Casting with objects = converting one class type to another (only works with parent-child relationship)

- **Upcasting** = Child → Parent (automatic, safe)
- **Downcasting** = Parent → Child (manual, risky)

---

## 1. Upcasting (Child → Parent)

- Assigning a child object to a parent reference
- Happens **automatically** (implicit)
- Always **safe** — every Dog IS-A Animal

```java
class Animal {
    void eat() {
        System.out.println("Animal is eating");
    }
}

class Dog extends Animal {
    void bark() {
        System.out.println("Dog is barking");
    }
}

class Hello {
    public static void main(String args[]) {

        // Upcasting — Dog object stored in Animal reference
        Animal a = new Dog();   // automatic, no cast needed

        a.eat();     // WORKS — eat() is in Animal
        // a.bark(); // ERROR — Animal reference can't see Dog's methods

        // The object is still a Dog on the Heap
        // But the reference type (Animal) limits what you can ACCESS
    }
}
```

### Stack & Heap

```
Stack                              Heap
┌──────────────────┐              ┌───────────────────────────────┐
│ main()           │              │ Dog object                     │
│                  │              │                               │
│ a ───────────────┼─────────────►│ eat()  → "Animal is eating"   │ ✅ accessible
│ (type: Animal)   │              │ bark() → "Dog is barking"     │ ❌ hidden
└──────────────────┘              └───────────────────────────────┘

The object IS a Dog (has both eat + bark)
But reference type is Animal → can only see Animal's methods
bark() is there in memory, just not accessible through Animal reference
```

### Why use Upcasting?

```java
// ONE method that works for ALL animals
static void feed(Animal a) {
    a.eat();   // works for Dog, Cat, or any future Animal
}

feed(new Dog());   // upcasting happens automatically
feed(new Cat());   // upcasting happens automatically
```

---

## 2. Downcasting (Parent → Child)

- Converting parent reference BACK to child type
- Must be done **manually** (explicit cast)
- Can cause **ClassCastException** if the actual object is NOT that child type

```java
class Animal {
    void eat() {
        System.out.println("Animal is eating");
    }
}

class Dog extends Animal {
    void bark() {
        System.out.println("Dog is barking");
    }
}

class Hello {
    public static void main(String args[]) {

        Animal a = new Dog();   // upcasting first
        a.eat();                // works

        // a.bark();            // ERROR — Animal reference can't see bark()

        // Downcasting — to access Dog-specific methods
        Dog d = (Dog) a;        // manual cast required
        d.bark();               // NOW works — Dog reference can see bark()
        d.eat();                // also works — inherited from Animal
    }
}
```

### Stack & Heap

```
BEFORE downcasting:

Stack                              Heap
┌──────────────────┐              ┌───────────────────────────────┐
│ main()           │              │ Dog object                     │
│                  │              │                               │
│ a ───────────────┼─────────────►│ eat()  → accessible            │
│ (type: Animal)   │              │ bark() → HIDDEN                │
└──────────────────┘              └───────────────────────────────┘


AFTER downcasting: Dog d = (Dog) a;

Stack                              Heap
┌──────────────────┐              ┌───────────────────────────────┐
│ main()           │              │ Dog object (SAME object)       │
│                  │              │                               │
│ a ───────────────┼──────────┬──►│ eat()  → accessible by both    │
│ (type: Animal)   │          │   │ bark() → accessible by d only  │
│                  │          │   └───────────────────────────────┘
│ d ───────────────┼──────────┘
│ (type: Dog)      │
└──────────────────┘

Both a and d point to the SAME Dog object on the Heap.
But d (Dog type) can see bark(), while a (Animal type) cannot.
No new object is created — it's just a different "lens" to view the same object.
```

---

## 3. Dangerous Downcasting — ClassCastException

```java
class Animal {
    void eat() {
        System.out.println("Eating");
    }
}

class Dog extends Animal {
    void bark() {
        System.out.println("Barking");
    }
}

class Cat extends Animal {
    void meow() {
        System.out.println("Meowing");
    }
}

class Hello {
    public static void main(String args[]) {

        Animal a = new Cat();      // actual object is Cat

        // Dog d = (Dog) a;        // RUNTIME ERROR: ClassCastException!
        // Cat is NOT a Dog — you can't cast Cat to Dog

        // Safe way — use instanceof before downcasting
        if (a instanceof Dog) {
            Dog d = (Dog) a;
            d.bark();
        } else {
            System.out.println("a is NOT a Dog");   // this runs
        }

        if (a instanceof Cat) {
            Cat c = (Cat) a;
            c.meow();              // Meowing — safe!
        }
    }
}
```

### Stack & Heap — ClassCastException

```
Animal a = new Cat();

Stack                              Heap
┌──────────────────┐              ┌──────────────────┐
│ a ───────────────┼─────────────►│ Cat object       │
│ (type: Animal)   │              │ meow() ✅        │
└──────────────────┘              └──────────────────┘

Dog d = (Dog) a;   →  CRASH! Cat is NOT a Dog
                       Java checks: "Is the Heap object a Dog?" → NO → Exception

Always use instanceof before downcasting to avoid this crash.
```

---

## 4. instanceof Keyword

- Checks if an object IS-A specific type
- Returns `true` or `false`
- Always use before downcasting

```java
class Hello {
    public static void main(String args[]) {

        Animal a1 = new Dog();
        Animal a2 = new Cat();

        System.out.println(a1 instanceof Dog);     // true
        System.out.println(a1 instanceof Cat);     // false
        System.out.println(a1 instanceof Animal);  // true (Dog IS-A Animal)

        System.out.println(a2 instanceof Cat);     // true
        System.out.println(a2 instanceof Dog);     // false
    }
}
```

---

## 5. Real-World Example — Employee System

```java
class Employee {
    String name;
    int salary;

    Employee(String name, int salary) {
        this.name = name;
        this.salary = salary;
    }

    void work() {
        System.out.println(name + " is working");
    }
}

class Developer extends Employee {
    String language;

    Developer(String name, int salary, String language) {
        super(name, salary);
        this.language = language;
    }

    void code() {
        System.out.println(name + " is coding in " + language);
    }
}

class Manager extends Employee {
    int teamSize;

    Manager(String name, int salary, int teamSize) {
        super(name, salary);
        this.teamSize = teamSize;
    }

    void manage() {
        System.out.println(name + " is managing " + teamSize + " people");
    }
}

class Hello {
    public static void main(String args[]) {

        // Upcasting — store all employees in one array
        Employee team[] = new Employee[3];
        team[0] = new Developer("Amit", 80000, "Java");    // upcasting
        team[1] = new Manager("Priya", 100000, 10);        // upcasting
        team[2] = new Developer("Rahul", 75000, "Python");  // upcasting

        // Process all employees
        for (Employee e : team) {
            e.work();   // works for everyone (upcasting)

            // Downcasting — to access specific methods
            if (e instanceof Developer) {
                Developer d = (Developer) e;
                d.code();
            } else if (e instanceof Manager) {
                Manager m = (Manager) e;
                m.manage();
            }
        }
    }
}
```

### Stack & Heap — Employee Array

```
Stack                              Heap
┌──────────────────┐              ┌──────────────────────────────────┐
│ main()           │              │ Employee[] array                  │
│                  │              │ ┌────┬────┬────┐                 │
│ team ────────────┼─────────────►│ │ [0]│ [1]│ [2]│                 │
│                  │              │ └─┬──┴─┬──┴─┬──┘                 │
└──────────────────┘              │   │    │    │                     │
                                  │   ▼    │    ▼                     │
                                  │ Developer  │  Developer           │
                                  │ name="Amit"│  name="Rahul"       │
                                  │ salary=80k │  salary=75k         │
                                  │ lang="Java"│  lang="Python"      │
                                  │        │                         │
                                  │        ▼                         │
                                  │   Manager                        │
                                  │   name="Priya"                   │
                                  │   salary=100k                    │
                                  │   teamSize=10                    │
                                  └──────────────────────────────────┘

All stored as Employee (upcasting) — but actual objects are Developer/Manager.
Use instanceof + downcast to access specific methods like code() or manage().
```

**Output:**
```
Amit is working
Amit is coding in Java
Priya is working
Priya is managing 10 people
Rahul is working
Rahul is coding in Python
```

---

## Quick Summary

| Concept      | Direction       | Syntax               | Safe?                    |
| ------------ | --------------- | -------------------- | ------------------------ |
| Upcasting    | Child → Parent  | `Animal a = new Dog()` | Always safe (automatic) |
| Downcasting  | Parent → Child  | `Dog d = (Dog) a`    | Risky (use instanceof)  |
| instanceof   | Check type      | `a instanceof Dog`   | Always safe             |

---

## Remember

```
Upcasting   = automatic, safe, loses access to child methods
Downcasting = manual, risky, gains access to child methods
instanceof  = safety check before downcasting

Animal a = new Dog();      // upcasting (auto)
Dog d = (Dog) a;           // downcasting (manual)
a instanceof Dog → true    // safety check
```

## Common Mistakes

```java
// 1. Downcasting without instanceof
Animal a = new Cat();
Dog d = (Dog) a;           // CRASH! ClassCastException

// 2. Thinking upcast creates a new object
Animal a = new Dog();      // NO new object — same Dog, just viewed as Animal

// 3. Thinking downcast creates a new object
Dog d = (Dog) a;           // NO new object — same Dog, now viewed as Dog again
```
