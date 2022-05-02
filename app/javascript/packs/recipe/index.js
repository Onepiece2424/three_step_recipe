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


// $.ajax({
//   type: 'GET',
//   url: 'https://graph.facebook.com/v13.0/#{gon.instagram_id}?fields=name%2Cmedia.limit(10)%7Bcaption%2Clike_count%2Cmedia_url%2Cpermalink%2Cthumbnail_url%7D&access_token=#{gon.instagram_access_token}',
//   dataType: 'json',
//   success: function(json) {
//       var ig = json.media.data;
//       var html = "";
//       for (var i = 0; i < ig.length; i++) {
//           var link = ig[i].permalink;
//           var image = ig[i].media_url;
//           html += '<div><a href="' + link + '" target="_blank"><img src="' + image + '"></a></div>'
//       }
//       $(".instagram").append(html);
//   }
// });

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
          `<li>
            <a href="${item.permalink}" target="_blank" rel="noopener">
            <img src="${media}">

          </li>`;
        }

      })
    });
  $('#insta').html(`<ul>${list}</ul>`);
  }).fail(function(jqXHR, status) {
    $('#insta').html('<p>読み込みに失敗しました。</p>');
  });
});
