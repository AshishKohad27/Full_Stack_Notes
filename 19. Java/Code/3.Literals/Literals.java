class Literals {
    public static void main(String a[]) {
        int num = 10_00_00_000;
        int numBinary = 0b0001;
        int numHex = 0x0010;
        double intInFloat = 50;
        double epsilon = 12e10; // epsilon value or 10 rest to something
        // boolean b = 1; // it will give an error
        char ch = 'a';
        ch++;

        System.out.println("num: " + num);
        System.out.println("numBinary: " + numBinary);
        System.out.println("numHex: " + numHex);
        System.out.println("intInFloat: " + intInFloat);
        System.out.println("epsilon: " + epsilon);
        System.out.println("char after increment: " + ch);
    }
}