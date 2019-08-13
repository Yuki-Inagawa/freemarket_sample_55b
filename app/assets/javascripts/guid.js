$(function(){
  $('.global-header__top-form').on('submit', function(){
    var input = $('.global-header__top-form__input').val()
    if(input == "使い方"){
      window.location.href = "/";
      
    }

  });
});
