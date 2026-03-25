```java
class Hello {
    public static void main(String a[]) {
        int num = 10_00_00_000;
        int numBinary = 0b0001;
        int numHex = 0x0010;
        double intInFloat = 50;
        double epsilon = 12e10; // epsilon value or 10 rest to something
        // boolean b = 1; // it will give an error
        char ch = 'a';
        ch++;
    }
}
```

### Stack & Heap

All variables here are primitives, so everything lives on the Stack. The different literal formats (binary `0b`, hex `0x`, scientific `12e10`) are just ways to write numbers -- they all become plain values in memory.

```
Stack                                Heap
┌──────────────────────────┐
│  main() frame            │          (nothing on heap)
│                          │
│  num       (int)    = 100000000  │
│  numBinary (int)    = 1          │
│  numHex    (int)    = 16         │
│  intInFloat(double) = 50.0       │
│  epsilon   (double) = 1.2E11     │
│  ch        (char)   = 'a'        │
│                          │
│  After ch++:             │
│  ch        (char)   = 'b'        │
└──────────────────────────┘
```

> **Key takeaway:** No matter what literal format you use (decimal, binary `0b`, hex `0x`, scientific notation `12e10`), the value is stored as a primitive directly on the Stack.