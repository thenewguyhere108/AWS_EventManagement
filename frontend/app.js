const form = document.getElementById("event-form");
const outputData = document.getElementById("output-data");

form.addEventListener("submit", function (e) {
  e.preventDefault();

  const eventID = e.target.event_id.value;
  const eventName = e.target.event_name.value;
  const eventDate = e.target.event_date.value;

  // Display the fetched data in the output section
  outputData.innerHTML = `
        <p>Event ID: <strong>${eventID}</strong></p>
        <p>Event Name: <strong>${eventName}</strong></p>
        <p>Event Date: <strong>${eventDate}</strong></p>
    `;

  // Clear the form inputs
  form.reset();
});
