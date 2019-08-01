$(document).on('turbolinks:load', function () {
  $("#item_price").keyup(function(){
    var price = $("#item_price").val() * 1;
    var str = $(this).val();
    var tax = Math.floor(str * 0.1)
    if (price >= 300 && price <= 9999999) {
      $('.margin-right').text("¥" + tax);
      var total = str - tax
      $('.income-right').text("¥" + total);
    } else {
      $('.margin-right').text("-");
      $('.income-right').text("-");
    }
  });
});