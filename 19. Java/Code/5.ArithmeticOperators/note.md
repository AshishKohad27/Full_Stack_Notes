```java
class Hello {
    public static void main(String args[]) {
        int num = 7;
        int num1 = 10;
        int num2 = 20;

        // Addition
        int addition = num1 + num2;
        System.out.println(addition); // 30;

        // Subtraction
        int substration = num1 - num2;
        System.out.println(substration); // -10;

        // Division
        int Division = num2 / num1;
        System.out.println(Division); // Quotient = 2;

        // Multiplication
        int Multiplication = num1 * num2;
        System.out.println(Multiplication); // 200;

        // Modulus
        int Modulus = num1 % num2;
        System.out.println(Modulus); // Reminder=10;

        // Short Way
        int Increment = 1;
        Increment = Increment + 1;
        Increment += 1;
        Increment++;

        // Pre Increment
        int PreIncrement = ++num; // increment and then fetch

        // Post Increment
        int PostIncrement = num++; // fetch and then increment
    }
}
```

### Stack & Heap

All variables are primitives (`int`), so everything is stored on the Stack.

**After arithmetic operations:**

```
Stack                                Heap
┌──────────────────────────────┐
│  main() frame                │      (nothing on heap)
│                              │
│  num           (int) = 7     │
│  num1          (int) = 10    │
│  num2          (int) = 20    │
│                              │
│  addition      (int) = 30   │  10 + 20
│  substration   (int) = -10  │  10 - 20
│  Division      (int) = 2    │  20 / 10
│  Multiplication(int) = 200  │  10 * 20
│  Modulus       (int) = 10   │  10 % 20
└──────────────────────────────┘
```

**Increment operations (step by step):**

```
Stack
┌──────────────────────────────┐
│  Increment     (int) = 1    │  initial
│  Increment     (int) = 2    │  after Increment = Increment + 1
│  Increment     (int) = 3    │  after Increment += 1
│  Increment     (int) = 4    │  after Increment++
└──────────────────────────────┘
```

**Pre vs Post Increment:**

```
Stack
┌──────────────────────────────┐
│  num           (int) = 7    │  (original value)
│                              │
│  PreIncrement  (int) = 8    │  ++num: num becomes 8 first,
│  num           (int) = 8    │         then assigned to PreIncrement
│                              │
│  PostIncrement (int) = 8    │  num++: current num (8) assigned first,
│  num           (int) = 9    │         then num becomes 9
└──────────────────────────────┘
```

> **Key takeaway:** All `int` primitives live on the Stack. Pre-increment (`++num`) changes the value before use; post-increment (`num++`) uses the value first, then changes it.

### Integer Division
When dividing two `int` values, Java **truncates the decimal part** (no rounding):
```java
int result = 7 / 2;   // result is 3, NOT 3.5
```
To get a decimal result, at least one operand must be `float` or `double`:
```java
double result = 7.0 / 2;  // result is 3.5
```