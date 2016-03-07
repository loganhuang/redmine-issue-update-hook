$(window).load(function(){

	load_settings();
	
	$('.chosen-select').chosen({
		width: '100%'
	});

	$('form').submit(function() {
		var selectedValues = [];    
    		$("#projects :selected").each(function(){
        		selectedValues.push($(this).val()); 
    		});
		$("#settings_notification_projects").val(selectedValues.join(", "));
	});
});

function load_settings() {
	var old_value = $("#settings_notification_projects").val();
	var array = $.map(old_value.split(","), $.trim);

	$("#projects option").each(function( index, element) {
		if ($.inArray(""+$(element).val(), array) != -1) {
			$(element).prop('selected', 'selected');
		}
	});
}
