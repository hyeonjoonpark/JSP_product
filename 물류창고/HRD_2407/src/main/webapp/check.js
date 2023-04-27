function check() {
	if(document.frm.p_code.value.length == 0){
		alert("제품코드를 입력헤주세요");
		frm.p_code.focus();
		return false;
	}
	
	if(document.frm.t_type.value.length == 0){
		alert("입출고구분을 입력헤주세요");
		frm.t_type.focus();
		return false;
	}
	
	if(document.frm.t_cnt.value.length == 0){
		alert("수량을 입력헤주세요");
		frm.t_cnt.focus();
		return false;
	}
	
	if(document.frm.t_date.value.length == 0){
		alert("거래일자 입력헤주세요");
		frm.date.focus();
		return false;
	}
	
	if(document.frm.c_code.value.length == 0){
		alert("거래처를 입력헤주세요");
		frm.c_code.focus();
		return false;
	}
	
	alert("완료");
	return true;
}
