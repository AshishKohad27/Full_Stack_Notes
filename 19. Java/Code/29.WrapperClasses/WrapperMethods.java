class WrapperMethods {
    public static void main(String args[]) {

        // --- String → Number ---
        int a = Integer.parseInt("123");
        double d = Double.parseDouble("9.8");
        System.out.println("Parsed int: " + a);       // 123
        System.out.println("Parsed double: " + d);    // 9.8

        // --- Number → String ---
        String s1 = Integer.toString(456);
        String s2 = String.valueOf(789);
        System.out.println("To String: " + s1 + ", " + s2);

        // --- Useful Constants ---
        System.out.println("Int MAX: " + Integer.MAX_VALUE);     // 2147483647
        System.out.println("Int MIN: " + Integer.MIN_VALUE);     // -2147483648

        // --- Number System Conversions ---
        System.out.println("10 in binary: " + Integer.toBinaryString(10));  // 1010
        System.out.println("255 in hex: " + Integer.toHexString(255));      // ff
        System.out.println("8 in octal: " + Integer.toOctalString(8));      // 10

        // --- Character Utility Methods ---
        System.out.println("isLetter('A'): " + Character.isLetter('A'));       // true
        System.out.println("isDigit('5'): " + Character.isDigit('5'));         // true
        System.out.println("toUpperCase('a'): " + Character.toUpperCase('a')); // A
        System.out.println("toLowerCase('Z'): " + Character.toLowerCase('Z')); // z
    }
}
