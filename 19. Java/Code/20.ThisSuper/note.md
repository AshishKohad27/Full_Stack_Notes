# Super() :- called the constructor of super class

- By defualt every method as super in it

```java
class A extends Object // every class in java extends in Object even though we don't mension it -> Object -> is class in java erevy class in java extend in object class
// class A // same every class in java extends in Object even though we don't mension it
{
    public A()
    {
        super(); // by default even though we don't write // this super called constructor of Object
        System.out.println("in A");
    }
    public A(int n)
    {
        super(); // by default even though we don't write
        System.out.println("in A int: ");
    }
}

class B extends A
{
    public B()
    {
        super(); // by default even though we don't write
        System.out.println("in B");
    }

    public B(int n)
    {
        super(); // by default even though we don't write
        System.out.println("in B int: ");
    }
}

class C extends A
{
    public C()
    {
        super(); // by default even though we don't write
        System.out.println("in C");
    }

    public C(int n)
    {
        super(n); // we have int in super so now int A() method called
        System.out.println("in C int: ");
    }
}

class D extends A
{
    public D()
    {
        super(5); // adding int so now int A() method called
        System.out.println("in D");
    }

    public D(int n)
    {
        super(n); // we have int in super so now int A() method called
        System.out.println("in D int: ");
    }
}

class Hello {
    public static void main(String args[]) {
       B obj_B1 = new B();
       System.out.println(" ");

       B obj_B = new B(7);
       System.out.println(" ");

       C obj_C = new C(7);
       System.out.println(" ");

       D obj_D = new D();

       // Step 1: goes to B class B(7) method and when we have int in it its goes to that int B() method
       // Step 2: super(); --> called the constructor of super class in our case it is A class
       // step 3: then super class constructor defaults method run A()
       // step 4: first print "in A"
       // step 5: then print "in B int"

       // if we pass n in super in C() method then int A() method will called
    }
}
```

### Stack & Heap

When `B obj_B = new B(7)` is called -- constructor chaining with super():

```
Step 1: new B(7) called --> B(int n) has super() --> calls A() --> A() has super() --> calls Object()

Stack (grows downward)                   Heap
┌──────────────────────────┐
│ Object()                 │  ◄── called first (top of chain)
│  super of everything     │
├──────────────────────────┤
│ A()                      │  ◄── super() from B() lands here
│  prints "in A"           │
├──────────────────────────┤            ┌──────────────────────┐
│ B(int n)                 │            │ B object (is-a A)    │
│  ┌────────────────────┐  │  creates  │ ┌──────────────────┐ │
│  │ n = 7              │──┼──────────►│ │ (A part)         │ │
│  │ super() called     │  │            │ │  (fields of A)   │ │
│  └────────────────────┘  │            │ ├──────────────────┤ │
│  prints "in B int:"      │            │ │ (B part)         │ │
├──────────────────────────┤            │ │  (fields of B)   │ │
│ main()                   │            │ └──────────────────┘ │
│  ┌────────────────────┐  │            └──────────────────────┘
│  │ obj_B ─────────────┼──┼───────────────────────▲
│  └────────────────────┘  │
└──────────────────────────┘

Execution order: Object() --> A() prints "in A" --> B(7) prints "in B int:"
```

When `C obj_C = new C(7)` is called -- super(n) calls A(int n):

```
Stack                                    Heap
┌──────────────────────────┐
│ A(int n)                 │  ◄── super(n) from C(7) calls A(int)
│  prints "in A int:"      │
├──────────────────────────┤            ┌──────────────────────┐
│ C(int n)                 │            │ C object (is-a A)    │
│  ┌────────────────────┐  │  creates  │ ┌──────────────────┐ │
│  │ n = 7              │──┼──────────►│ │ (A part)         │ │
│  │ super(n) called    │  │            │ ├──────────────────┤ │
│  └────────────────────┘  │            │ │ (C part)         │ │
│  prints "in C int:"      │            │ └──────────────────┘ │
├──────────────────────────┤            └──────────────────────┘
│ main()                   │                       ▲
│  ┌────────────────────┐  │                       │
│  │ obj_C ─────────────┼──┼───────────────────────┘
│  └────────────────────┘  │
└──────────────────────────┘

Note: super(n) picks the MATCHING constructor in the parent class.
      super()  --> A()      (default constructor)
      super(n) --> A(int n) (parameterized constructor)
```

When `D obj_D = new D()` is called -- D() has super(5):

```
Stack                                    Heap
┌──────────────────────────┐
│ A(int n)                 │  ◄── super(5) from D() calls A(int)
│  prints "in A int:"      │
├──────────────────────────┤            ┌──────────────────────┐
│ D()                      │            │ D object (is-a A)    │
│  ┌────────────────────┐  │  creates  │ ┌──────────────────┐ │
│  │ super(5) called    │──┼──────────►│ │ (A part)         │ │
│  └────────────────────┘  │            │ ├──────────────────┤ │
│  prints "in D"           │            │ │ (D part)         │ │
├──────────────────────────┤            │ └──────────────────┘ │
│ main()                   │            └──────────────────────┘
│  ┌────────────────────┐  │                       ▲
│  │ obj_D ─────────────┼──┼───────────────────────┘
│  └────────────────────┘  │
└──────────────────────────┘

Output: "in A int:" then "in D"
```

# this()

```java
class A extends Object // every class in java extends in Object even though we don't mension it
// class A // same every class in java extends in Object even though we don't mension it
{
    public A()
    {
        super(); // by default even though we don't write // this super called constructor of Object
        System.out.println("in A");
    }
    public A(int n)
    {
        super(); // by default even though we don't write
        System.out.println("in A int: ");
    }
}

class B extends A
{
    public B()
    {
        super(); // by default even though we don't write
        System.out.println("in B");
    }

    public B(int n)
    {
        this(); // this will execute construtor of same class
        System.out.println("in B int: ");
    }
}

class Hello {
    public static void main(String args[]) {
       B obj_B = new B(7);
       System.out.println(" ");


       // Step 1: goes to B class B(7) method and when we have int in it its goes to that int B() method
       // Step 2: this(); --> called the constructor of same class in our case it is B class
       // step 3: then B class B() method called
       // step 4: then super() default will called super class A in that A() method called

       /*
        * in A
        * in B
        * in B int:
        */
    }
}
```

### Stack & Heap

When `B obj_B = new B(7)` is called -- this() chains to same class first:

```
Step-by-step stack frames (B(7) --> this() --> B() --> super() --> A()):

Stack                                    Heap
┌──────────────────────────┐
│ A()                      │  ◄── super() from B() calls A()
│  prints "in A"           │
├──────────────────────────┤
│ B()                      │  ◄── this() from B(int) calls B()
│  super() called          │
│  prints "in B"           │
├──────────────────────────┤            ┌──────────────────────┐
│ B(int n)                 │            │ B object (is-a A)    │
│  ┌────────────────────┐  │  creates  │ ┌──────────────────┐ │
│  │ n = 7              │──┼──────────►│ │ (A part)         │ │
│  │ this() called      │  │            │ ├──────────────────┤ │
│  └────────────────────┘  │            │ │ (B part)         │ │
│  prints "in B int:"      │            │ └──────────────────┘ │
├──────────────────────────┤            └──────────────────────┘
│ main()                   │                       ▲
│  ┌────────────────────┐  │                       │
│  │ obj_B ─────────────┼──┼───────────────────────┘
│  └────────────────────┘  │
└──────────────────────────┘

Execution chain:
  B(7) --this()--> B() --super()--> A() --super()--> Object()

Output order: "in A" --> "in B" --> "in B int:"

Note: this() calls a constructor of the SAME class.
      super() calls a constructor of the PARENT class.
      this() and super() must always be the FIRST statement in a constructor.
      You cannot use both this() and super() in the same constructor.
```
