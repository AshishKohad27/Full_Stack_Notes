// 'this' keyword - represents the current object

class Person {
    private int age;
    private String name;

    // Default Constructor
    public Person() {
        System.out.println("In Default Constructor");
        age = 12;
        name = "John";
    }

    // Parameterized Constructor using 'this' keyword
    public Person(int age, String name) {
        System.out.println("In Parameterized Constructor");
        this.age = age;     // 'this.age' refers to instance variable, 'age' refers to parameter
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    // Setting age by passing object reference explicitly
    public void setAge(int age, Person obj) {
        obj.age = age;
    }

    // Setting age using 'this' keyword instead of passing object
    public void setAgeThis(int age) {
        this.age = age; // 'this' represents the current object
    }

    public String getName() {
        return name;
    }

    public void setName(String n) {
        name = n;
    }
}

class This {
    public static void main(String args[]) {

        Person obj = new Person();

        obj.setName("Ashish");

        // Setting age by passing object reference
        obj.setAge(26, obj);
        System.out.println(obj.getName() + " : " + obj.getAge());

        // Setting age using 'this' keyword
        obj.setAgeThis(27);
        System.out.println(obj.getName() + " : " + obj.getAge());

        // Using parameterized constructor
        Person obj1 = new Person(20, "John2");
        System.out.println(obj1.getName() + " : " + obj1.getAge());
    }
}
