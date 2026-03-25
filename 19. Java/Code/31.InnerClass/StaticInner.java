class Outer2 {
    int x = 10;             // instance variable
    static int y = 20;      // static variable

    static class Inner {
        void show() {
            // System.out.println(x);  // ERROR — can't access non-static
            System.out.println("y = " + y);   // OK — static member
        }
    }
}

class StaticInner {
    public static void main(String args[]) {

        // No outer object needed!
        Outer2.Inner in = new Outer2.Inner();
        in.show();   // y = 20
    }
}
