interface OnClickListener {
    void onClick(String buttonName);
}

class Button {
    String name;
    OnClickListener listener;

    Button(String name) {
        this.name = name;
    }

    void setOnClickListener(OnClickListener listener) {
        this.listener = listener;
    }

    void click() {
        if (listener != null) {
            listener.onClick(name);
        }
    }
}

class EventHandling {
    public static void main(String args[]) {

        Button loginBtn = new Button("Login");
        Button signupBtn = new Button("Signup");

        // Anonymous class — different behavior for each button
        loginBtn.setOnClickListener(new OnClickListener() {
            public void onClick(String buttonName) {
                System.out.println(buttonName + " clicked → Logging in...");
            }
        });

        signupBtn.setOnClickListener(new OnClickListener() {
            public void onClick(String buttonName) {
                System.out.println(buttonName + " clicked → Signing up...");
            }
        });

        loginBtn.click();    // Login clicked → Logging in...
        signupBtn.click();   // Signup clicked → Signing up...
    }
}
