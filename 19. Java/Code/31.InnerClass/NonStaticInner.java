class Outer {
    int x = 10;
    private int secret = 99;

    class Inner {
        void show() {
            // Can access outer class members — even private!
            System.out.println("x = " + x);
            System.out.println("secret = " + secret);
        }
    }
}

class NonStaticInner {
    public static void main(String args[]) {

        // Step 1: Create outer object
        Outer out = new Outer();

        // Step 2: Create inner using outer object
        Outer.Inner in = out.new Inner();

        in.show();
        // x = 10
        // secret = 99
    }
}
