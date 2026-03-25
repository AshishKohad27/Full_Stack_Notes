```java
class Calculator { // Class
    public int add(int n1, int n2) { // Methods
        int r = n1 + n2;
        return r;
    }
    public int sub(int n1, int n2) {
        int r = n1 - n2;
        return r;
    }
    public int mul(int n1, int n2) {
        int r = n1 * n2;
        return r;
    }
    public int quotient(int n1, int n2) {
        int r = n1 / n2;
        return r;
    }
    public int reminder(int n1, int n2) {
        int r = n1 % n2;
        return r;
    }
}

class Hello {
    public static void main(String args[]) {

        int num1 = 4;
        int num2 = 5;

        Calculator calc = new Calculator();
        int result_add = calc.add(num1, num2);
        int result_sub = calc.sub(num1, num2);
        int result_mul = calc.mul(num1, num2);
        int result_quotient = calc.quotient(num1, num2);
        int result_reminder = calc.reminder(num1, num2);

        System.out.println("ADD: " + result_add);
        System.out.println("SUB: " + result_sub);
        System.out.println("MUL: " + result_mul);
        System.out.println("QUOTIENT: " + result_quotient);
        System.out.println("REMINDER: " + result_reminder);
    }
}
```

### Stack & Heap

After `Calculator calc = new Calculator();` and the method calls:

```
Stack (main frame)                  Heap
┌─────────────────────┐            ┌──────────────────────┐
│ num1 = 4            │            │   Calculator Object   │
│ num2 = 5            │            │   (no fields)         │
│ calc (ref)          │───────────►│   add(), sub(),       │
│ result_add = 9      │            │   mul(), quotient(),  │
│ result_sub = -1     │            │   reminder()          │
│ result_mul = 20     │            └──────────────────────┘
│ result_quotient = 0 │
│ result_reminder = 4 │
└─────────────────────┘

- Primitives (int num1, num2, results) are stored directly on the Stack.
- calc holds a reference on the Stack pointing to the Calculator object on the Heap.
- When calc.add(num1, num2) is called, a new stack frame is pushed:

  Stack (add frame)
  ┌──────────────┐
  │ n1 = 4       │
  │ n2 = 5       │
  │ r  = 9       │
  └──────────────┘  ← popped after return
```

Classes have methods
1. add
2. sub
3. multi
4. div