const myRater = () => {

  var rater = require("rater-js");
  let myDataService = 0;
if(rater){

  rater({
        element:document.querySelector("#rater"),
        rateCallback:function rateCallback(rating, done) {
            this.setRating(rating);
            done();
        },
        starSize:32,
        step:0.5
    });
 }
}

 const myRater2 = () => {

  var rater = require("rater-js");
  let myDataService = 0;
if(rater) {

  rater({
        element:document.querySelector("#rater2"),
        rateCallback:function rateCallback(rating, done) {
            this.setRating(rating);
            done();
        },
        starSize:32,
        step:0.5
    });
}
 }

 const myRater3 = () => {

  var rater = require("rater-js");
  let myDataService = 0;

if(rater) {

  rater({
        element:document.querySelector("#rater3"),
        rateCallback:function rateCallback(rating, done) {
            this.setRating(rating);
            done();
        },
        starSize:32,
        step:0.5
    });
}
 }

export { myRater };
export { myRater2 };
export { myRater3 };
