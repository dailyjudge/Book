function idCheck() {
	let name = document.findId.name;
	let email = document.findId.email;

	if (lessThan(name, 1)) {
		alert('이름을 입력해주세요');
		name.focus();
		return false;
	}

	if (lessThan(email, 1)) {
		alert('이메일을 입력해주세요');
		email.focus();
		return false;
	}
	
	if(!CheckEmail(email.value)){
		alert('이메일 형식이 잘못되었습니다');
		email.focus();
		return false;
	}

	return true;
}

function pwCheck() {
	let id = document.findPw.id;
	let email = document.findPw.email;

	if (lessThan(id, 1)) {
		alert('아이디를 입력해주세요');
		id.focus();
		return false;
	}

	if (lessThan(email, 1)) {
		alert('이메일을 입력해주세요');
		email.focus();
		return false;
	}
	
	if(!CheckEmail(email.value)){
		alert('이메일 형식이 잘못되었습니다');
		email.focus();
		return false;
	}

	return true;
}

function CheckEmail(str){
	let reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	
	if(!reg_email.test(str)){
		return false;
	} else{
		return true;
	}
}