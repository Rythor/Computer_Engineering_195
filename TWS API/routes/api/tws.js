// --- IMPORTS ---

const express   = require('express');
const multer    = require('multer');
const path      = require('path');
const fs        = require('fs');

const router    = express.Router();

let downloadNumber = 0;


// --- MULTER CONFIG ---

const fileStorageEngine = multer.diskStorage({
    destination: (req, file, callback) => {
        callback(null, './quotes');
    },
    filename: (req, file, callback) => {
        callback(null, file.originalname)
    }
});
const uploads = multer({storage: fileStorageEngine});


// --- ROUTES ---

router.get("/ping", (req, res) => {
    res.statusCode = 200;
    res.json({message: 'TWS API Version 1.0 is alive'});
});

router.post("/quote", uploads.single('pdf_f'), (req, res) => {
    console.log(req.file); // checking file metadata
    res.send("File uploaded successfully")
});

router.get('/quote', (req, res) => {
    // set the content-disposition header
    res.setHeader("Content-Disposition", `attachment; filename="${downloadNumber++}-ref.pdf"`);
    res.sendFile('ref.pdf', {'root': '../TWS\ API/quotes'});
});
 
module.exports = router; 