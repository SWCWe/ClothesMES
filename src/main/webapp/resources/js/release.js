/** 출고 정보 검색 기능 **/
/** $('#release_search').on("click", function() {
	var r_date = $("#r_date").val();
	var name = $("#name").val();
	var prod_code = $("#prod_code").val();
	var order_seq = $("#order_seq").val();
	
	var releaseQuery = "select r.r_seq, r.prod_code, r.r_date, r.r_cnt, r.order_seq, r.prod_rack, m.name from t_release r, t_member m where r.emp_no = m.emp_no"
	if (r_date != null) {
		releaseQuery += "and r.r_date = " + r_date;
	}
	if (name != null) {
		releaseQuery += "and m.name = " + name;
	}
	if (prod_code != null) {
		releaseQuery += "and r.prod_code = " + prod_code;
	}
	if (order_seq != null) {
		releaseQuery += "and r.order_seq = " + order_seq;
	}


	$.ajax({
		url : "searchRelease.do",
		type : "POST",
		data : {"releaseQuery" : releaseQuery},
		dataType : "String",
		success : searchReleaseResult,
		error : function(e){
			console.log(e);
		}
	});
} **/

/** 검색한 내용 보여주는 기능 **/
function searchReleaseResult(data) {
	console.log(data);



