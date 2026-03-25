class Student {
    int rollno;
    String name;
    int marks;
}

class DataStorage {
    public static void main(String args[]) {

        // === 1D Array ===
        System.out.println("=== 1D Array ===");
        int nums[] = {5, 6, 7, 8, 9};

        // Index
        System.out.println("Index: " + nums[0]);

        // Updating
        nums[1] = 16;
        System.out.println("Updating: " + nums[1]);

        // Creating
        int nums_1[] = new int[4];
        nums_1[0] = 1;
        nums_1[1] = 2;
        nums_1[2] = 3;
        nums_1[3] = 4;

        // Loop
        for (int i = 0; i < nums_1.length; i++) {
            System.out.println("Creating: " + nums_1[i]);
        }

        // === Multidimensional Array ===
        System.out.println("\n=== Multidimensional Array ===");
        int nums2[][] = new int[3][4];

        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 4; j++) {
                nums2[i][j] = (int) (Math.random() * 10);
            }
        }

        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.print(nums2[i][j] + " ");
            }
            System.out.println();
        }

        // === Three Dimensional Array ===
        System.out.println("\n=== Three Dimensional Array ===");
        int nums3[][][] = new int[3][4][5];

        for (int i = 0; i < nums3.length; i++) {
            for (int j = 0; j < nums3[i].length; j++) {
                for (int k = 0; k < nums3[i][j].length; k++) {
                    nums3[i][j][k] = (int) (Math.random() * 10);
                }
            }
        }

        for (int n[][] : nums3) {
            for (int m[] : n) {
                for (int o : m) {
                    System.out.print(o + " ");
                }
                System.out.println();
            }
            System.out.println();
        }

        // === Array of Objects ===
        System.out.println("=== Array of Objects ===");
        Student s1 = new Student();
        s1.rollno = 1;
        s1.name = "Ashish";
        s1.marks = 90;

        Student s2 = new Student();
        s2.rollno = 2;
        s2.name = "Rahuk";
        s2.marks = 80;

        Student s3 = new Student();
        s3.rollno = 1;
        s3.name = "Pankaj";
        s3.marks = 70;

        Student students[] = new Student[3];
        students[0] = s1;
        students[1] = s2;
        students[2] = s3;

        for (int i = 0; i < students.length; i++) {
            System.out.println(students[i].name + " : " + students[i].marks);
        }
    }
}
