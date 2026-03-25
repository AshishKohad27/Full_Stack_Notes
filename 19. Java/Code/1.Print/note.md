```java
class Print
{
    public static void main(String a[])
    {
        System.out.println("Hello World !");
    }
}
```

### Stack & Heap

When `main` is called, a stack frame is created. The `String[] a` reference lives on the stack, pointing to the args array on the heap. The string literal `"Hello World !"` is stored in the String Pool (part of Heap).

```
Stack                                Heap
┌─────────────────────┐             ┌─────────────────────┐
│  main() frame       │             │  String Pool         │
│                     │             │ ┌─────────────────┐  │
│  a (String[]) ──────│─────────────│>│ args array []   │  │
│                     │             │ └─────────────────┘  │
│                     │             │                      │
│  "Hello World !" ───│─────────────│>│ "Hello World !"  │ │
│  (passed to         │             │  (String object)     │
│   println)          │             │                      │
└─────────────────────┘             └──────────────────────┘
```

> **Note:** Primitives are stored directly on the Stack. Objects and arrays live on the Heap, with references (pointers) on the Stack.

### `print` vs `println`
- `System.out.print("Hello")` -- prints without a newline (next output continues on the same line)
- `System.out.println("Hello")` -- prints with a newline at the end

// javac <file name> --> complie
// eg. javac print.java
// java <class file name> --> run
// eg. java Print