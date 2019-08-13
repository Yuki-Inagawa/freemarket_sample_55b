$(function(){
  $('.global-header__top-form__input').on('keyup', function(){
    var input = $('.global-header__top-form__input').val()
    if(input == "使い方"){
      $(".modal-overlay-ay").fadeIn("slow");
      $(".modal-content-ay").fadeIn("slow");
    }
  });
  $(".modal-overlay-ay").on('click', function(){
    $(".modal-overlay-ay").fadeOut("slow");
    $(".modal-content-ay").fadeOut("slow");
  })
});
