const displayMatching = () => {
  const displayButtons = document.querySelectorAll(".right_choice")
    displayButtons.forEach((button) => {
      button.addEventListener('click', (event) => {
        event.preventDefault()
        const gameID = button.attributes['data-game-id'].value
        const hiddenDiv = document.querySelector(`.match-index[data-game-id='${gameID}']`)
        if (hiddenDiv.classList.contains("hidden") ) {
          const commentDivs = document.querySelectorAll(".comment-index")
          commentDivs.forEach(commentDiv => {
            commentDiv.classList.add("hidden")
          })
          const recommendationDivs = document.querySelectorAll(".recommandation-index")
          recommendationDivs.forEach(recommendationDiv => {
          recommendationDiv.classList.add("hidden")
          })
          const matchingDivs = document.querySelectorAll(".hidden-match-index")
          matchingDivs.forEach(matchingDiv => {
            matchingDiv.classList.add("hidden")
          })
          hiddenDiv.classList.remove("hidden")
        } else {
          hiddenDiv.classList.add("hidden")
        }
      })
    })
  }

export { displayMatching };


// if (hiddenDiv.style.display === "block") {
//               hiddenDiv.style.display = "none";
//             } else {
//               hiddenDiv.style.display = "block";
//             }
