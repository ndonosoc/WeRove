const tagger = () => {
  const tags =  document.querySelectorAll(".category-tag")

  if (tags) {
    tags.forEach(tag => {
      tag.addEventListener("click", (event) => {
        tag.classList.toggle("active-tag");
        if (tag.children[0].children[1].checked) {
          tag.children[0].children[1].checked = false;
        } else {
          tag.children[0].children[1].checked = true;
        }
      })
    })
  }
}
const reverseTagger = () => {
  const tags =  document.querySelectorAll(".category-tag-reverse")

  if (tags) {
    tags.forEach(tag => {
      tag.addEventListener("click", (event) => {
        tag.classList.toggle("active-tag-reverse");
        if (tag.children[0].children[1].checked) {
          tag.children[0].children[1].checked = false;
        } else {
          tag.children[0].children[1].checked = true;
        }
      })
    })
  }
}

export { tagger, reverseTagger };
