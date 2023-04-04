{
    let name = "kaush"
    {
        console.log(name); // kaush
        let newName = "aryan"
        {
            console.log(newName) // aryan
            console.log(name) // kaush
        }
    } // scope of newName ended here.

    //   console.log(newName)// throws ReferrenceError 
}
// /So we can easily conclude from here that variable from the outer scope is accessible to the inner scope.

function demoFunction() {
    let name = "aryan";
    function newFunction() {
        console.log(name) // logs aryan as name is available to newFucntion 
        // because of nesting of scopes.
    }

    newFunction();
}
demoFunction();
// Here, name is accessible to the newFunction and when newFunction is called, it logs the name.