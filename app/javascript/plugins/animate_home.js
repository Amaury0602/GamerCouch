import 'animate'
const animateHome = () => {
const left =  document.querySelector('img.animate-left');
const right =  document.querySelector('img.animate-left');

  left.document.addEventListener("DOMContentLoaded", function(event) {
    left.classList.add('animated', 'bounceOutLeft');
  }
  right.document.addEventListener("DOMContentLoaded", function(event) {
    right.classList.add('animated', 'bounceOutright');
  }
}
export { animateHome };
