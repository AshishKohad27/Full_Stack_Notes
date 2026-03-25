```java
class Computer {
public void playMusic() {
System.out.println("Music Playing....");
}

    public String getMePen(int cost) {
        if (cost >= 10) {
            return "Pen";
        } else {
            return "Nothing";
        }
    }

}

class Hello {
public static void main(String args[]) {
// 1.Method
Computer comp = new Computer();
comp.playMusic();

        // 2.Method
        String str = comp.getMePen(1);
        System.out.println(str);
    }

}
```

### Stack & Heap

After `Computer comp = new Computer();` and calling methods:

```
Stack (main frame)                  Heap
┌──────────────────┐              ┌─────────────────────────┐
│ comp (ref)       │─────────────►│   Computer Object       │
│ str = "Nothing"  │──┐           │   playMusic()           │
└──────────────────┘  │           │   getMePen()            │
                      │           └─────────────────────────┘
                      │
                      │           ┌─────────────────────────┐
                      │           │   String Pool (in Heap)  │
                      └──────────►│   "Nothing"              │
                                  │   "Pen"                  │
                                  └─────────────────────────┘

- comp is a reference on the Stack pointing to a Computer object on the Heap.
- str holds a reference to the String "Nothing" in the String Pool.
- Primitive parameter cost = 1 lives only in the getMePen stack frame (popped after return).
```