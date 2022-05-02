const updateButton = () => {
  if ($(window).scrollTop() >= 300) {
    // 300px以上スクロールされた
    // ボタンを表示
    $('.back-to-top').fadeIn();
  } else {
    // ボタンを非表示
    $('.back-to-top').fadeOut();
  }
};

// スクロールされる度にupdateButtonを実行
$(window).on('scroll', updateButton);

// ボタンをクリックしたらページトップにスクロールする
$('.back-to-top').on('click', (e) => {
  // ボタンのhrefに遷移しない
  e.preventDefault();

  // 600ミリ秒かけてトップに戻る
  $('html, body').animate({ scrollTop: 0 }, 600);
});

// ページの途中でリロード（再読み込み）された場合でも、ボタンが表示されるようにする
updateButton();

$(function(){
  let list = '';
  const limit = 20; //表示件数
  const accessToken = gon.instagram_access_token; // アクセストークン
  const businessID = gon.instagram_id; //instagram_business_accountのID
  const url = `https://graph.facebook.com/v13.0/${businessID}?fields=name,media.limit(${limit}){caption,media_url,thumbnail_url,permalink,like_count,comments_count,media_type}&access_token=${accessToken}`;
  $.ajax({
    url: url
  }).done((res)=> {
    const data = res.media;
    $.each(data, function(index, val) {
      $.each(val, function(i, item) {
        console.log(item);
        if(item.media_url){
          //メディアのタイプがビデオの場合、サムネを取得
          media = (item.media_type == 'VIDEO' ? item.thumbnail_url : item.media_url);

          // 一覧を変数listに格納
          list +=
          `<div class="insta_img">
            <a href="${item.permalink}" target="_blank" rel="noopener">
            <img src="${media}", class="insta_media">
            <span class="like"><i class="fa fa-heart"></i>${item.like_count}</span></a>
          </div>`;
        }

      })
    });
  $('#insta').html(`<div class="insta_list">${list}</div>`);
  }).fail(function(jqXHR, status) {
    $('#insta').html('<p>読み込みに失敗しました。</p>');
  });
});
