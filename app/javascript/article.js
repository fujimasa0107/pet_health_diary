document.addEventListener("turbo:load", function() {
  const articles = document.querySelectorAll(".article");

  articles.forEach(article => {
    article.addEventListener("mouseover", function() {
      this.style.transform = "scale(1.05)";
      this.style.boxShadow = "0px 4px 8px rgba(0, 0, 0, 0.2)";
      this.style.transition = "transform 0.3s ease, box-shadow 0.3s ease";
      this.style.zIndex = "1000"
    });

    article.addEventListener("mouseout", function() {
      this.style.transform = "";
      this.style.boxShadow = "";
      this.style.transition = "";
      this.style.zIndex = "0";
    });
  });
});
