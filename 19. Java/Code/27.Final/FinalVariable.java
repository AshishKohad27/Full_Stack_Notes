class Student {
    String name;
    int age;

    Student(String name, int age) {
        this.name = name;
        this.age = age;
    }
}

class FinalVariable {
    public static void main(String args[]) {

        // 1. Final primitive — value locked
        final int MAX = 100;
        System.out.println("MAX = " + MAX);
        // MAX = 200;   // ERROR: cannot assign a value to final variable

        // 2. Final reference — arrow locked, object free
        final Student s = new Student("Amit", 20);
        s.age = 21;           // ALLOWED
        s.name = "Rahul";    // ALLOWED
        // s = new Student("New", 25);  // ERROR: cannot reassign
        System.out.println(s.name + " " + s.age);   // Rahul 21

        // 3. Final array — reference locked, elements free
        final int nums[] = {10, 20, 30};
        nums[0] = 99;         // ALLOWED
        // nums = new int[5]; // ERROR: cannot reassign
        System.out.println("nums[0] = " + nums[0]);  // 99

        // 4. Blank final — assign once later
        final int x;
        x = 10;       // OK — first assignment
        // x = 20;    // ERROR — already assigned
        System.out.println("x = " + x);
    }
}
