$( document ).on('turbolinks:load', function() {
	$('.summer').ripples({ //波紋をつける要素を指定
		resolution: 700, //波紋が広がる速さ
		dropRadius: 20, //波紋の大きさ
		perturbance: 0.003 //波紋の揺れの量
	});
});