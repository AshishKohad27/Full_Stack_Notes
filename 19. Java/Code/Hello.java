// InCapsulation
class Human {
    // this private variable not accessable direct to any one
    private int age;
    private String name;

    // Constructor
    public Human() { // default
        /*
         * 1. Constructor is a specifial method it has a same name has class name
         * constructor doesn't return any thing
         * 2. Every time we crate new obj it called constructor automatically
         * 3. We can write database connection
         * 4. Even if we don't create constructor then java it-self create constructor
         */
        System.out.println("In Default Constructor");
        age = 12;
        name = "John";
    }

    // public Human(int age, String name) { // USING THIS KEY-WORD
    //     this.age = age;
    //     this.name = name;
    // }

    public Human(int a, String n) { // Parameterized Constructor
        System.out.println("In Parameterized Constructor");
        age = a;
        name = n;
    }

    public int getAge() { // to access private variables we have to create its own method
        return age; // we can access age inside the method of same class
    }

    public void setAge(int age, Human obj) {
        Human obj1 = obj;
        // by this our key:age is refered to INSTANCE variable
        // by this our value:age is refered to LOCAL variable
        obj1.age = age; // set the age by this method
    }

    public void setAgeThis(int age) {
        // this is a key word which represent current object (i.e. Human obj as we do in
        // setAge)
        this.age = age; // set the age by this method
    }

    public String getName() {
        return name;
    }

    public void setName(String n) {
        name = n; // set the age by this method
    }
}

class Hello {
    public static void main(String args[]) {

        Human obj = new Human();
        // System.out.println(obj.name); // getting error because this variable is
        // private

        obj.setName("Ashish");

        // with obj passing in class
        obj.setAge(26, obj);
        System.out.println(obj.getName() + " : " + obj.getAge());

        // with this keyword passing in class
        obj.setAgeThis(27);
        System.out.println(obj.getName() + " : " + obj.getAge());

        // new Object
        Human obj1 = new Human(20, "John2");
        System.out.println(obj1.getName() + " : " + obj1.getAge());
    }
}