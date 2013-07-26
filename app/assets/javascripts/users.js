$('#toggle-password').on('click', function(evt){
		
		// defines color and text depending on current state of button
		if ($(this).hasClass('alert')){
			$(this).html('Hide Password');

			$(this).removeClass('alert');
			$(this).addClass('success');

			// shows password text
			$('#user_password').attr('type','text')
		}

		else{

			$(this).html('Show Password');

 			// makes button red instead of green
			$(this).removeClass('success');
			$(this).addClass('alert');

			// hides password text
			$('#user_password').attr('type','password')
		}
	
		return false;
	});