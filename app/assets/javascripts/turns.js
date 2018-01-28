$(document).ready(() => {
  $(function(){
    // always pass csrf tokens on ajax calls
    $.ajaxSetup({
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
    });
  });

  var button = $('#submit-name-button');
  var input = $('.input-player-name');

  input.on('keyup', (event) => handleInput(event));

  var handleInput = (event) => {
    button.prop('disabled', event.target.value === "");
  }
  
  button.on('click', () => handleAjaxRequest());

  var buildData = () => {
    var value = input.val();
    return { value };
  }

  var sendAjaxRequest = (data) => {
    $.post(`${document.URL}/update_user_name`, data)
      .done(() => window.location.reload());
  }

  var handleAjaxRequest = () => {
    var data = buildData();
    sendAjaxRequest(data);
  }
});