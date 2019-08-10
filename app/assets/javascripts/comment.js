$(document).on('turbolinks:load', function(){
  function buildHtmlBlue(comment){
    var html = `<div class="balloon">
                  <figure class="balloon-image-left">
                    <img src="/assets/member_photo_noimage_thumb.png" alt="画像名">
                  <figcaption class="balloon-image-description">
                  ${comment.user_nickname}
                  </figcaption>
                  </figure>
                  <div class="balloon-text-right">
                    <p>
                    ${comment.text}
                    </p>
                  </div>
                </div>`
    return html;
  }
  function buildHtmlOrange(comment){
    var html =`<div class="balloon--right">
                <figure class="balloon-image-right">
                  <img src="/assets/member_photo_noimage_thumb.png" alt="画像名">
                <figcaption class="balloon-image-description">
                  ${comment.user_nickname}
                </figcaption>
                </figure>
                <div class="balloon-text-left">
                  <p>
                  ${comment.text}
                  </p>
                </div>
              </div>`
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var comment = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: comment,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      if (data.current_user_id === data.item_id){
        var html = buildHtmlBlue(data);
        $('.item__comment--box').append(html);
        $('#new_comment')[0].reset();
      } else {
        var html = buildHtmlOrange(data);
        $('.item__comment--box').append(html);
        $('#new_comment')[0].reset();
      }
    })
    .fail(function(data){
      alert('コメント送信エラー');
    })
    .always(function(data){
      $('.item-message__container__content__form__submit-btn').prop("disabled", false);
    })
  })
});