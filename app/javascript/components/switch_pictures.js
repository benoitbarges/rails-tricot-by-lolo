const images = document.querySelectorAll(".side-image");

const switchPictures = () => {
  if (images) {
    images.forEach((image) => {
      image.addEventListener("click", (event) => {
        const mainImage = document.querySelector("#main-image");
        const src = event.currentTarget.src.replace(/h_100/g, "h_550").replace(/w_100/g, "w_550");
        mainImage.src = src;
      })
    })
  }
}


export {switchPictures};
