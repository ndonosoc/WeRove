const recommend = document.getElementById("Recommend")

if(recommend) {

recommend.addEventListener("click", function(e) {
  e.preventDefault();
  const form = document.getElementById("home-form")
  form.action = "recommendations"
  form.method = "GET";
  form.submit()
}
  );

}
