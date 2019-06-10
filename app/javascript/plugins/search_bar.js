const modifyBar = () => {
  const bar = document.querySelector('.search-bar-careful-one')
  if (bar) {
    window.setInterval(function(){
      if (bar.classList.contains('search-bar-careful-one')) {
        bar.classList.remove('search-bar-careful-one')
        bar.classList.add('search-bar-careful-two')
      }
      else {
        bar.classList.remove('search-bar-careful-two')
        bar.classList.add('search-bar-careful-one')
      }
    }, 500);

  }
}

export default modifyBar;
