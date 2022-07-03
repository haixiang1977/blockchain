var express = require('express');
var fs = require('fs');
var router = express.Router();

/* Post request. */
router.post('/', function(req, res, next) {
  console.log("request: " + req.body.faddress);
});

module.exports = router;
