$(document).on('turbolinks:load', function(){
  $('.global-header__top-form__input').on('keyup', function(){
    console.log('ok')
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

$(document).on('turbolinks:load', function(){
  $(".buy").animsition({
    inClass: 'fade-in-up',
    outClass: 'flip-out-y',
    inDuration: 1500,
    outDuration: 800,
    linkElement: '.buybuy',
    // e.g. linkElement: 'a:not([target="_blank"]):not([href^="#"])'
    loading: true,
    loadingParentElement: 'body', //animsition wrapper element
    loadingClass: 'animsition-loading',
    loadingInner: '', // e.g '<img src="loading.svg" />'
    timeout: false,
    timeoutCountdown: 5000,
    onLoadEvent: true,
    browser: [ 'animation-duration', '-webkit-animation-duration'],
    // "browser" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
    // The default setting is to disable the "animsition" in a browser that does not support "animation-duration".
    overlay : false,
    overlayClass : 'animsition-overlay-slide',
    overlayParentElement : 'body',
    transition: function(url){ window.location.href = url; }
  });
  $(".sell").animsition({
    inClass: 'fade-in-up',
    outClass: 'flip-out-y',
    inDuration: 1500,
    outDuration: 800,
    linkElement: '.sellsell',
    // e.g. linkElement: 'a:not([target="_blank"]):not([href^="#"])'
    loading: true,
    loadingParentElement: 'body', //animsition wrapper element
    loadingClass: 'animsition-loading',
    loadingInner: '', // e.g '<img src="loading.svg" />'
    timeout: false,
    timeoutCountdown: 5000,
    onLoadEvent: true,
    browser: [ 'animation-duration', '-webkit-animation-duration'],
    // "browser" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
    // The default setting is to disable the "animsition" in a browser that does not support "animation-duration".
    overlay : false,
    overlayClass : 'animsition-overlay-slide',
    overlayParentElement : 'body',
    transition: function(url){ window.location.href = url; }
  });
  $(".siindex").animsition({
    inClass: 'fade-in-up',
    outClass: 'fade-out-up',
    inDuration: 1500,
    outDuration: 800,
    linkElement: '.animsition-link',
    // e.g. linkElement: 'a:not([target="_blank"]):not([href^="#"])'
    loading: true,
    loadingParentElement: 'body', //animsition wrapper element
    loadingClass: 'animsition-loading',
    loadingInner: '', // e.g '<img src="loading.svg" />'
    timeout: false,
    timeoutCountdown: 5000,
    onLoadEvent: true,
    browser: [ 'animation-duration', '-webkit-animation-duration'],
    // "browser" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
    // The default setting is to disable the "animsition" in a browser that does not support "animation-duration".
    overlay : false,
    overlayClass : 'animsition-overlay-slide',
    overlayParentElement : 'body',
    transition: function(url){ window.location.href = url; }
  });
});
