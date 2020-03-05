const raterFunction = () => {


const button = document.getElementById("rate")

if(button) {

button.addEventListener("click", (event) => {

  button.disable = true;

  let counter = 0
  let sum = 0

  if(document.getElementById("rater").dataset["rating"]){
    counter += 1;
    sum += parseFloat(document.getElementById("rater").dataset["rating"]);
  };

  if(document.getElementById("rater2").dataset["rating"]){
    counter += 1;
    sum += parseFloat(document.getElementById("rater2").dataset["rating"]);
  };

  if(document.getElementById("rater3").dataset["rating"]){
    counter += 1;
    sum += parseFloat(document.getElementById("rater3").dataset["rating"]);
  };

  document.getElementById("rating_rating").value = (sum/counter).toFixed(2);
  const new_rating = document.getElementById("new_rating")
  new_rating.submit()

})


}
}

export { raterFunction }
