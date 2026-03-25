1. Stack
2. Heap
### Stack & Heap - Primitives vs Objects

```
Stack vs Heap storage:

Stack (stores primitives & references)     Heap (stores objects & arrays)
┌──────────────┐
│ int x = 5    │  ← primitive, value stored directly on Stack
│ double d=3.5 │  ← primitive, value stored directly on Stack
│ boolean b=T  │  ← primitive, value stored directly on Stack
└──────────────┘

- Primitives: byte, short, int, long, float, double, char, boolean
  → stored DIRECTLY on the Stack (no Heap involved)
- Objects and arrays: reference on Stack, data on Heap
```

3. Array
```java
class Hello {
    public static void main(String args[]) {
        int nums[]={5,6,7,8,9};

        // Index
        System.out.println("Index: " + nums[0]);

        // Updating
        nums[1]=16;
        System.out.println("Updating: " + nums[1]);

        // Creating
        int nums_1[] = new int[4];
        nums_1[0]= 1;
        nums_1[1]= 2;
        nums_1[2]= 3;
        nums_1[3]= 4;
        System.out.println("Creating: " + nums_1[0]);
        System.out.println("Creating: " + nums_1[1]);
        System.out.println("Creating: " + nums_1[2]);
        System.out.println("Creating: " + nums_1[3]);

        // Loop
        for(int i=0;i<nums_1.length;i++){
            System.out.println("Creating: " + nums_1[i]);
        }
    }
}
```

### Stack & Heap - Arrays

```
Stack (main frame)              Heap
┌──────────────────┐           ┌─────────────────────────┐
│ nums (ref)       │──────────►│ int[] Object             │
│ nums_1 (ref)     │──┐        │ [5, 16, 7, 8, 9]        │
│ i = 0..3         │  │        └─────────────────────────┘
└──────────────────┘  │
                      │        ┌─────────────────────────┐
                      └───────►│ int[] Object             │
                               │ [1, 2, 3, 4]            │
                               └─────────────────────────┘

- nums and nums_1 are references on the Stack.
- The actual array data lives on the Heap.
- Loop variable i is a primitive, stored on the Stack.
```

4. Multidimension
```java
class Hello {
    public static void main(String args[]) {
        int nums[][]= new int[3][4];

        // Multdimensional array
        for(int i=0; i<3; i++){

            for(int j=0; j<4; j++){
                System.out.print(nums[i][j]+" ");
            }

            System.out.println();
        }
        /* Output:-
                    0 0 0 0
                    0 0 0 0
                    0 0 0 0
        */
    }
}

class Hello {
    public static void main(String args[]) {
        int nums[][]= new int[3][4];

        for(int i=0; i<3; i++){
            for(int j=0; j<4; j++){
                nums[i][j] = (int) (Math.random()*10);
            }
        }

        // Multdimensional array
        for(int i=0; i<3; i++){

            for(int j=0; j<4; j++){
                System.out.print(nums[i][j]+" ");
            }
            System.out.println();
        }

        System.out.println();

        // another way to print array
        for(int n[] : nums){

            for(int m: n){
                System.out.print(m + "a ");
            }

            System.out.println();
        }
    }
}

```

5. Jagged Array
```java
class Hello {
    public static void main(String args[]) {
        // Three Dimension Array

        int nums[][]= new int[3][4][5];

        for(int i=0; i<nums.length; i++)
        {
            for(int j=0; j<nums[i].length; j++)
            {
                for(int k=0; k<nums[j].length; k++)
                {
                    nums[i][j][k] = (int) (Math.random()*10);
                }
            }
        }

        // another way to print array
        for(int n[] : nums)
        {
           for(int m[]: n)
           {
             for(int o: m)
             {
                System.out.print(o + " ");
             }
             System.out.println();
           }
           System.out.println();
        }
    }
}
```

6. Three Dimensional arrays
```java
class Hello {
    public static void main(String args[]) {
        // Three Dimension Array

        int nums[][][] = new int[3][4][5];

        for(int i=0; i<nums.length; i++)
        {
            for(int j=0; j<nums[i].length; j++)
            {
                for(int k=0; k<nums[i][j].length; k++)
                {
                    nums[i][j][k] = (int) (Math.random()*10);
                }
            }
        }

        // another way to print array
        for(int n[][] : nums)
        {
           for(int m[]: n)
           {
             for(int o: m)
             {
                System.out.print(o + " ");
             }
             System.out.println();
           }
           System.out.println();
        }
    }
}
```

## Creat array and assign value to it
```java
class Student {
    int rollno;
    String name;
    int marks;
}
class Hello {
    public static void main(String args[]) {

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

        for(int i=0; i<students.length; i++){
            System.out.println(students[i].name+" : "+students[i].marks);
        }
    }
}
```

### Stack & Heap - Array of Objects

```
Stack (main frame)                 Heap
┌──────────────────┐
│ s1 (ref)         │──────────►┌───────────────────────┐
│ s2 (ref)         │──┐        │ Student Object         │
│ s3 (ref)         │  │        │  rollno = 1            │
│ students (ref)   │  │        │  name ──► "Ashish"     │
│ i = 0..2         │  │        │  marks = 90            │
└──────────────────┘  │        └───────────────────────┘
                      │
                      ├───────►┌───────────────────────┐
                      │        │ Student Object         │
                      │        │  rollno = 2            │
                      │        │  name ──► "Rahuk"      │
                      │        │  marks = 80            │
                      │        └───────────────────────┘
                      │
   students (ref)─────┤───────►┌───────────────────────┐
                      │        │ Student Object         │
                      │        │  rollno = 1            │
                      │        │  name ──► "Pankaj"     │
                      │        │  marks = 70            │
                      │        └───────────────────────┘
                      │
                      └───────►┌───────────────────────────────┐
                               │ Student[] Array Object         │
                               │  [0] ──► Student(Ashish)       │
                               │  [1] ──► Student(Rahuk)        │
                               │  [2] ──► Student(Pankaj)       │
                               └───────────────────────────────┘

                               ┌───────────────────────┐
                               │ String Pool (in Heap)  │
                               │  "Ashish"              │
                               │  "Rahuk"               │
                               │  "Pankaj"              │
                               └───────────────────────┘

- s1, s2, s3 are references on the Stack pointing to Student objects on the Heap.
- students is a reference to an array object on the Heap.
- The array itself holds references to the same Student objects.
- String fields (name) point to Strings in the String Pool on the Heap.
- Primitive fields (rollno, marks) are stored inside the object on the Heap.
```