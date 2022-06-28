// to get my wallet balance
// console log:
//     balance: 0.273946141409655505
var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;

const Web3 = require('web3');
const rpcURL = "https://rinkeby.infura.io/v3/XXXXXXXXXXXXXXXXXXXXXXXXXX";
const web3 = new Web3(rpcURL);
const address = "0xXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

web3.eth.getBalance(address, (err, wei) => {
   var balance = web3.utils.fromWei(wei, 'ether');
   console.log('balance: ' + balance);
});
