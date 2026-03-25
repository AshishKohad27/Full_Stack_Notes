class LogicalOperator {
    public static void main(String args[]) {
        int x = 7;
        int y = 5;
        int a = 5;
        int b = 9;

        // AND Operator
        boolean and = x > y && a > b;
        System.out.println("AND: " + and); // false

        // OR Operator
        boolean or = x > y || a > b;
        System.out.println("OR: " + or); // true

        // NOT Operator
        boolean t = true;
        boolean not = !t;
        System.out.println("NOT: " + not); // false
    }
}
