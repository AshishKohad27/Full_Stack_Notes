```java
class Hello {
    public static void main(String args[]) {

        int nums[] = new int[4];
        nums[0]= 1;
        nums[1]= 2;
        nums[2]= 3;
        nums[3]= 4;

        for(int n : nums)
        {
            System.out.println("For Each: " + n);
        }

    }
}

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

        for(Student stud : students)
        {
            System.out.println(stud.name+" : "+stud.marks);
        }
    }
}
```

### Stack & Heap - ForEach with Primitive Array

After `int nums[] = new int[4];` and the for-each loop:

```
Stack (main frame)              Heap
┌──────────────────┐           ┌─────────────────────────┐
│ nums (ref)       │──────────►│ int[] Array Object       │
│ n = 1 (current)  │           │ [1, 2, 3, 4]            │
└──────────────────┘           └─────────────────────────┘

- nums is a reference on the Stack pointing to the array on the Heap.
- n is a loop variable (primitive copy) on the Stack.
- n gets a COPY of each element, not a reference to it.
```

### Stack & Heap - ForEach with Object Array

After creating Student objects and iterating:

```
Stack (main frame)                 Heap
┌──────────────────┐
│ s1 (ref)         │──────────►┌───────────────────────┐
│ s2 (ref)         │──┐        │ Student Object         │
│ s3 (ref)         │  │        │  rollno = 1            │
│ students (ref)   │  │        │  name ──► "Ashish"     │
│ stud (ref)       │──┼──┐     │  marks = 90            │
└──────────────────┘  │  │     └───────────────────────┘
                      │  │
                      │  │     ┌───────────────────────┐
                      ├──┼────►│ Student Object         │
                      │  │     │  rollno = 2            │
                      │  │     │  name ──► "Rahuk"      │
                      │  │     │  marks = 80            │
                      │  │     └───────────────────────┘
                      │  │
                      │  │     ┌───────────────────────┐
                      │  └────►│ Student Object         │
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

- stud is a reference on the Stack that points to each Student object in turn.
- Unlike primitives, stud gets a REFERENCE (not a copy), so it points to the same Heap object.
- The students array on the Heap holds references to the Student objects.
```

### Important Limitation
- You **cannot modify array elements** using for-each. The loop variable is a copy (for primitives) or a copy of the reference.
```java
for (int n : nums) {
    n = n * 2; // This does NOT change the original array!
}
// nums is still [1, 2, 3, 4]
```
- To modify elements, use a regular `for` loop with index: `nums[i] = nums[i] * 2;`