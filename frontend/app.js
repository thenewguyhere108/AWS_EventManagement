// On button click we have to collect the date

const RegisterButton = document.querySelector("form");

RegisterButton.addEventListener("submit", function (output) {
  output.preventDefault();
  let fetchedEventID = output.target[0].value;
  let fetchedEventName = output.target[1].value;
  let fetchedEventDate = output.target[2].value;
});
