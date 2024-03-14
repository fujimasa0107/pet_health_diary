const check = () => {
  const checkButtons = document.querySelectorAll('.article-check-button');
  checkButtons.forEach(button => {
    button.addEventListener('click', function(event) {
      event.preventDefault();
      const articleId = this.getAttribute('data-id');

      if (confirm('既読を未読に戻しますか？')) {
        fetch(`/checks/${articleId}/revert_check`, {
          method: 'POST',
          headers: {
            'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content,
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({ id: articleId })
        })
        .then(response => {
          if (response.ok) {
            // 既読の状態をセッションストレージに保存
            sessionStorage.setItem(`article_${articleId}_read`, 'false');
            // ページをリロード
            location.reload();
          } else {
            console.error('Error:', response);
          }
        })
        .catch(error => console.error('Error:', error));
      }
    });
  });
};

window.addEventListener('turbo:load', () => {
  // ページがロードされる時に既読の状態を復元
  const checkButtons = document.querySelectorAll('.article-check-button');
  checkButtons.forEach(button => {
    const articleId = button.getAttribute('data-id');
    const read = sessionStorage.getItem(`article_${articleId}_read`);
    if (read === 'true') {
      // 既読の場合は適切なスタイルを適用
      button.classList.add('read');
    }
  });

  check(); // イベントリスナーを再度アタッチ
});
