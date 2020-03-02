var gm = require('gm');
gm( __dirname+"/../avatar/profile.jpg")
// .crop(50, 50, 50, 50)
.resize(100, 100, '!')
.noProfile()
.write(__dirname+"/../avatar/my.jpg", function(err) {
  if (!err) {
    console.log('done');
  } else {
    console.log(err);
  }
});
