$(document).on('turbolinks:load', function(){
  var mySwiper = new Swiper('.swiper-container', {
	effect: 'fade',
  speed: 1000,
  loop: true,
	autoplay: {
		delay: 7000,
		stopOnLastSlide: false,
		disableOnInteraction: false,
		reverseDirection: false
	},
	navigation: {
		nextEl: '.swiper-button-next',
		prevEl: '.swiper-button-prev'
	},
	pagination: {
		el: '.swiper-pagination',
		type: 'bullets',
		clickable: true
	}
});
});
