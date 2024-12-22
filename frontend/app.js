const form = document.getElementById("event-form");
const responseMessage = document.getElementById("response-message");

// API Gateway Endpoint
const apiEndpoint =
  "https://8ckaq6g96e.execute-api.us-east-1.amazonaws.com/development/register";

// Event Listener for Form Submission
form.addEventListener("submit", async function (e) {
  e.preventDefault();

  // Get form data
  const eventID = e.target.event_id.value;
  const eventName = e.target.event_name.value;
  const eventDate = e.target.event_date.value;

  // Create request payload
  const payload = {
    eid: eventID,
    ename: eventName,
    edate: eventDate,
  };

  try {
    // Make POST request to the API Gateway endpoint
    const response = await fetch(apiEndpoint, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(payload),
    });

    // Parse the response JSON
    const data = await response.json();
    // Display the response message
    if (response.ok) {
      responseMessage.innerHTML = `<span style="color: green;">${data.message}</span>`;
    } else {
      responseMessage.innerHTML = `<span style="color: red;">Error: ${data.message}</span>`;
    }
  } catch (error) {
    // Handle network or unexpected errors
    responseMessage.innerHTML = `<span style="color: red;">Error: ${error.message}</span>`;
  }
});
