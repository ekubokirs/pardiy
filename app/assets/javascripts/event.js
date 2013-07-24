$('.supplyblockadd').click(function(){
		var html =$('.supplyblock').first().clone();
 			html.css('display','none');
 		$(this).before(html);
 			html.slideDown(600);
			html.find('input').val('');
		return false;
	});
$('.projectblockadd').click(function(){
		var html =$('.projectblock').first().clone();
 			html.css('display','none');
 		$(this).before(html);
 			html.slideDown(600);
			html.find('input').val('');
		return false;
	});