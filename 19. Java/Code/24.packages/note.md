# Packages

Packages are used to organize Java classes into namespaces using the `package` keyword. Classes from other packages are accessed using `import`.

## Structure

```
24.packages/
├── Hello.java          (main class, imports from tools package)
└── tools/
    ├── Calc.java       (base class with add method)
    └── AdvCalc.java    (extends Calc, overrides add method)
```

## Key Concepts

- `package tools;` declares a class belongs to the `tools` package
- `import tools.Calc;` and `import tools.AdvCalc;` import classes from the package
- `import tools.*;` imports ALL classes from the tools package (wildcard import)
- Classes in a package can extend other classes within the same package

## How to Compile & Run

Packages require specific compile/run steps (this trips up most beginners):

```bash
# From inside 24.packages/ folder:
javac tools/Calc.java tools/AdvCalc.java    # compile package classes first
javac Hello.java                              # then compile main class
java Hello                                    # run (from same folder)
```

If you get `package tools does not exist` error, make sure you are running `javac` from the folder that CONTAINS the `tools/` directory, not from inside it.

### Stack & Heap

After `AdvCalc obj = new AdvCalc();` in Hello.java executes:

```
Stack                              Heap
┌──────────────┐                  ┌──────────────────────────────────┐
│ main()       │                  │ AdvCalc object                   │
│              │                  │ (from tools package)             │
│ obj ─────────┼─────────────────►│ ┌──────────────────────────────┐ │
│ r1 = 25      │                  │ │ from tools.Calc (parent):    │ │
│              │                  │ │   add() ← OVERRIDDEN         │ │
└──────────────┘                  │ ├──────────────────────────────┤ │
                                  │ │ from tools.AdvCalc (self):   │ │
                                  │ │   add(n1,n2)                 │ │
                                  │ │   → returns n1 + n2 + 10     │ │
                                  │ └──────────────────────────────┘ │
                                  └──────────────────────────────────┘

Hello.java is in the default package (no package declaration).
Calc and AdvCalc live in the "tools" package.
import statements let Hello.java use classes from the tools package.
The object on the Heap is the same regardless of which package it came from.
```
