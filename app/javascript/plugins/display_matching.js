const displayMatching = () => {
  const displayButtons = document.querySelectorAll(".right_choice")
    displayButtons.forEach((button) => {
      button.addEventListener('click', (event) => {
        event.preventDefault()
        const gameID = button.attributes['data-game-id'].value
        const hiddenDiv = document.querySelector(`[data-hidden-id='${gameID}']`)
        button.classList.toggle("active")
        if (hiddenDiv.classList.contains("hidden") ) {
          const matchingDivs = document.querySelectorAll(".hidden-match-index")
          matchingDivs.forEach(matchingDiv => {
            matchingDiv.classList.add("hidden")
          })
          const recommendationDivs = document.querySelectorAll(".recommandation-index")
          recommendationDivs.forEach(recommendationDiv => {
          recommendationDiv.classList.add("hidden")
          })
          hiddenDiv.classList.remove("hidden")
        } else {
          hiddenDiv.classList.add("hidden")
        }
      })
    })
  }

export default displayMatching;


// if (hiddenDiv.style.display === "block") {
//               hiddenDiv.style.display = "none";
//             } else {
//               hiddenDiv.style.display = "block";
//             }
