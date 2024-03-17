document.addEventListener('turbo:load', function() {
  // 画像フィールドとプレビュー要素の参照を取得
  const dailyLogImageField = document.querySelector('input[type="file"][name="daily_log[image]"]');
  const previewList = document.getElementById('previews');
  const previews = document.querySelector('previews');

  // 既にアップロードされた画像がある場合に表示
  if (previews) {
    previewList.appendChild(previews);
  }

  // 画像アップロードフィールドの変更を監視し、新しい画像が選択されたらプレビューを表示
  dailyLogImageField.addEventListener('change', function(e) {
    // 既存のプレビューがあればクリア
    while (previewList.firstChild) {
      previewList.removeChild(previewList.firstChild);
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const previewImage = document.createElement('img');
    previewImage.setAttribute('src', blob);
    previewImage.classList.add('preview-size');
    previewList.appendChild(previewImage);
  });
});
