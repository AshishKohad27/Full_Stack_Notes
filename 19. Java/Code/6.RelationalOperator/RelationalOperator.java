class RelationalOperator {
    public static void main(String args[]) {
        // Relational Operator
        int x = 4;
        int y = 5;

        // 1. Less Than
        boolean lessThan = x < y;
        System.out.println("Less Than: " + lessThan); // true

        // 2. Less Than Equal to
        boolean lessEqualTo = x <= y;
        System.out.println("Less Than Equal To: " + lessEqualTo); // true

        // 3. Greater Than
        boolean greaterThan = x > y;
        System.out.println("Greater Than: " + greaterThan); // false

        // 4. Greater Than Equal to
        boolean greaterEqualTo = x >= y;
        System.out.println("Greater Than Equal To: " + greaterEqualTo); // false

        // 5. Equal To
        boolean equalTo = x == y;
        System.out.println("Equal To: " + equalTo); // false

        // 6. Not Equal To
        boolean notEqualTo = x != y;
        System.out.println("Not Equal To: " + notEqualTo); // true
    }
}
