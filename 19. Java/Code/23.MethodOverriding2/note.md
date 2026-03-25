```java
class Calc {
    public int add(int n1, int n2) {
        return n1 + n2;
    }
}

class AdvCalc extends Calc {
    public int add(int n1, int n2) {
        return n1 + n2 + 10;
    }
}

class Hello {
    public static void main(String args[]) {

        AdvCalc obj = new AdvCalc();
        int r1 = obj.add(5, 10); // if we have same method child method get override parent method

        System.out.println(r1); // r1 = 25

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

Even though Calc has add(), the AdvCalc object's add() takes priority.
The reference type is AdvCalc, the object type is AdvCalc — child's method wins.
```
