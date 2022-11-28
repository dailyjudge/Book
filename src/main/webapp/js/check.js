function call() {
	let name = document.myForm.name;
	let id = document.myForm.id;
	let pw = document.myForm.pw;
	let pw2 = document.myForm.pw2;
	let email = document.myForm.email;
	
	if (isEmpty(id)) {
		alert('아이디를 입력해주세요!');
		id.focus();
		id.value = "";
		return false;
	}

	if (!chkID(id.value)) {
		alert('아이디 형식을 확인해주세요!');
		id.focus();
		id.value = "";
		return false;
	}

	if (lessThan(pw, 3)) {
		alert('비밀번호 확인!');
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

	if (isEmpty(name)) {
		alert('이름 입력란 확인!');
		name.focus();
		name.value = "";
		return false;
	}

	if (isEmpty(email)) {
		alert('이메일 입력란 확인!');
		email.focus();
		email.value = "";
		return false;
	}

	if (!CheckEmail(email.value)) {
		alert('이메일 형식이 잘못되었습니다');
		email.focus();
		email.value = "";
		return false;
	}

	return true;
}

function selectAll(selectAll) {
	const checkboxes
		= document.getElementsByName('chk');

	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
}

function CheckEmail(str) {
	let reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

	if (!reg_email.test(str)) {
		return false;
	} else {
		return true;
	}
}

function chkID(str) {
	let reg_id = /^(?=.*[a-zA-Z])(?=.*[0-9]).{5,20}$/;

	if (!reg_id.test(str)) {
		return false;
	} else {
		return true;
	}
}

$(function() {
	$('#pw').keyup(function() {
		$('#pwConfirm').html('');
	});

	$('#pw2').keyup(function() {

		if ($('#pw').val() != $('#pw2').val()) {
			$('#pwConfirm').html('비밀번호 일치하지 않음<br><br>');
			$('#pwConfirm').attr('color', 'red');
		} else {
			$('#pwConfirm').html('비밀번호 일치함<br><br>');
			$('#pwConfirm').attr('color', 'green');
		}

	});
});
