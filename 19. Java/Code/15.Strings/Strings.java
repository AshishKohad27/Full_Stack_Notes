class Strings {
    public static void main(String args[]) {

        // String basics
        System.out.println("=== String ===");
        String name = new String("Navin");

        System.out.println("Hello " + name);
        System.out.println("Char at Index of 0: " + name.charAt(0));
        System.out.println("Concat: " + name.concat(" Reddy"));

        // StringBuffer
        System.out.println("\n=== StringBuffer ===");
        StringBuffer sb = new StringBuffer("Navin");

        sb.append(" Reddy");
        System.out.println("Append: " + sb);

        sb.insert(6, "Java ");
        System.out.println("Insert: " + sb);
    }
}
