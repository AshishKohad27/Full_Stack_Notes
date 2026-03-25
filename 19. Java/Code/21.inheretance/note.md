# Inheritance

Inheritance allows a child class (subClass) to inherit properties and methods from a parent class (superClass) using the `extends` keyword.

## Class Hierarchy

```
Calc (superClass)
  └── AdvCalc (subClass)
        └── ScientificCal (subClass)
```

## Files

- **Calc.java** - Base class with `add()` and `sub()` methods
- **AdvCalc.java** - Extends Calc, adds `mul()` and `div()` methods
- **ScientificCal.java** - Extends AdvCalc, adds `power()` method
- **Hello.java** - Main class demonstrating multilevel inheritance

## Key Concepts

- `extends` keyword connects a subClass to a superClass
- A subClass inherits all public methods from its superClass
- Multilevel inheritance: ScientificCal -> AdvCalc -> Calc
- ScientificCal object can access `add()`, `sub()`, `mul()`, `div()`, and `power()`
- **Java does NOT support multiple inheritance** -- a class can only `extends` ONE class (not two or more)
- Every class in Java implicitly extends `Object` if no parent is specified

### Stack & Heap

After `ScientificCal obj = new ScientificCal();` executes:

```
Stack                              Heap
┌──────────────┐                  ┌─────────────────────────────────┐
│ main()       │                  │ ScientificCal object            │
│              │                  │ ┌─────────────────────────────┐ │
│ obj ─────────┼─────────────────►│ │ from Calc (grandparent):    │ │
│ r1 = 12      │                  │ │   add(), sub()              │ │
│ r2 = -2      │                  │ ├─────────────────────────────┤ │
│ r3 = 35      │                  │ │ from AdvCalc (parent):      │ │
│ r4 = 0       │                  │ │   mul(), div()              │ │
│ r5 = 16      │                  │ ├─────────────────────────────┤ │
└──────────────┘                  │ │ from ScientificCal (self):  │ │
                                  │ │   power()                   │ │
                                  │ └─────────────────────────────┘ │
                                  └─────────────────────────────────┘

One object on the Heap contains ALL inherited methods.
ScientificCal "is-a" AdvCalc, which "is-a" Calc.
```
