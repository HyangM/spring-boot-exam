	function player(teamid){	
		$('.player').remove();	
		$('.detail').remove();
		
		tplayer.style.visibility="visible";
		tdetail.style.visibility="hidden";

		$.ajax({
			type:'GET',
			url:'/baseball/player/'+teamid,
			dataType:'json'	
		}).done(function(result){
			for(var i of result){
				 
				let item_el = `<tr class='player'><td><a href='javascript:void(0)'onclick='tp(${teamid},${i.id})'>${i.name}</a></td></tr>`;
	
				$('#player').after(item_el);
			}
			
		}).fail(function(result){
	
		});		
	}

	function tp(teamid, userid){
		$('.detail').remove();
		
		tdetail.style.visibility="visible";
		$.ajax({
			type:'GET',
			url:'/baseball/tp/'+teamid+'/'+userid,
			dataType:'json'	
		}).done(function(result){
				let item_el = `<tr class='detail'><td>${result.name},${result.teamname}</td></tr>`;
	
				$('#detail').after(item_el);
			
		}).fail(function(result){
	
		});		
		
	}