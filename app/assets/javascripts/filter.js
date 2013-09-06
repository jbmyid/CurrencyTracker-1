function filter(table, input){
	inpt = $(input)
	inpt.keyup(function(){
		$("tr", table).each(function(i,v){
			ths = $(v);
			if($("th", ths).length==0)
			{
				val = $.map($(".filter", ths), function(v,i){
					return($(v).html());
				}).join(" ")
				if(typeof(val)!="undefined" && val.toLowerCase().match(inpt.val().toLowerCase()))
				{	
				  ths.show()
				}
				else{
					ths.hide()
				}
			}
		})
	})
}
