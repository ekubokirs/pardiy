$(function(){
	var MIN_STRENGTH = 3;
  // define action to keyup
	$('#userpassword').on('keyup', function(evt){
	 var s = zxcvbn($(this).val());

    // allow strength-meter to reflect pasword strength
	 $('#strength-meter')
    .removeClass('w-0')
    .removeClass('w-1')
    .removeClass('w-2')
    .removeClass('w-3')
    .removeClass('w-4')
    .addClass('w-' + s.score);

    // alters writing to show time to crack
    $('#time-to-crack').html(s.crack_time_display);

    $('#hidden-strength').val(s.score);

    // doesn't allow password to be saved if Min Strength is not met
    if (s.score >= MIN_STRENGTH){
    	$('#save_password').removeClass('disabled');
    }
    else{
    	$('#save-password').addClass('disabled');
    }
	});

    // doesn't allow page reload if Min Strength is not met
		if ($('hidden-strength').val() < MIN_STRENGTH){
			return false;
		}
});