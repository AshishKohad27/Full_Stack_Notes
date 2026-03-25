# Java Polymorphism & Method Access (With Example)

## 📌 Code Example

```java
class A {
    public void show() {
        System.out.println("in A Show");
    }

    public void show1() {
        System.out.println("in A Show-1");
    }
}

class B extends A {
    public void show() {
        System.out.println("in B Show");
    }

    public void show2() {
        System.out.println("in B Show-2");
    }
}

class Hello {
    public static void main(String args[]) {

        A obj = new A();
        obj = new B();
        obj.show2(); // ❌ ERROR
    }
}
```
