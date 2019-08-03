$(function(){
  $(document).on('click','#token_submit', function(e) {
    e.preventDefault();
    Payjp.setPublicKey('pk_test_108a697aae6e6d3ec73f365d');
    var card = {
      number: parseInt($("#card_number").val()),
      cvc: parseInt($("#cvc").val()),
      exp_month: parseInt($("#exp_month").val()),
      exp_year: parseInt($("#exp_year").val())
    };
    Payjp.createToken(card, function(status, response) {
      if (status == 200) {
        var token = response.id;
        console.log("OK")
        $.ajax({
          url: "/signup",
          type: "POST",
          data: { token: token },
          dataType: 'json',
        })
        .done(function(){
          //非同期通信失敗時の処理
        })
        .fail(function(){
          //非同期通信失敗時の処理
        })
      }
      else {
        //トークン作成失敗時の処理
      }
    });
  })
})