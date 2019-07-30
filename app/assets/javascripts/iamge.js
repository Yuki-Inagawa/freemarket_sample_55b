$( document ).on('turbolinks:load', function() {
  var dropzone = $(".item__img__dropzone__input");
  var dropzone2 = $(".item__img__dropzone2__input2");
  var appendzone = $(".item__img__dropzone2")
  var input_area = $(".input-area");
  var preview = $("#preview");
  var preview2 = $("#preview2");

  // 新規追加画像を格納する配列（ビュー用）
  var images = [];
  // 新規追加画像を格納する配列（DB用）
  var new_image_files = [];
  $("#new_item .item__img__dropzone, #new_item .item__img__dropzone2").on("change", 'input[type= "file"].upload-image', function() {

    var file = $(this).prop("files")[0];
    new_image_files.push(file)
    var reader = new FileReader();

    var img = $(`<div class= "add_img"><div class="img_area"><img class="image"></div></div>`);

    var btn_wrapper = $('<div class="btn_wrapper"><a class="btn_edit">編集</a><a class="btn_delete">削除</a></div>');

    // 画像に編集・削除ボタンをつける
    img.append(btn_wrapper);

    reader.onload = function(e) {
      img.find("img").attr({
        src: e.target.result
      });
    };
});