const loader = () => {
  const finder = document.getElementById("findLocals")
  const recommender = document.getElementById("Recommend")
  const loadingDiv = document.querySelector(".loader")
  if(finder || reommender) {

  finder.addEventListener("click", event => {
    loadingDiv.hidden = false;
  });
  recommender.addEventListener("click", event => {
    loadingDiv.hidden = false;
  });

  }
}

export { loader };
