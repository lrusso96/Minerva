
var sidebar_on = 0;

function toggle() {
	$('document').ready(function(){
		$('#sidebarCollapse').on('click', function(){
			if(sidebar_on == 0){
				$(this).html('<i class="fas fa-times"></i>');
				$('#sidebar').removeClass('active');
				$('.overlay').addClass('active');
				sidebar_on = 1;
			}else{
				$(this).html('<i class="fas fa-align-justify"></i>');
				$('#sidebar').addClass('active');
				sidebar_on = 0;
			}
			

		});

		$('.overlay').on('click', function(){
			$('.overlay').removeClass('active');
			$('#sidebar').addClass('active');
			$('#sidebarCollapse').html('<i class="fas fa-align-justify"></i>');
			sidebar_on = 0;
		});
	});
}