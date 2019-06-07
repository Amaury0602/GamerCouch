const displayRecommandation = () => {
  const displayLinks = document.querySelectorAll(".recommandation")
  displayLinks.forEach((button) => {
    button.addEventListener('click', (event) => {
      event.preventDefault()
      const gameID = button.attributes['data-game-id'].value
      const hiddenDiv = document.querySelector(`[data-hidden-reco-id='${gameID}']`)
      if (hiddenDiv.classList.contains("hidden")) {
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
    });
  })
}


export default displayRecommandation;

// To do : faire la surlignement lorsqu'on clique sur le boutton
// button.classList.remove("active")
// button.classList.add("active")
