# Constructor

A constructor is a special method that runs automatically when you create an object with `new`. It has the **same name as the class** and **no return type** (not even void).

## Key Rules

- Constructor name must match the class name exactly
- No return type (not even `void`)
- Called automatically when `new` is used -- you never call it manually
- If you don't write any constructor, Java provides a **default constructor** (no parameters, empty body)
- Once you write ANY constructor, Java stops providing the default one

## Types

1. **Default Constructor** -- no parameters, sets default values
2. **Parameterized Constructor** -- takes arguments to initialize fields at creation time

> ref: `Constructor.java`

- What if we want to assign value when the object is created
- default value

### Stack & Heap

When `Human obj = new Human(25, "Ashish")` is called (parameterized constructor):

```
Step 1: Constructor is called -- new stack frame is created

Stack                                    Heap
┌──────────────────────────┐
│ Human(int age, String n) │            (object being created...)
│  ┌────────────────────┐  │            ┌──────────────────────────┐
│  │ age = 25 (param)   │  │  creates  │ Human object             │
│  │ n = "Ashish"(param)│──┼──────────►│  age  = 25               │
│  │ this ──────────────┼──┼──────────►│  name = "Ashish"         │
│  └────────────────────┘  │            └──────────────────────────┘
├──────────────────────────┤                       ▲
│ main()                   │                       │
│  ┌────────────────────┐  │                       │
│  │ obj = (pending)    │──┼───────────────────────┘
│  └────────────────────┘  │
└──────────────────────────┘

Step 2: Constructor finishes -- stack frame removed, reference returned

Stack                                    Heap
┌──────────────────────────┐            ┌──────────────────────────┐
│ main()                   │            │ Human object             │
│  ┌────────────────────┐  │            │  age  = 25               │
│  │ obj ───────────────┼──┼───────────►│  name = "Ashish"         │
│  └────────────────────┘  │            └──────────────────────────┘
└──────────────────────────┘

Note: "new" allocates memory on the Heap for the object.
      The constructor stack frame initializes the object's fields.
      Once the constructor returns, only main()'s stack frame remains,
      holding the reference (obj) to the newly created object.
```