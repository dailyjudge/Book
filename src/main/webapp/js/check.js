function call() {
	let name = document.myForm.name;
	let id = document.myForm.id;
	let pw = document.myForm.pw;
	let pw2 = document.myForm.pw2;

	if (isEmpty(name)) {
		alert('필수 입력란 확인!');
		name.focus();
		name.value = "";
		return false;
	}

	if (lessThan(id, 5) || containKR(id)) {
		alert('ID 입력란 확인!');
		id.focus();
		id.value = "";
		return false;
	}

	if (lessThan(pw, 3) || notContains(pw, "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm" ||
		pw, "1234567890")) {
		alert('비밀번호 양식 확인!');
		pw.focus();
		pw.value = "";
		return false;
	}

	if (notEquals(pw, pw2)) {
		alert('비밀번호 확인 실패');
		pw2.value = "";
		pw2.focus();
		return false;
	}

	return true;
}

function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('chk');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}

function winopen(){
	if(document.myForm.id.value =="" || document.myForm.id.value.length < 0){
		alert("아이디를 먼저 입력해주세요")
		document.myForm.id.focus();
	}else{
		window.open("jsp/lhg/joinIdCheck.jsp?id="+document.myForm.id.value,"","width=500, height=300");
	}
}

function chkPw() {
	let pw = document.myForm.pw;
	let pw2 = document.myForm.pw2;
	let pwConfirm = document.getElementById("pwConfirm");
	pw2.addEventListener("keyup", function() {
		pw = document.myForm.pw;
		pw2 = document.myForm.pw2;
		if (pw.value != pw2.value) {
			pwConfirm.style.display = "block";
			pwConfirm.innerText = "비밀번호 불일치";
		} else {
			pwConfirm.innerText = "비밀번호 일치";
		}
	});
}
