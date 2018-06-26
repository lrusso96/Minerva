

function getFields(){
	$('document').ready(function(){
		$('#paper_title').on('keyup', function(){

			var title_tf = $('#paper_title'),
			title_preview = document.getElementById('title-preview');

			if(title_tf.val() != "")
				title_preview.innerHTML = title_tf.val();
			else
				title_preview.innerHTML= title_tf.attr('placeholder');
		});

		$('#paper_field').on('keyup', function(){

			var field_tf = $('#paper_field'),
			field_preview = document.getElementById('field-preview');

			if(field_tf.val() != "")
				field_preview.innerHTML = field_tf.val();
			else
				field_preview.innerHTML= field_tf.attr('placeholder');
		});

		$('#paper_description').on('keyup', function(){

			var description_tf = $('#paper_description'),
			description_preview = document.getElementById('description-preview');

			if(description_tf.val() != ""){
				if(description_tf.val().length > 100)
					description_preview.innerHTML = description_tf.val().substring(0,101).concat('...');
				else
					description_preview.innerHTML = description_tf.val();
			}
			else
				description_preview.innerHTML= description_tf.attr('placeholder');
		});

	});
}

function setHeaderColor(){
	$('document').ready(function(){
		var view_elem = document.getElementById('paper-preview').getElementsByClassName('view')[0];
		
		$('#bc1').on('click', function(){
			view_elem.style.backgroundImage = 'linear-gradient(to right bottom, #4a09c6, #7955da, #a58eea, #d0c6f7, #ffffff)';
			document.getElementById('bc1').style.border = '1.5px solid #000000';
			document.getElementById('bc2').style.border = '1.5px solid #ffffff';
			document.getElementById('bc3').style.border = '1.5px solid #ffffff';
			document.getElementById('bc4').style.border = '1.5px solid #ffffff';
		});

		$('#bc2').on('click', function(){
			view_elem.style.backgroundImage = 'radial-gradient(circle, #f67320, #ff8687, #ffafd2, #fbdbfa, #ffffff)';
			document.getElementById('bc1').style.border = '1.5px solid #ffffff';
			document.getElementById('bc2').style.border = '1.5px solid #000000';
			document.getElementById('bc3').style.border = '1.5px solid #ffffff';
			document.getElementById('bc4').style.border = '1.5px solid #ffffff';
		});

		$('#bc3').on('click', function(){
			view_elem.style.backgroundImage = 'linear-gradient(to right top, #f00000, #ff507b, #ff95cd, #f5d0f8, #ffffff)';
			document.getElementById('bc1').style.border = '1.5px solid #ffffff';
			document.getElementById('bc2').style.border = '1.5px solid #ffffff';
			document.getElementById('bc3').style.border = '1.5px solid #000000';
			document.getElementById('bc4').style.border = '1.5px solid #ffffff';
		});

		$('#bc4').on('click', function(){
			view_elem.style.backgroundImage = 'linear-gradient(to bottom, #000000, #3b3b3b, #777777, #b9b9b9, #ffffff)';
			document.getElementById('bc1').style.border = '1.5px solid #ffffff';
			document.getElementById('bc2').style.border = '1.5px solid #ffffff';
			document.getElementById('bc3').style.border = '1.5px solid #ffffff';
			document.getElementById('bc4').style.border = '1.5px solid #000000';
		});
	});
}