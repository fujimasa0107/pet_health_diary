const menubar = () => {
  const menuOpen = document.querySelector('#menu-open');
  const menuClose = document.querySelector('#menu-close');
  const menuPanel = document.querySelector('#menu-panel');
  const menuItems = document.querySelectorAll('#menu-panel li');
  const menuOptions = {
    duration: 1400,
    easing: 'ease',
    fill: 'forwards',
  };
  
  let isMenuOpen = false; // メニューの表示状態を追跡する変数

  if (menuOpen && menuClose && menuPanel) {
    // メニューを開くまたは閉じる関数
    const toggleMenu = () => {
      if (isMenuOpen) {
        // メニューを閉じる
        menuPanel.animate({ translate: [0, '100vw'] }, menuOptions);
        menuItems.forEach(menuItem => {
          menuItem.animate({ opacity: [1, 0] }, menuOptions);
        });
      } else {
        // メニューを開く
        menuPanel.animate({ translate: ['100vw', 0] }, menuOptions);
        menuItems.forEach((menuItem, index) => {
          menuItem.animate(
            {
              opacity: [0, 1],
              translate: ['2rem', 0],
            },
            {
              duration: 2400,
              delay: 300 * index,
              easing: 'ease',
              fill: 'forwards',
            }
          );
        });
      }
      // メニューの表示状態を切り替える
      isMenuOpen = !isMenuOpen;
    };

    // メニューボタンのクリックイベントリスナー
    menuOpen.addEventListener('click', toggleMenu);
    menuClose.addEventListener('click', toggleMenu);
  }
};

window.addEventListener('turbo:load', menubar);
