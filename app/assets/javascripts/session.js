$(function(){
	// adds the click function to event
	$('#toggle-password-field').on('click', function(evt){
		
		// defines color and text depending on current state of button
		if ($(this).hasClass('alert')){
			$(this).html('Hide Password');

			$(this).removeClass('alert');
			$(this).addClass('success');

			// shows password text
			$('#inputPassword').attr('type','text')
		}

		else{

			$(this).html('Show Password');

 			// makes button red instead of green
			$(this).removeClass('success');
			$(this).addClass('alert');

			// hides password text
			$('#inputPassword').attr('type','password')
		}
	
		return false;
	});
})