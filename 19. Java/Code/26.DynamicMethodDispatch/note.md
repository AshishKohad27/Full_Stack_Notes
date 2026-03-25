Dynamic Method Dispatch

- It is the **mechanism** behind runtime polymorphism
- It's HOW Java decides which overridden method to call at runtime
- When you call a method using a **parent reference**, Java checks the **actual object** at runtime and dispatches (sends) the call to that object's method

---

## How it works step by step

```java
Shape s;              // just a reference, no object yet

s = new Circle();     // s now points to a Circle object
s.draw();             // Java sees Circle object → calls Circle's draw()

s = new Square();     // s now points to a Square object
s.draw();             // Java sees Square object → calls Square's draw()
```

SAME variable `s`, but the method call changes based on the object it points to.
Java "dispatches" the call to the correct class at RUNTIME.

---

## What happens internally?

```
Step 1:  Shape s = new Circle();
         - "s" is of type Shape (reference type)
         - actual object in memory is Circle

Step 2:  s.draw();
         - Java sees: "s is pointing to a Circle object"
         - Java dispatches the call to Circle's draw(), NOT Shape's draw()

Step 3:  s = new Square();
         - now "s" points to a Square object

Step 4:  s.draw();
         - Java dispatches to Square's draw()
```

---

## Why is it called "Dynamic"?

- **Static** = decided at compile time (like overloading)
- **Dynamic** = decided at run time (like overriding)
- The method to call is resolved **dynamically** (at runtime) based on the actual object

---

## Example - Shape Drawing

> ref: `DynamicDispatch.java`

```java
class Shape {
    void draw() {
        System.out.println("Drawing a Shape");
    }
}

class Circle extends Shape {
    void draw() {
        System.out.println("Drawing a Circle");
    }
}

class Square extends Shape {
    void draw() {
        System.out.println("Drawing a Square");
    }
}

class Triangle extends Shape {
    void draw() {
        System.out.println("Drawing a Triangle");
    }
}

class DynamicDispatch {
    public static void main(String args[]) {

        Shape s;

        s = new Circle();
        s.draw();   // Drawing a Circle

        s = new Square();
        s.draw();   // Drawing a Square

        s = new Triangle();
        s.draw();   // Drawing a Triangle
    }
}
```

### Stack & Heap - How the reference changes

```
STEP 1: s = new Circle();

Stack                              Heap
┌──────────────┐                  ┌──────────────────────────────┐
│ main()       │                  │ Circle object                │
│              │                  │ ┌──────────────────────────┐ │
│ s ───────────┼─────────────────►│ │ draw() → "Drawing a      │ │
│ (type: Shape)│                  │ │           Circle"         │ │
└──────────────┘                  │ └──────────────────────────┘ │
                                  └──────────────────────────────┘
s.draw() → Java sees Circle on Heap → calls Circle's draw()


STEP 2: s = new Square();       (s is reassigned, now points to Square)

Stack                              Heap
┌──────────────┐                  ┌──────────────────────────────┐
│ main()       │                  │ Square object                │
│              │                  │ ┌──────────────────────────┐ │
│ s ───────────┼─────────────────►│ │ draw() → "Drawing a      │ │
│ (type: Shape)│                  │ │           Square"         │ │
└──────────────┘                  │ └──────────────────────────┘ │
                                  └──────────────────────────────┘
s.draw() → Java sees Square on Heap → calls Square's draw()


STEP 3: s = new Triangle();     (s is reassigned again)

Stack                              Heap
┌──────────────┐                  ┌──────────────────────────────┐
│ main()       │                  │ Triangle object              │
│              │                  │ ┌──────────────────────────┐ │
│ s ───────────┼─────────────────►│ │ draw() → "Drawing a      │ │
│ (type: Shape)│                  │ │           Triangle"       │ │
└──────────────┘                  │ └──────────────────────────┘ │
                                  └──────────────────────────────┘
s.draw() → Java sees Triangle on Heap → calls Triangle's draw()

SAME reference "s" (type Shape) on the Stack.
THREE different objects on the Heap at different times.
The method that runs depends on the ACTUAL object, not the reference type.
```

---

## Practical Use - ONE method that works for ALL types

> ref: `RenderExample.java`

```java
class Hello {
    static void render(Shape s) {
        s.draw();   // Dynamic dispatch decides which draw() to call
    }

    public static void main(String args[]) {
        render(new Circle());     // Drawing a Circle
        render(new Square());     // Drawing a Square
        render(new Triangle());   // Drawing a Triangle

        // Tomorrow if someone adds "class Hexagon extends Shape"
        // this render() method works WITHOUT any changes!
    }
}
```

This is the real power - write code ONCE, it works for ALL current and future child classes.

---

## Key Points

- Dynamic Method Dispatch = runtime polymorphism's internal mechanism
- Reference type (left side) determines **what methods you CAN call**
- Object type (right side) determines **which version RUNS**
- Only works with **overridden methods** (not overloaded)
- Makes code **extensible** - add new child classes without touching existing code

---

## Remember

```
Parent ref = new Child();
ref.method();   // DISPATCHED to Child's method at runtime
```

| Left Side (Reference) | Right Side (Object) | Which method runs? |
| ---------------------- | ------------------- | ------------------ |
| Shape s                | new Circle()        | Circle's draw()    |
| Shape s                | new Square()        | Square's draw()    |
| Shape s                | new Triangle()      | Triangle's draw()  |
