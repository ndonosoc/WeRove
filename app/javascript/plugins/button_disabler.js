const button = document.getElementsByName("recommendations")[0];

const buttonDisabler = () => {

  if (button) {

    window.onload = () => {
      button.disabled = true;
    };

    document.addEventListener("click", event => {

      if(document.querySelector('input[name="interests[]"]:checked') && document.getElementById("location").value != "") {
        button.disabled = false;
      }
    });

    document.addEventListener("keyup", event => {

      if(document.querySelector('input[name="interests[]"]:checked') && document.getElementById("location").value != "") {
        button.disabled = false;
      }
    });
  };

}

export { buttonDisabler };
