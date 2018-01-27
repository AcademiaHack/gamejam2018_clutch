$(document).ready(function(){
  $('.input-player-name').keyup(function(event){
    var name;
    if(event.which === 13) {
      //SUBMIT THIS!!
      console.log('SUBMIT FORM!');
    } else {
      name = $(this).val();
      if(name) {
        $('.notice-text').removeClass('d-none');
      } else {
        $('.notice-text').addClass('d-none');
      }
    }
  })
  
});