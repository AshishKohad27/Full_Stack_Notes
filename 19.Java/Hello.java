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


       // Step 1: goes to B class B() method and when we have int in it its goes to that int B() method
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