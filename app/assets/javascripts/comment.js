$(document).on('turbolinks:load', function(){
  function buildHTML(comment){
    var html = `<div class="balloon5">
                <div class="faceicon">
                  <img src="/assets/member_photo_noimage_thumb.png">
                </div>
                <div class="chatting">
                  <div class="says">
                    <p>${comment.text}</p>
                  </div>
                  <div class="comment-users--name">
                    <p>${comment.user_nickname}</p>
                  </div>
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
      var html = buildHTML(data);
      $('.item__comment--box').append(html);
      $('#new_comment')[0].reset();
    })
    .fail(function(data){
      alert('コメント送信エラー');
    })
    .always(function(data){
      $('.item-message__container__content__form__submit-btn').prop("disabled", false);
    })
  })
});