const sender = document.getElementById("sender");

const senderDisabler = () => {

  if (sender) {

    window.onload = () => {
      sender.disabled = true;
    };

    document.addEventListener("click", event => {

      if(document.getElementById('message_content').value != "") {
        sender.disabled = false;
      } else {
        sender.disabled = true;
      }
    });

    document.addEventListener("keyup", event => {

      if(document.getElementById('message_content').value != "") {
        sender.disabled = false;
      } else {
        sender.disabled = true;
      }
    });
  };

}

export { senderDisabler };
