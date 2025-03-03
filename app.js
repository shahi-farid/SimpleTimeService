const express = require('express');
const app = express();

app.get('/', (req, res) => {
    const response = {
        timestamp: new Date().toISOString(),
        ip: req.headers['x-forwarded-for'] || req.connection.remoteAddress
    };
    res.json(response);
});

const PORT = process.env.PORT || 8000;
app.listen(PORT, () => {
    console.log(`SimpleTimeService running on port ${PORT}`);
});
