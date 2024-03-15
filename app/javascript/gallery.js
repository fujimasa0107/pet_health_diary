document.addEventListener('turbo:load', () => {
  const mainImage = document.querySelector('.gallery-main-img');
  const thumbImages = document.querySelectorAll('.gallery-thumb-img');

  thumbImages.forEach((thumbImage) => {
    thumbImage.addEventListener('click', (event) => {
      mainImage.src = event.target.src;
      mainImage.animate({opacity: [0, 1]}, 500);
    });
  });
});
