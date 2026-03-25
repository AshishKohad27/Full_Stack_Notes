// super() - calls the constructor of the super class
// this() - calls the constructor of the same class

class A {
    public A() {
        super(); // calls Object constructor (every class extends Object)
        System.out.println("in A");
    }

    public A(int n) {
        super();
        System.out.println("in A int");
    }
}

class B extends A {
    public B() {
        super(); // calls A() default constructor
        System.out.println("in B");
    }

    public B(int n) {
        this(); // calls B() default constructor of same class (demonstrates this())
        System.out.println("in B int");
    }
}

class C extends A {
    public C() {
        super();
        System.out.println("in C");
    }

    public C(int n) {
        super(n); // calls A(int n) parameterized constructor
        System.out.println("in C int");
    }
}

class D extends A {
    public D() {
        super(5); // calls A(int n) instead of A()
        System.out.println("in D");
    }

    public D(int n) {
        super(n);
        System.out.println("in D int");
    }
}

class ThisSuper {
    public static void main(String args[]) {
        System.out.println("--- B default ---");
        B obj_B1 = new B();

        System.out.println("\n--- B(7) with super() ---");
        B obj_B2 = new B(7);

        System.out.println("\n--- C(7) with super(n) ---");
        C obj_C = new C(7);

        System.out.println("\n--- D default with super(5) ---");
        D obj_D = new D();
    }
}
