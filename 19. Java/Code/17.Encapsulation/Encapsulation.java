// Encapsulation Example
class Human {
    // private variables - not accessible directly, only through getters/setters
    private int age;
    private String name;

    public int getAge() {
        return age;
    }

    public void setAge(int a) {
        age = a;
    }

    public String getName() {
        return name;
    }

    public void setName(String n) {
        name = n;
    }
}

class Encapsulation {
    public static void main(String args[]) {

        Human obj = new Human();
        // System.out.println(obj.name); // error: name has private access in Human

        obj.setAge(26);
        obj.setName("Ashish");
        System.out.println(obj.getName() + " : " + obj.getAge());
    }
}
