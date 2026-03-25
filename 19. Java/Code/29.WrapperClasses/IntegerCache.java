class IntegerCache {
    public static void main(String args[]) {

        // --- Inside cache range (-128 to 127) ---
        Integer a = 100;
        Integer b = 100;
        System.out.println("a == b: " + (a == b));            // true (same cached object)
        System.out.println("a.equals(b): " + a.equals(b));    // true

        // --- Outside cache range ---
        Integer c = 200;
        Integer d = 200;
        System.out.println("c == d: " + (c == d));            // false (different objects!)
        System.out.println("c.equals(d): " + c.equals(d));    // true

        // LESSON: Always use .equals() for comparing wrapper objects!
    }
}
