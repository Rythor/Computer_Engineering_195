///
/// Simple API for receiving/serving data sent from the UiPath RPA.
///
/// This API will be running on a local server and exposed through a public url using ngrok.
///

// --- IMPORTS ---
const express   = require('express');

const app       = express();
const port      = process.env.port || 3000;


// --- REGISTER ROUTES ---

app.use('/api', require('./routes/api/tws.js'));


// --- START SERVER ---

app.listen(port, () => {
    console.log(`TWS API running on port ${port}`);
})
