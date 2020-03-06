const tags =  document.querySelectorAll(".category-tag")

if (tags) {
  tags.forEach(tag => {
    tag.addEventListener("click", (event) => {
      tag.classList.toggle("active-tag");
      tag.children[0].children[1].checked = "checked";
    })
  })
}
