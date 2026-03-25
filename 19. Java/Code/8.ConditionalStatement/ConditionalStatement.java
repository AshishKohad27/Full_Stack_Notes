class ConditionalStatement {
    public static void main(String args[]) {
        // Conditional Statement
        int x = 4;
        int y = 5;

        // Simple if
        if (x < 5)
            System.out.println("Less than");

        // if-else
        if (x > 5)
            System.out.println("Greater than");
        else
            System.out.println("Less than");

        // if-else with block
        if (x < 5) {
            System.out.println(x);
            System.out.println("Greater than");
        } else
            System.out.println("Less than");

        // Nested if-else (else-if ladder)
        if (x < 5)
            System.out.println("True!!!!");
        else if (x > 5)
            System.out.println("True!!!!");
        else
            System.out.println("True!!!!");

        // Ternary Operator
        int num = 5;
        boolean result1 = num % 2 == 0 ? true : false;
        System.out.println("Is even? " + result1);

        // Switch Case
        int n = 5;
        switch (n) {
            case 1:
                System.out.println("Monday");
                break;
            case 2:
                System.out.println("Tuesday");
                break;
            case 3:
                System.out.println("Wednesday");
                break;
            case 4:
                System.out.println("Thursday");
                break;
            case 5:
                System.out.println("Friday");
                break;
            case 6:
                System.out.println("Saturday");
                break;
            case 7:
                System.out.println("Sunday");
                break;
            default:
                System.out.println("Not Match");
                break;
        }
    }
}
