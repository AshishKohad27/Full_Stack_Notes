class Loops {
    public static void main(String a[]) {
        // while loop
        int i = 0;
        while (i <= 4) {
            System.out.print("Hello "); // all statements comes in a single line
            System.out.println("Hello " + i); // every statement come in new line when we print
            i++;
        }

        System.out.println("--- do while ---");

        // do while
        int j = 0;
        do {
            System.out.println("First Do: " + j);
            j++;
        } while (j <= 4);

        System.out.println("--- do while (condition false from start) ---");

        // do while - executes at least once even when condition is false
        int k = 5;
        do {
            System.out.println("First Do: " + k);
            k++;
        } while (k <= 4);

        System.out.println("--- for loop ---");

        // for loop
        for (int m = 0; m <= 4; m++) {
            System.out.println("Hello " + m);
        }
    }
}
