const displayMatching = () => {

  const displayButtons = document.querySelectorAll(".right_choice")
  if(displayButtons) {
    displayButtons.forEach((button) => {
      button.addEventListener('click', (event) => {
        event.preventDefault()
        const gameID = button.attributes['data-game-id'].value
        const hiddenDiv = document.querySelector(`[data-hidden-id='${gameID}']`)
        button.classList.toggle("active");
        if (hiddenDiv.style.display === "block") {
              hiddenDiv.style.display = "none";
            } else {
              hiddenDiv.style.display = "block";
            }
      })
    })
  }
}

export default displayMatching;
