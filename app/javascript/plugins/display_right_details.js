const displayRightDetails = () => {
  const rights = document.querySelectorAll('.right')
  console.log(rights)

  rights.forEach((right) => {
    right.addEventListener('mouseover', (event) => {
      const gameID = right.attributes['data-game-id'].value
      const textInput = event.currentTarget.children[0].children[0]
      // if text
      textInput.insertAdjacentHTML('beforeend', '<p>Click for details</p>')
    })
  }, {once: true})
}

export { displayRightDetails }
