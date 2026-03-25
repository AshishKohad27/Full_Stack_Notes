enum Day {
    MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY
}

class EnumBasics {
    public static void main(String args[]) {

        Day today = Day.WEDNESDAY;
        System.out.println("Today: " + today);

        // if-else
        if (today == Day.SATURDAY || today == Day.SUNDAY) {
            System.out.println("Weekend!");
        } else {
            System.out.println("Weekday");
        }

        // switch
        switch (today) {
            case MONDAY:    System.out.println("Start of week"); break;
            case FRIDAY:    System.out.println("Almost weekend"); break;
            case WEDNESDAY: System.out.println("Midweek"); break;
            default:        System.out.println("Regular day");
        }

        // Built-in methods
        System.out.println("\n--- Built-in Methods ---");
        System.out.println("name: " + today.name());         // WEDNESDAY
        System.out.println("ordinal: " + today.ordinal());   // 2

        // values() — all constants
        System.out.println("\n--- All Days ---");
        for (Day d : Day.values()) {
            System.out.println(d + " → index " + d.ordinal());
        }

        // valueOf() — String to enum
        Day fromString = Day.valueOf("FRIDAY");
        System.out.println("\nFrom string: " + fromString);
    }
}
