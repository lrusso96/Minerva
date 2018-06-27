

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
		$('.materialbc').click(function(e){
  			view_elem.style.backgroundColor = $(this).css('backgroundColor');
        document.getElementById("hiddenId").value = $(this).css('backgroundColor');
      });
    });
}
