function check_uncheck_all(all_selector, check_boxes){
	$(all_selector).change(function(){
		ths = $(this)
		$(check_boxes).each(function(i,v){
			if(ths.is(":checked")){
				this.checked = true;
			}else{
				this.checked = false;
			}

		})
	})
}