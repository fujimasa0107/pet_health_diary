document.addEventListener('turbo:load', function() {
  const checkButtons = document.querySelectorAll('.article-check-button');
  checkButtons.forEach(button => {
    button.addEventListener('click', function() {
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
          this.remove();
        } else {
          console.error('Error:', response);
        }
      })
      .catch(error => console.error('Error:', error));
     }
    });
  });
});
