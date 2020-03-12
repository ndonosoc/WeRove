const chatter = document.getElementById("chatter");
const messager = document.getElementById("message_content");

const chatFocus = () => {

  if (chatter) {

    chatter.addEventListener("submit", event => {
      messager.focus();
    });
  };

}

export { chatFocus };
