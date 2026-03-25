```java
class Hello {
    public static void main(String args[]) {
        String name = new String("Navin");

        System.out.println("Hello " + name);
        System.out.println("Char at Index of 0: "+name.charAt(0));
        System.out.println("Concat: "+ name.concat(" Reddy"));
    }
}
```

### Stack & Heap - String

After `String name = new String("Navin");`:

```
Stack (main frame)              Heap
┌──────────────────┐           ┌──────────────────────────────┐
│ name (ref)       │──────────►│ String Object                │
└──────────────────┘           │ value = "Navin"              │
                               └──────────┬───────────────────┘
                                          │
                               ┌──────────▼───────────────────┐
                               │   String Pool (inside Heap)   │
                               │   "Navin"                     │
                               │   " Reddy"                    │
                               │   "Navin Reddy" (from concat) │
                               └──────────────────────────────┘

- name is a reference on the Stack pointing to a String object on the Heap.
- new String("Navin") creates an object on the Heap AND an entry in the String Pool.
- concat() returns a NEW String object; the original "Navin" is unchanged (Strings are immutable).
- charAt(0) returns a primitive char 'N' on the Stack.

Note: String literal (e.g., String s = "Navin") goes directly to the String Pool.
      new String("Navin") creates a separate object on the Heap + pool entry.
```

2. String Buffer
```java
    class Hello {
        public static void main(String args[]) {
            StringBuffer sb = new StringBuffer("Navin");

            sb.append(" Reddy");
            System.out.println("Append: " + sb);

            sb.insert(6,"Java ");
            System.out.println("Insert: " + sb);
        }
    }
```

### == vs .equals() (Common Mistake)
```java
String s1 = "Navin";
String s2 = "Navin";
String s3 = new String("Navin");

System.out.println(s1 == s2);      // true  (same String Pool reference)
System.out.println(s1 == s3);      // false (different objects in memory)
System.out.println(s1.equals(s3)); // true  (same content)
```
- `==` compares **references** (are they the same object in memory?)
- `.equals()` compares **content** (do they have the same characters?)
- Always use `.equals()` to compare String values.

### StringBuffer vs StringBuilder
- **StringBuffer** is thread-safe (synchronized) but slower.
- **StringBuilder** is NOT thread-safe but faster.
- Both are mutable (unlike String). Use StringBuilder in single-threaded code.

3. String Builder