```java
class Calculator {
    public int add(int n1, int n2) {
        return n1 + n2;
    }
    public int add(int n1, int n2, int n3) {
        return n1 + n2 + n3;
    }
    public double add(double n1, int n2) {
        return n1 + n2;
    }
}

class Hello {
    public static void main(String args[]) {

        int num1 = 4;
        int num2 = 5;
        int num3 = 11;
        double double1 = 1.2;

        Calculator calc = new Calculator();
        int result_add_2 = calc.add(num1, num2);
        int result_add_3 = calc.add(num1, num2, num3);
        double result_add_double = calc.add(double1, num2);

        System.out.println("Add two value: " + result_add_2);
        System.out.println("Add three value: " + result_add_3);
        System.out.println("Add double value: " + result_add_double);

    }
}
```
- Same Method with different Parameters called Method Overloading

### Stack & Heap

When `calc.add(num1, num2)` is called, a new stack frame is pushed for that method:

```
Stack                                          Heap
┌─────────────────────────┐                   ┌──────────────────────┐
│ main() frame            │                   │  Calculator Object   │
│  num1 = 4               │                   │  (no fields)         │
│  num2 = 5               │                   │  add(int,int)        │
│  num3 = 11              │                   │  add(int,int,int)    │
│  double1 = 1.2          │                   │  add(double,int)     │
│  calc (ref)             │──────────────────►│                      │
│  result_add_2 = 9       │                   └──────────────────────┘
│  result_add_3 = 9       │
│  result_add_double = 6.2│
└─────────────────────────┘

During calc.add(num1, num2):        During calc.add(num1, num2, num3):
┌────────────────────┐              ┌────────────────────┐
│ add() frame        │              │ add() frame        │
│  n1 = 4            │              │  n1 = 4            │
│  n2 = 5            │              │  n2 = 5            │
└────────────────────┘              │  n3 = 11           │
   ↑ pushed on call                 └────────────────────┘
   ↓ popped on return                  ↑ pushed on call
                                       ↓ popped on return

- Each overloaded add() call creates its own stack frame with its parameters.
- All primitives (int, double) live entirely on the Stack.
- calc is a reference on the Stack pointing to the Calculator object on the Heap.
```