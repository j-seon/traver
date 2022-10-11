	function limitDate() { // 시작일자 선택 시 종료일자 컨트롤 활성화
		var sdate = document.getElementById('sdate');
		var edate = document.getElementById('edate');
		var strDate1 = sdate.value;
		var arr1 = strDate1.split('-');
		var dat1 = new Date(arr1[0], arr1[1] - 1, arr1[2]);
		edate.setAttribute("min", dat1.toLocaleString().substring(0,12).replaceAll(". ","-").replace(".",""));
		var dat2 = new Date(dat1.setDate(dat1.getDate()+9));
		edate.removeAttribute('disabled');	
		dat1.setDate(dat1.getDate()+9);
		var fullDate = dat2.toLocaleString().substring(0,12).replaceAll(". ","-").replace(".","");
		var date = fullDate.substring(8);
		if ( date < 10 ) { date = "0" + date }
 		edate.setAttribute("max", fullDate.substring(0,8) + date);
	}
	
	
	function setDay(sdate, edate, target) {	// 선택한 날짜를 계산하여 day(일차) select의 option을 변경
		
		var strDate1 = sdate;
		var strDate2 = edate;
		var arr1 = strDate1.split('-');
		var arr2 = strDate2.split('-');
		var dat1 = new Date(arr1[0], arr1[1] - 1, arr1[2]);
		var dat2 = new Date(arr2[0], arr2[1] - 1, arr2[2]);
		var diffDay = (dat2 - dat1) / ( 24 * 60 * 60 * 1000);
		
		
		for (var i = target.options.length -1; i > 0; i--) {
			target.options[i] = null;
		}	// 기존 day 삭제
		
		if ( sdate != "" && edate != "" ) {
			for ( var i = 1; i < diffDay + 2; i++) {
				target.options[i] = new Option("day" + i, i);
			}
			target.options[0].selected = true;
		}
	}
	
	