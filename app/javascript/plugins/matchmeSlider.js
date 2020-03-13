const accepter = document.getElementById("accepter")
const rejecter = document.getElementById("rejecter")
const rejecterButton = document.getElementById("rejecter-button")
const accepterButton = document.getElementById("accepter-button")
const wrapper = document.querySelector(".wrapper-match")

const matchMeSlider = () => {
  if(accepter) {
    accepterButton.addEventListener("click", event =>{

      wrapper.style.transition = "transform 0.5s"
      wrapper.style.transform = "translateX(500px)"
      accepter.submit()

    })

      rejecterButton.addEventListener("click", event =>{
      wrapper.style.transition = "transform 0.5s"
      wrapper.style.transform = "translateX(-500px)"
      rejecter.submit()

    })

  }
}

export { matchMeSlider };
