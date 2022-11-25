function delete_account(id) {
	// 계정의 아이디??
	console.log(id);
	
	if(confirm("회원 탈퇴를 하면 복구가 어렵습니다.\n정말 탈퇴하시겠습니까?")) {
		location.href=`Account_delete_controller?id=${id}`;
	}
}