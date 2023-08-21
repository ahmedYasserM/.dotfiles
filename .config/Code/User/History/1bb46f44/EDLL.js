let person = [];

function getData(index, inputField, inputRgex) {
  person[index] = prompt(`Enter your ${inputField}`);

  while (!inputRgex.test(person[index])) {
    console.log(`%cwrong input format`, `color:red`);
    person[index] = prompt(`Enter your ${inputField} again`);
  }
}


let nameRgex = /^[a-zA-Z]+$/;
getData(0, "name", nameRgex);

let pNumRegex = /^[010|011|012|015][0-9]{11}$/