/*

Duck typing two object are consider to be same type if both share the same set of 
properties.

When  I see a bird that walks like a duck , swims like a duck and quacks like a duck, 
I call that bird a duck
 
*/

interface Identity {
  email_id: string;
  phone_no: number;
}

// same interface to all
function getClgInformation(student: Identity, parents: Identity): Identity {
  return {
    email_id: "teacher@gmail.com",
    phone_no: 8989898989,
  };
}

let sObj: Identity = {
  email_id: "Student@gmail.com",
  phone_no: 7878787878,
};

let pObj: Identity = {
  email_id: "Parent@gmail.com",
  phone_no: 4545454545,
};

console.log(getClgInformation(sObj, pObj));
