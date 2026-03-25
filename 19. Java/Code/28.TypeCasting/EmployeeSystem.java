class Employee {
    String name;
    int salary;

    Employee(String name, int salary) {
        this.name = name;
        this.salary = salary;
    }

    void work() {
        System.out.println(name + " is working");
    }
}

class Developer extends Employee {
    String language;

    Developer(String name, int salary, String language) {
        super(name, salary);
        this.language = language;
    }

    void code() {
        System.out.println(name + " is coding in " + language);
    }
}

class Manager extends Employee {
    int teamSize;

    Manager(String name, int salary, int teamSize) {
        super(name, salary);
        this.teamSize = teamSize;
    }

    void manage() {
        System.out.println(name + " is managing " + teamSize + " people");
    }
}

class EmployeeSystem {
    public static void main(String args[]) {

        // Upcasting — store all in one array
        Employee team[] = new Employee[3];
        team[0] = new Developer("Amit", 80000, "Java");
        team[1] = new Manager("Priya", 100000, 10);
        team[2] = new Developer("Rahul", 75000, "Python");

        for (Employee e : team) {
            e.work();

            // Downcasting with instanceof — access specific methods
            if (e instanceof Developer) {
                Developer d = (Developer) e;
                d.code();
            } else if (e instanceof Manager) {
                Manager m = (Manager) e;
                m.manage();
            }

            System.out.println("---");
        }
    }
}
