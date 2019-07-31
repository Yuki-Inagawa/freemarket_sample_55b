$(document).on('turbolinks:load', function () {
  $('.exhibition').submit(function() {
  // $(".sell-item-btn").submit(function() {

    var name_box_val = $('.name_box_val').val();
    // var state_select_val = $('[name="item[state]"]').val();
    // var postage_type_select_val = $('[name="item[postage_type]"]').val();
    // var delivery_method_select_val = $('[name="item[delivery_method]"]').val();
    // var region_select_val = $('[name="item[region]"]').val();
    // var shopping_date_select_val = $('[name="item[shopping_date]"]').val();
    // var price_val = $('[name="product[price]"]').val();


    if (name_box_val == "") {
      $('.error_message.type1').text("入力してください");
    };

    // if (state_select_val == "") {
    //   $('.error_message.type2').text("選択してください");
    // } 
    // if (postage_type_select_val == "") {
    //   $('.error_message.type3').text("選択してください");
    // } 
    // if (delivery_method_select_val == "") {
    //   $('.error_message.type4').text("選択してください");
    // } 
    // if (region_select_val == "") {
    //   $('.error_message.type5').text("選択してください");
    // } 
    // if (shopping_date_select_val == "") {
    //   $('.error_message.type6').text("選択してください");
    // } 
    // if (price_val == "") {
    //   $('.error_message.type7').text("300以上9999999以下で入力してください");
    // }
    if (name_box_val == "") {
      return false;
    } 
    $('.exhibition').submit();

  });
});