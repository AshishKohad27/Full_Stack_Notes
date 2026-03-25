final class MathUtils {
    static int square(int n) {
        return n * n;
    }

    static int cube(int n) {
        return n * n * n;
    }
}

// class AdvMath extends MathUtils { }   // ERROR: cannot inherit from final class

class FinalClass {
    public static void main(String args[]) {
        System.out.println("Square of 5 = " + MathUtils.square(5));   // 25
        System.out.println("Cube of 3 = " + MathUtils.cube(3));       // 27
    }
}
