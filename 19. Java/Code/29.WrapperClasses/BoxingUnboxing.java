class BoxingUnboxing {
    public static void main(String args[]) {

        // --- Manual Boxing (primitive → object) ---
        int a = 10;
        Integer num = Integer.valueOf(a);       // boxing
        Double dObj = Double.valueOf(5.5);      // boxing
        Character cObj = Character.valueOf('A'); // boxing
        System.out.println("Boxing: " + num + ", " + dObj + ", " + cObj);

        // --- Manual Unboxing (object → primitive) ---
        int b = num.intValue();                 // unboxing
        double d = dObj.doubleValue();          // unboxing
        char c = cObj.charValue();              // unboxing
        System.out.println("Unboxing: " + b + ", " + d + ", " + c);

        // --- Auto-Boxing (automatic) ---
        Integer x = 10;          // auto-boxing
        Double y = 5.5;          // auto-boxing
        Boolean z = true;        // auto-boxing
        System.out.println("Auto-Boxing: " + x + ", " + y + ", " + z);

        // --- Auto-Unboxing (automatic) ---
        int p = x;               // auto-unboxing
        double q = y;            // auto-unboxing
        boolean r = z;           // auto-unboxing
        System.out.println("Auto-Unboxing: " + p + ", " + q + ", " + r);

        // --- Auto-Unboxing in expressions ---
        Integer m = 10;
        Integer n = 20;
        int sum = m + n;         // auto-unboxes both, adds, stores as int
        System.out.println("Sum: " + sum);   // 30
    }
}
