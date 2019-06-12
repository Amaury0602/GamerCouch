const matchingStyle = () => {
  const scores = document.querySelectorAll('#match-score')
  scores.forEach((score) => {
    if (score.innerText <= 25) {
      console.log("pas pour toi")
      score.classList.add('badder')
    }
    else if (score.innerText > 25 && score.innerText < 50){
      console.log("pourquoi pas...")
      score.classList.add('less-bad')
    }
    else if (score.innerText >= 50 && score.innerText < 75) {
      console.log("tu vas aimer")
      score.classList.add('good')
    }
    else {
      console.log("fonce tu vas kiffer ta race")
      score.classList.add('very-good')
    }
  })
}

export { matchingStyle };
