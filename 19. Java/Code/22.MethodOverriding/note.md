# Method Overriding

When a child class has a method with the **same name, same parameters, and same return type** as the parent class, the child's method **overrides** the parent's method.

## Rules

- Method name, parameters, and return type must be **exactly the same** as the parent
- The child method's access modifier cannot be **more restrictive** than the parent (e.g., if parent is `public`, child cannot be `private`)
- `static`, `final`, and `private` methods **cannot** be overridden
- Use `@Override` annotation (optional but recommended) -- Java will give a compile error if the method doesn't actually override anything

> ref: `MethodOverriding.java`

```java

class Calc
{
    public int add(int n1, int n2)
    {
        return n1 + n2;
    }
}

class AdvCalc extends Calc
{
    public int add(int n1, int n2)
    {
        return n1 + n2 + 10;
    }
}

class Hello {
    public static void main(String args[]) {
      // when we have same method in both classes (i.e. in parent and child)
      // then child method will override that method which is present in parent class
      // now we are calling add method

      AdvCalc obj = new AdvCalc();
      int r1 = obj.add(5,10);
      // parent result: 15
      // child result: 25 // override value
      System.out.println(r1);

    }
}
```

### Stack & Heap

After `AdvCalc obj = new AdvCalc();` executes:

```
Stack                              Heap
┌──────────────┐                  ┌──────────────────────────────┐
│ main()       │                  │ AdvCalc object               │
│              │                  │ ┌──────────────────────────┐ │
│ obj ─────────┼─────────────────►│ │ from Calc (parent):      │ │
│ r1 = 25      │                  │ │   add() ← OVERRIDDEN     │ │
│              │                  │ ├──────────────────────────┤ │
└──────────────┘                  │ │ from AdvCalc (self):     │ │
                                  │ │   add(n1,n2)             │ │
                                  │ │   → returns n1 + n2 + 10 │ │
                                  │ └──────────────────────────┘ │
                                  └──────────────────────────────┘

obj.add(5,10) calls AdvCalc's add() (returns 25), NOT Calc's add() (would return 15).
The child's method overrides the parent's method in the same object.
```