class ArithmeticOperators {
    public static void main(String args[]) {
        int num = 7;
        int num1 = 10;
        int num2 = 20;

        // Addition
        int addition = num1 + num2;
        System.out.println("Addition: " + addition); // 30

        // Subtraction
        int subtraction = num1 - num2;
        System.out.println("Subtraction: " + subtraction); // -10

        // Division
        int division = num2 / num1;
        System.out.println("Division: " + division); // Quotient = 2

        // Multiplication
        int multiplication = num1 * num2;
        System.out.println("Multiplication: " + multiplication); // 200

        // Modulus
        int modulus = num1 % num2;
        System.out.println("Modulus: " + modulus); // Remainder = 10

        // Short Way
        int increment = 1;
        increment = increment + 1;
        increment += 1;
        increment++;
        System.out.println("Increment (1 -> +1 -> +=1 -> ++): " + increment); // 4

        // Pre Increment
        int preIncrement = ++num; // increment and then fetch
        System.out.println("Pre Increment (num was 7): " + preIncrement); // 8

        // Post Increment
        int postIncrement = num++; // fetch and then increment
        System.out.println("Post Increment: " + postIncrement); // 8 (fetched before increment)
        System.out.println("num after Post Increment: " + num); // 9
    }
}