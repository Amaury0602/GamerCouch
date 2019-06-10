const displayLikeCounter = () => {
  const displayLinks = document.querySelectorAll(".click-like")
    displayLinks.forEach((button) => {
      button.addEventListener('click', (event) => {
        event.preventDefault()
        const gameID = button.attributes['data-game-id'].value
        const likeCounter = document.querySelector(`.click-like[data-game-id='${gameID}'] .counterlike`)
        const likeCounterText = likeCounter.innerHTML
        const likeCounterWithoutParentheses = likeCounterText.substr(1,likeCounterText.length-2)
        console.log(likeCounterWithoutParentheses)
        const likeCounterInteger = Number.parseInt(likeCounterWithoutParentheses, 10)
        likeCounter.innerText = `(${likeCounterInteger + 1})`
      })
    })
}


export default displayLikeCounter;

// const likeCounterWithoutParentheses = likeCounterText.substr(1,likeCounterText.length-2)
// const likeCounterInteger = Number.parseInt(likeCounterWithoutParentheses, 10)
// console.log(likeCounterInteger)
// likeCounter.innerText = `(${likeCounterInteger + 1})`
// document.querySelector('.comments-<%= @game.id %>').innerHTML = commentCounter.toString();
// var likeCounter = document.querySelectorAll(`.click[data-game-id='${gameID}'] .counterlike`)
// console.log(likeCounter)
// var likeCounterText = likeCounter.innerHTML
