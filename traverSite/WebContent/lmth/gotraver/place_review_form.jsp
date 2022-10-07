<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<!-- 리뷰작성 -->
<div class="place_review_box review_add_box display_none">
	<img src="../../file/img/x.png" class="review_x">
	<button class="review_add_back">작성 취소</button>
	<div class="place_review_title_box">
		<button class="place_review_title">리뷰 작성</button>
	</div>
	<div class="review_add_text_box">
		<input type="text" class="review_add_text"/>
	</div>
	<div class="review_add_img_box">
		<img src="" alt="" class="review_add_img" />
		<div class="add_img_title">
			<span>이미지 업로드</span>
			<span class="add_img_content">*이미지 크기는 2MB이하로 해주세요.(등록 가능한 이미지 JPG, PNG, JPEG) 최대 4장 입니다.</span>
		</div>
		<div class="add_img_option">
			<input type="text" readonly/>
			<button>이미지 선택</button>
			<button>추가</button>
			<button>삭제</button>
		</div>
		<img src="" alt="" class="review_add_img" />
		<div class="add_img_option">
			<input type="text" readonly/>
			<button>이미지 선택</button>
		</div>
		<img src="" alt="" class="review_add_img" />
		<div class="add_img_option">
			<input type="text" readonly/>
			<button>이미지 선택</button>
		</div>
		<img src="" alt="" class="review_add_img" />
		<div class="add_img_option">
			<input type="text" readonly/>
			<button>이미지 선택</button>
		</div>
	</div>
	<div class="result">
		<button>등록</button>
	</div>
</div>