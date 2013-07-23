$(function(){

	// defines function for newUser button
	$('#newUser').on('click',function(evt){
		
		// when password field is hidden execute this
		if($(this).hasClass("passwordHidden")){
			// shows the password field, button, and label
			$('#inputPassword').fadeIn(300);
			$('#passwordLabel').fadeIn(300);
			$('#showPassword').fadeIn(300);
			// hides the sign up instructions
			$('#signUpInfo').fadeOut(300);
			// changes text on the button
			$(this).html('Click Here to Sign Up')
			// removes class
			$(this).removeClass("passwordHidden");
			
		}
		// when the password field is there
		else{
			// hides password field, button and label
			$('#inputPassword').fadeOut(300);
			$('#passwordLabel').fadeOut(300);
			$('#showPassword').fadeOut(300);
			// adds sign up instructions
			$('#signUpInfo').fadeIn(300);
			//changes button text
			$(this).html('Click Here to Log In')
			// adds class
			$(this).addClass("passwordHidden")
			
		}
		return false;
	});
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