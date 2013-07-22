$(function(){
	$('#toggle-password-field').on('click', function(evt){
		if ($(this).hasClass('alert')){
			$(this).html('Hide Password');

			$(this).removeClass('alert');
			$(this).addClass('success');

			$('#inputPassword').attr('type','text')
		}

		else{

			$(this).html('Show Password');


			$(this).removeClass('success');
			$(this).addClass('alert');

			$('#inputPassword').attr('type','password')
		}
	
		return false;
	});
})