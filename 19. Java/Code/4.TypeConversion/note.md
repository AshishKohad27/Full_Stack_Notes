```java
class Hello {
    public static void main(String args[]) {
        byte b1 = 125;
        // byte b2 = 257; // error: incompatible types: possible lossy conversion from
        // int to byte

        // Casting
        int a1 = b1; // assign byte value to int
        int a2 = 12;
        // byte b3 = a2; // error: incompatible types: possible lossy conversion from even though its in range for that we use casting method
        // int to byte
        byte b4 = (byte) a2; // cast with byte; we got 12 because it is in range

        int a3 = 257; // above byte range
        byte b5 = (byte) a3; // above byte range:- we got 1 because of modules 257%256 = 1;
        System.out.println(b5); // 1

        // For Float
        float f1 = 5.6f;
        // int v1 = f1; // error: incompatible types: possible lossy conversion from
        // float to int
        int v2 = (int) f1;// we are getting 5 (floor value)
        System.out.println(v2);

        // Type Conversion
        byte byte1 = 10;
        byte byte2 = 30;
        int result = byte1 * byte2; // type Promotion from byte to int because of multiply operation
        System.out.println(result);

    }
}
```

### Stack & Heap

All variables are primitives, so everything lives on the Stack. The diagrams below show how values change during widening, narrowing (casting), and type promotion.

**Step 1 -- Widening (byte to int):**

```
Stack                                Heap
┌──────────────────────────┐
│  main() frame            │          (nothing on heap)
│                          │
│  b1  (byte) = 125       │
│  a1  (int)  = 125       │  <-- widening: byte 125 fits in int
│  a2  (int)  = 12        │
└──────────────────────────┘
```

**Step 2 -- Narrowing / Casting (int to byte):**

```
Stack
┌──────────────────────────┐
│  b4  (byte) = 12        │  <-- (byte) a2: 12 fits in byte, no loss
│                          │
│  a3  (int)  = 257       │
│  b5  (byte) = 1         │  <-- (byte) 257: 257 % 256 = 1 (overflow)
└──────────────────────────┘
```

**Step 3 -- Float to int casting:**

```
Stack
┌──────────────────────────┐
│  f1  (float) = 5.6      │
│  v2  (int)   = 5        │  <-- (int) 5.6: decimal part truncated
└──────────────────────────┘
```

**Step 4 -- Type Promotion (byte * byte = int):**

```
Stack
┌──────────────────────────┐
│  byte1  (byte) = 10     │
│  byte2  (byte) = 30     │
│  result (int)  = 300    │  <-- byte * byte is promoted to int
└──────────────────────────┘
```

> **Key takeaway:** Widening (small to big) happens automatically. Narrowing (big to small) requires explicit casting and may lose data. Arithmetic between small types (`byte`, `short`) is automatically promoted to `int`.