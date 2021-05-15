// --- IMPORTS ---

const express   = require('express');
const multer    = require('multer');
const parser    = require('body-parser');

const router    = express.Router();

let quoteFilename = "";
let didReceiveFile = false;


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
    // checking file metadata
    console.log(req.file);
    console.log(req.body);

    // set
    quoteFilename = req.file.originalname;
    didReceiveFile = true;

    // done
    res.send("File uploaded successfully")
});

router.get('/quote', (req, res) => {
    if (!didReceiveFile) {
        res.sendStatus(404);
    } else {
        // reset this
        didReceiveFile = false;

        // then send
        res.setHeader("Content-Disposition", `attachment; filename="${quoteFilename}`);
        res.sendFile(quoteFilename, {'root': '../TWS\ API/quotes'});
    }
});
 
module.exports = router; 