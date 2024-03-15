document.addEventListener('turbo:load', function() {
  // 日記フォームの画像入力フィールドを取得
  const dailyLogImageField = document.querySelector('input[type="file"][name="daily_log[image]"]');

  // 記事フォームの画像入力フィールドを取得
  const articleImageField = document.querySelector('input[type="file"][name="article[image]"]');

  // プレビュー表示する関数
  function showPreview(fileField) {
    if (!fileField) return;

    fileField.addEventListener('change', function(e) {
      const previewList = document.getElementById('previews');
      // 既存のプレビューがあればクリア
      while (previewList.firstChild) {
        previewList.removeChild(previewList.firstChild);
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      const previewImage = document.createElement('img');
      previewImage.setAttribute('src', blob);

      previewList.appendChild(previewImage);
    });
  }

  // 各入力フィールドに対してプレビュー機能を適用
  showPreview(dailyLogImageField);
  showPreview(articleImageField);
});
