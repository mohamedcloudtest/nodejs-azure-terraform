const express = require('express');  // Import the express module
const app = express();              // Create an Express application
const port = process.env.PORT || 3000;  // Set port to 3000 or use environment variable

// Define a route for the home page
app.get('/', (req, res) => {
  res.send('Hello, Azure!');  // Send a response when someone visits the root URL
});

// Start the server and listen on the specified port
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

