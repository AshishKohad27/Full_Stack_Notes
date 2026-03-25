```java
// InCapsulation
class Human
{
    // this private variable not accessable direct to any one only accessable to own Class (i.e. Human)
    private int age;
    private String name;

    public int getAge(){ // to access private variables we have to create its own method
        return age; // we can access age inside the method of same class
    }

    public void setAge(int a){
        age = a; // set the age by this method
    }

    public String getName(){
        return name;
    }

    public void setName(String n){
        name = n; // set the age by this method
    }
}

class Hello {
    public static void main(String args[]) {

        Human obj = new Human();
        // System.out.println(obj.name); // getting error because this variable is private

        obj.setAge(26);
        obj.setName("Ashish");
        System.out.println(obj.getName()+" : "+obj.getAge());
    }
}
```

### Stack & Heap

After `obj.setAge(26)` and `obj.setName("Ashish")`:

```
Stack                                Heap
┌─────────────────────┐             ┌─────────────────────────┐
│ main()              │             │ Human object            │
│  ┌───────────────┐  │             │ ┌─────────────────────┐ │
│  │ obj           │──┼────────────►│ │ private age  = 26   │ │
│  └───────────────┘  │             │ │ private name = "Ash"│ │
└─────────────────────┘             │ └─────────────────────┘ │
                                    └─────────────────────────┘

When obj.setAge(26) is called:
Stack                                Heap
┌─────────────────────┐             ┌─────────────────────────┐
│ setAge(int a)       │             │ Human object            │
│  ┌───────────────┐  │             │ ┌─────────────────────┐ │
│  │ a = 26        │  │   writes───►│ │ private age  = 26   │ │
│  └───────────────┘  │             │ │ private name = null │ │
├─────────────────────┤             │ └─────────────────────┘ │
│ main()              │             └─────────────────────────┘
│  ┌───────────────┐  │                        ▲
│  │ obj           │──┼────────────────────────┘
│  └───────────────┘  │
└─────────────────────┘

When obj.getAge() is called:
Stack                                Heap
┌─────────────────────┐             ┌─────────────────────────┐
│ getAge()            │             │ Human object            │
│  ┌───────────────┐  │   reads    │ ┌─────────────────────┐ │
│  │ return 26   ◄─┼──┼────────────│ │ private age  = 26   │ │
│  └───────────────┘  │             │ │ private name ="Ash" │ │
├─────────────────────┤             │ └─────────────────────┘ │
│ main()              │             └─────────────────────────┘
│  ┌───────────────┐  │                        ▲
│  │ obj           │──┼────────────────────────┘
│  └───────────────┘  │
└─────────────────────┘

Note: Private fields (age, name) are INSIDE the object on the Heap.
      They can only be accessed through getter/setter methods.
      Each method call creates a new stack frame on top of main().
```

### The `this` keyword in setters
In real code, setter parameters usually have the same name as the field. Use `this` to distinguish:
```java
public void setAge(int age){
    this.age = age; // "this.age" = field, "age" = parameter
}

public void setName(String name){
    this.name = name;
}
```
- `this` refers to the **current object**. Without it, `age = age` would assign the parameter to itself and the field would stay unchanged.