window.addEventListener('turbo:load', function(){
  const articleCheckButtons = document.querySelectorAll(".article-check-button");
  articleCheckButtons.forEach(function (button) {
    button.addEventListener("click", () => {
      const deleteFlg = window.confirm('記事の既読を削除しますか？');
      if(deleteFlg) {
        const articleId = button.getAttribute("data");
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/checks/revert/${articleId}`, true);
        XHR.send();
        XHR.onload = () => {
          button.remove();
        }
      } else {
        ;
      }
    });
  });
});
