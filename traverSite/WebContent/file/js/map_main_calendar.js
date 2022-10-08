	function removeDa() { // 시작일자 선택 시 종료일자 컨트롤 활성화
		document.getElementById('edate').removeAttribute('disabled');	
	}
	
	function limitDate() { // 종료일자 값 제한
		var sdate = document.getElementById('sdate');
		var edate = document.getElementById('edate');
		var strDate1 = sdate.value;
		var strDate2 = edate.value;
		var arr1 = strDate1.split('-');
		var arr2 = strDate2.split('-');
		var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
		var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
		var diffDay = (dat2 - dat1) / ( 24 * 60 * 60 * 1000);
		
		if ( edate.value < sdate.value ) { // 종료일이 시작일보다 이를 경우
			alert('여행 종료일은 시작일 이후로 입력해주세요');
			edate.value = sdate.value;
		} else if ( diffDay > 9 ) { // 10일 이상일 경우
			alert('트레버 여행 일정은 최대 10일까지 가능합니다.');
			edate.value = dat2.getFullYear() + "-" + dat2.getMonth() + "-" + (dat1.getDate() + 9) ;
		}
	}
	
	function setDay(sdate, edate, target) {	// 선택한 날짜를 계산하여 day(일차) select의 option을 변경
		
		var strDate1 = sdate;
		var strDate2 = edate;
		var arr1 = strDate1.split('-');
		var arr2 = strDate2.split('-');
		var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
		var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
		var diffDay = (dat2 - dat1) / ( 24 * 60 * 60 * 1000);
		
		for (var i = target.options.length -1; i >= 0; i--) {
			target.options[i] = null;
		}	// 기존 day 삭제
		
		if ( sdate != "" && edate != "" ) {
			for ( var i = 0; i < diffDay + 1; i++) {
				target.options[i] = new Option("day" + (i+1) + "", i+1);
			}
			target.options[0].selected = true;
		}
	}
	
	function enterkey(searchKeyword) {
		if (window.event.keyCode == 13) {
			alert(searchKeyword);
			placeSearchChange(searchKeyword);
	    }
	}
