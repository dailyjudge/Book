function search() {
	let name = document.idfindscreen.name;
	let email = document.idfindscreen.email;
	let regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/';
	
	if (lessThan(name, 1)) {
		alert("이름을 입력해주세요");
		name.focus();
		name.value = "";
		return false;
	}

	if (lessThan(email, 1)) {
		alert("이메일을 입력해주세요");
		email.focus();
		email.value = "";
		return false;
	}

	if (notEquals(regExp, email)) {
		alert('올바른 email을 입력해주세요.');
		email.focus();
		return false;
	}
	
	return true;
}