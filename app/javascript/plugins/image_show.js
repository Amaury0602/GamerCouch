const imageShow = () => {
 let bigImage = document.querySelector(".big-image");
  const littleImages = document.querySelectorAll(".little-images");
  littleImages.forEach ((image)=> {
      image.addEventListener("click" , (event) => {
        bigImage.src = bigImage.src = image.src
      });
  });
}

export { imageShow };
