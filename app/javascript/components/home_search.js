document.getElementById("Recommend").addEventListener("click", function(e) {
  e.preventDefault();
  const form = document.getElementById("home-form")
  form.action = "recommendations"
  form.submit()
}
  );
