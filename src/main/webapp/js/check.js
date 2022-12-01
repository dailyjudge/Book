function call() {
	let name = document.myForm.name;
	let id = document.myForm.id;
	let pw = document.myForm.pw;
	let pw2 = document.myForm.pw2;
	let email = document.myForm.email;

	if (isEmpty(id)) {
		alert("아이디를 입력해주세요!");
		id.focus();
		id.value = "";
		return false;
	}

	if (!chkID(id.value)) {
		alert("아이디 형식을 확인해주세요!");
		id.focus();
		id.value = "";
		return false;
	}

	if (isEmpty(pw)) {
		alert("비밀번호를 입력해주세요!");
		pw.focus();
		pw.value = "";
		return false;
	}

	if (!chkPW(pw.value)) {
		alert("비밀번호 형식을 확인해주세요!");
		pw.focus();
		pw.value = "";
		return false;
	}

	if (notEquals(pw, pw2)) {
		alert("비밀번호 확인 실패");
		pw2.value = "";
		pw2.focus();
		return false;
	}

	if (isEmpty(name)) {
		alert("이름을 입력해주세요!");
		name.focus();
		name.value = "";
		return false;
	}

	if (isEmpty(email)) {
		alert("이메일을 입력해주세요!");
		email.focus();
		email.value = "";
		return false;
	}

	if (!checkEmail(email.value)) {
		alert("이메일 형식이 잘못되었습니다");
		email.focus();
		email.value = "";
		return false;
	}

	return true;
}

function checkEmail(str) {
	let reg_email =
		/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

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

function chkPW(str) {
	let reg_pw = /^(?=.*[a-zA-Z])(?=.*[0-9]).{3,}$/;

	if (!reg_pw.test(str)) {
		return false;
	} else {
		return true;
	}
}

function loginCheck() {
	let id = document.myForm.id;
	let pw = document.myForm.pw;

	if (isEmpty(id)) {
		alert('아이디를 입력해주세요');
		id.focus();
		return false;
	}
	if (isEmpty(pw)) {
		alert('비밀번호를 입력해주세요');
		pw.focus();
		return false;
	} return true;
}

$(function () {
  $("#pw").keyup(function () {
    $("#pwConfirm").html("");
    
    if(($('#pw').val() != "" && ($("#pw2").val() == "")) || ($('#pw').val() == "" && ($("#pw2").val() != ""))) {
	  $("#user-update-button").attr("disabled", true);
      $("#user-update-button").css("background-color", "red");
	}
    
    // 두 input 값이 없을 경우 다시 사용 가능하도록
    if($("#pw").val() == "" && ($("#pw2").val() == "")) {
	  $("#user-update-button").attr("disabled", false);
      $("#user-update-button").css("background-color", "#00541A");
	}
	
  });
	
  $("#pw2").keyup(function () {
    if ($("#pw").val() != $("#pw2").val()) {
      $("#user-update-button").attr("disabled", true);
      $("#user-update-button").css("background-color", "red");
      
      $("#pwConfirm").html("비밀번호 일치하지 않음<br><br>");
      $("#pwConfirm").attr("color", "red");
    } else {
      $("#pwConfirm").html("비밀번호 일치함<br><br>");
      $("#pwConfirm").attr("color", "green");
      
      $("#user-update-button").attr("disabled", false);
      $("#user-update-button").css("background-color", "#00541A");
    }
  });
});
