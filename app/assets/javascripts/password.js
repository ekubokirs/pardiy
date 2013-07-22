$(function(){
	var MIN_STRENGTH = 3;

	$('#userpassword').on('keyup', function(evt){
		var s = zxcvbn($(this).val());

		 $('#strength-meter')
      .removeClass('w-0')
      .removeClass('w-1')
      .removeClass('w-2')
      .removeClass('w-3')
      .removeClass('w-4')
      .addClass('w-' + s.score);

      $('#time-to-crack').html(s.crack_time_display);

      $('#hidden-strength').val(s.score);

      if (s.score >= MIN_STRENGTH){
      	$('#save_password').removeClass('disabled');
      }
      else{
      	$('#save-password').addClass('disabled');
      }
	});
	$('#new_user').on('submit', function(){
		if ($('hidden-strength').val() < MIN_STRENGTH){
			return false;
		}
	});
});