class ForEachStudent {
    int rollno;
    String name;
    int marks;
}

class ForEach {
    public static void main(String args[]) {

        // For-each with int array
        System.out.println("=== For Each with int array ===");
        int nums[] = new int[4];
        nums[0] = 1;
        nums[1] = 2;
        nums[2] = 3;
        nums[3] = 4;

        for (int n : nums) {
            System.out.println("For Each: " + n);
        }

        // For-each with object array
        System.out.println("\n=== For Each with object array ===");
        ForEachStudent s1 = new ForEachStudent();
        s1.rollno = 1;
        s1.name = "Ashish";
        s1.marks = 90;

        ForEachStudent s2 = new ForEachStudent();
        s2.rollno = 2;
        s2.name = "Rahuk";
        s2.marks = 80;

        ForEachStudent s3 = new ForEachStudent();
        s3.rollno = 1;
        s3.name = "Pankaj";
        s3.marks = 70;

        ForEachStudent students[] = new ForEachStudent[3];
        students[0] = s1;
        students[1] = s2;
        students[2] = s3;

        for (ForEachStudent stud : students) {
            System.out.println(stud.name + " : " + stud.marks);
        }
    }
}
