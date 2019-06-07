const displayRecommandation = () => {
  const displayLinks = document.querySelectorAll(".recommandation")
  displayLinks.forEach((button) => {
    button.addEventListener('click', (event) => {
      event.preventDefault()
      const recommendationDivs = document.querySelectorAll(".recommandation-index")
      recommendationDivs.forEach(recommendationDiv => {
        recommendationDiv.classList.add("hidden")
      })
      const gameID = button.attributes['data-game-id'].value
      const hiddenDiv = document.querySelector(`[data-hidden-id='${gameID}']`)
      hiddenDiv.classList.remove("hidden")
    });
  })
}


export default displayRecommandation;
