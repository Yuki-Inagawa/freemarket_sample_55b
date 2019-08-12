document.addEventListener(
  "DOMContentLoaded", e => {
    let modal_open = document.getElementById("modal-open-btn");
    modal_open.onclick = function () {
      $('#overlay').fadeIn();
      $('.titan').fadeIn();
      document.getElementById('modal-close-btn').onclick = function () {
        $('#overlay').fadeOut();
        $('#overlay').remove();
      };
    };
  },
  false
);
