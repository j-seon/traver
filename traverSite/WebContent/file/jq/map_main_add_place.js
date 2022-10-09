// 장소추가 관련 ajax 스크립트

window.addEventListener("load", function() {
	var addBtnList = document.querySelectorAll(".place__add");
	for (var i = 0; i < addBtnList.length; i++) {
		var btn = addBtnList.item(i);

		btn.addEventListener("click", function(event) { // 각 버튼에 클릭 eventListener 추가
			let btn = event.currentTarget; // 이벤트가 발생한 '현재 엘리먼트'을 가져온다
			let piid = btn.getAttribute("value");
			console.log(piid);
			
			let piname = btn.parentElement.parentElement.querySelector('.place__title').innerText;
			console.log(piname);

			$.ajax({
				type : "POST",
				url : "/traverSite/addPlace",
				data : {
					"piid" : piid,
					"piname" : piname
				},
				success : function(v) {
					if (v == 0) {
						console.log("장소 추가 실패");
					}
					location.reload();
				}
			})
		});
	}
})