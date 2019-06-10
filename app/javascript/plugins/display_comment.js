const displayComment = () => {
  const displayLinks = document.querySelectorAll(".click-comment")
    displayLinks.forEach((button) => {
    button.addEventListener('click', (event) => {
      event.preventDefault()
      const gameID = button.attributes['data-game-id'].value
      const hiddenDiv = document.querySelector(`.comment-index[data-game-id='${gameID}']`)
      if (hiddenDiv.classList.contains("hidden")) {
        const commentDivs = document.querySelectorAll(".comment-index")
        commentDivs.forEach(commentDiv => {
          commentDiv.classList.add("hidden")
        })
        const recommandationDivs = document.querySelectorAll(".recommandation-index")
        recommandationDivs.forEach(recommandationDiv => {
          recommandationDiv.classList.add("hidden")
        })
        const matchingDivs = document.querySelectorAll(".match-index")
        matchingDivs.forEach(matchingDiv => {
          matchingDiv.classList.add("hidden")
        })
        hiddenDiv.classList.remove("hidden")

      } else {
        hiddenDiv.classList.add("hidden")
      }
    });
  })
}

export default displayComment;
