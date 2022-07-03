var express = require('express');
var fs = require('fs');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  //res.render('index', { title: 'Express' });
  fs.readFile('../public/index.html', function(err, html) {
      if (err) {
          throw err;
      }
      res.write(html);
      res.end();
  });
});

module.exports = router;
