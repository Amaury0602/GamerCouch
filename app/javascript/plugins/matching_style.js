const matchingStyle = () => {
  const scores = document.querySelectorAll('#match-score')
  scores.forEach((score) => {
    const points = score.innerText
    if (score.innerText <= 25) {
      console.log("pas pour toi")
      score.classList.add('badder')
    }
    else if (score.innerText > 25 && score.innerText < 50){
      score.classList.add('less-bad')
    }
    else if (score.innerText >= 50 && score.innerText < 75) {
      score.classList.add('good')
    }
    else {
      score.classList.add('very-good')
    }
  })
}

export { matchingStyle };
