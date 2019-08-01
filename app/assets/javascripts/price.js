$(document).on('turbolinks:load', function () {
  $("#item_price").keyup(function(){
    var str = $(this).val();
    var tax = Math.floor(str * 0.1)
    $('.margin-right').text("¥" + tax);
    var total = str - tax
    var num = String(total).replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
    $('.income-right').text("¥" + num);
  });
});