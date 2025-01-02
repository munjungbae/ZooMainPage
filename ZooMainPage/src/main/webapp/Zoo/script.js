


function loginWindow() {
	var left = Math.ceil((window.screen.width - 450) / 2);
	var top = Math.ceil((window.screen.height - 450) / 2);

	url = "../Zoo/login/login.jsp";
	window.open(url, ' ', 'width=' + 450 + ',height=' + 360 + ',left=' + left + ',top=' + top + ',scrollbars=no,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no');
}
function registerWindow() {
	self.close();
	var left = Math.ceil((window.screen.width - 500) / 2);
	var top = Math.ceil((window.screen.height - 450) / 2);

	url = "../login/register.jsp";
	window.open(url, '_blank', 'width=' + 519 + ',height=' + 620 + ',left=' + left + ',top=' + top);
}

function idCheck() {
	let input = document.register.idText;
	let value = document.register.id.value;
	if (value === "") {
		input.nextSibling.textContent = `아이디를 입력 해 주세요`;
		input.nextSibling.style.fontSize = `13px`;
		input.nextSibling.style.display = `flex`;
		input.nextSibling.style.position = `relative`;
		input.nextSibling.style.right = ``;
		input.nextSibling.style.opacity = `0.6`;
		document.register.id.focus();
	} else {
		input.nextSibling.textContent = ``;
		url = "idCheck.jsp?id=" + value;
		window.open(url, "post", "width=500,height=500");
	}
}

function trueValue() {
	let input = opener.document.register.idText;
	input.nextSibling.textContent = `중복되는 아이디 입니다.`;
	input.nextSibling.style.fontSize = `13px`;
	input.nextSibling.style.display = `flex`;
	input.nextSibling.style.position = `relative`;
	input.nextSibling.style.right = ``;
	input.nextSibling.style.opacity = `0.6`;
}

function falseValue() {
	let input = opener.document.register.idText;
	input.nextSibling.textContent = `사용 가능한 아이디 입니다.`;
	input.nextSibling.style.fontSize = `13px`;
	input.nextSibling.style.display = `flex`;
	input.nextSibling.style.position = `relative`;
	input.nextSibling.style.right = ``;
	input.nextSibling.style.opacity = `0.6`;
}

/*주소찾기 버튼을 눌렀을 때 zipCheck.jsp를 새 윈도우 창으로 열어주는 함수*/
function zipCheck() {
	var left = Math.ceil((window.screen.width - 750) / 2);
	var top = Math.ceil((window.screen.height - 650) / 2);
	url = "zipCheck.jsp?check=y";
	window.open(url, "post", 'width=' + 450 + ',height=' + 350 + ',left=' + left + ',top=' + top + 'directories=no,status=yes,scrollbars=yes,menubar=no');
}
function zipCheckMy() {
	var left = Math.ceil((window.screen.width - 750) / 2);
	var top = Math.ceil((window.screen.height - 650) / 2);
	url = "./login/zipCheck.jsp?check=y";
	window.open(url, "post", 'width=' + 450 + ',height=' + 350 + ',left=' + left + ',top=' + top + 'directories=no,status=yes,scrollbars=yes,menubar=no');
}

function dongCheck() {
	let value = document.zipForm.dong.value;
	if (value === "") {
		alert("동 이름을 입력해 주세요.");
		document.zipForm.dong.focus();
		return;
	}
	document.zipForm.submit();
}

function sendAddress(zipcode, sido, gugun, dong, bunji) {
	var address = sido + " " + gugun + " " + dong + " " + bunji;
	opener.document.register.zipcode.value = zipcode;
	opener.document.register.address1.value = address;
	self.close();
}

function sendID() {
	opener.location.reload();
	self.close();
}
function passCheck() {
	opener.location.reload();
}




function deleteSave() {
	if (document.delForm.pass.value == '') {
		alert("비밀번호를 입력하십시요.");
		document.delForm.pass.focus();
		return false;
	}
}
function updateSave() {
	if (document.upForm.pass.value == '') {
		alert("비밀번호를 입력하십시요.");
		document.delForm.pass.focus();
		return false;
	}
}



function inputCheck() {

	const eMailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
	let input = document.register.idText;
	let pass = document.register.pass;
	let repass = document.register.repass;
	let name = document.register.name;
	const phone1 = document.register.phone1;
	const phone2 = document.register.phone2;
	const phone3 = document.register.phone3;
	const email = document.register.email;
	const address1 = document.register.address1;
	let address2 = document.register.address2;
	let find = document.register.find;
	let zipcode = document.register.zipcode;

	if (document.register.id.value == "") {
		input.nextSibling.textContent = `아이디를 입력 해 주세요`;
		input.nextSibling.style.fontSize = `13px`;
		input.nextSibling.style.display = `flex`;
		input.nextSibling.style.position = `relative`;
		input.nextSibling.style.right = ``;
		input.nextSibling.style.opacity = `0.6`;
		document.register.id.focus();
		return;
	} else {
		input.nextSibling.textContent = ``;
	}

	if (pass.value == "") {
		pass.nextSibling.textContent = `비밀번호를 입력 해 주세요`;
		pass.nextSibling.style.fontSize = `13px`;
		pass.nextSibling.style.display = `flex`;
		pass.nextSibling.style.position = `relative`;
		pass.nextSibling.style.right = ``;
		pass.nextSibling.style.opacity = `0.6`;
		pass.focus();
		return;
	} else {
		pass.nextSibling.textContent = ``;
	}

	if (repass.value == "") {
		repass.nextSibling.textContent = `비밀번호를 입력 해 주세요.`;
		repass.nextSibling.style.fontSize = `13px`;
		repass.nextSibling.style.display = `flex`;
		repass.nextSibling.style.position = `relative`;
		repass.nextSibling.style.right = ``;
		repass.nextSibling.style.opacity = `0.6`;
		repass.focus();
		return;
	} else {
		repass.nextSibling.textContent = ``;
	}
	if (pass.value != repass.value) {
		repass.nextSibling.textContent = `비밀번호가 일치하지 않습니다.`;
		repass.nextSibling.style.fontSize = `13px`;
		repass.nextSibling.style.display = `flex`;
		repass.nextSibling.style.position = `relative`;
		repass.nextSibling.style.right = ``;
		repass.nextSibling.style.opacity = `0.6`;
		repass.focus();
		return;
	} else {
		repass.nextSibling.textContent = ``;
	}

	if (name.value == "") {
		name.nextSibling.textContent = `이름을 입력 해 주세요.`;
		name.nextSibling.style.fontSize = `13px`;
		name.nextSibling.style.display = `flex`;
		name.nextSibling.style.position = `relative`;
		name.nextSibling.style.right = ``;
		name.nextSibling.style.opacity = `0.6`;
		document.register.name.focus();
		return;
	} else {
		name.nextSibling.textContent = ``;
	}

	if (phone1.value == "") {
		phone3.nextSibling.textContent = `필수 입력란 입니다.`;
		phone3.nextSibling.style.fontSize = `13px`;
		phone3.nextSibling.style.display = `flex`;
		phone3.nextSibling.style.position = `relative`;
		phone3.nextSibling.style.right = ``;
		phone3.nextSibling.style.opacity = `0.6`;
		return;
	} else {
		phone3.nextSibling.textContent = ``;
	}

	if (phone2.value == "") {
		phone3.nextSibling.textContent = `필수 입력란 입니다.`;
		phone3.nextSibling.style.fontSize = `13px`;
		phone3.nextSibling.style.display = `flex`;
		phone3.nextSibling.style.position = `relative`;
		phone3.nextSibling.style.right = ``;
		phone3.nextSibling.style.opacity = `0.6`;
		phone2.focus();
		return;
	} else {
		phone3.nextSibling.textContent = ``;
	}

	if (phone3.value == "") {
		phone3.nextSibling.textContent = `필수 입력란 입니다.`;
		phone3.nextSibling.style.fontSize = `13px`;
		phone3.nextSibling.style.display = `flex`;
		phone3.nextSibling.style.position = `relative`;
		phone3.nextSibling.style.right = ``;
		phone3.nextSibling.style.opacity = `0.6`;
		phone3.focus();
		return;
	} else {
		phone3.nextSibling.textContent = ``;
	}

	if (email.value == "") {
		email.nextSibling.textContent = `이메일을 입력 해 주세요.`;
		email.nextSibling.style.fontSize = `13px`;
		email.nextSibling.style.display = `flex`;
		email.nextSibling.style.position = `relative`;
		email.nextSibling.style.right = ``;
		email.nextSibling.style.opacity = `0.6`;
		email.focus();
		return;
	} else {
		email.nextSibling.textContent = ``;
	}

	if (eMailPattern.test(email.value) === false) {
		email.nextSibling.textContent = `이메일 주소 형식이 잘못되었습니다.\n\r다시 입력 바랍니다.`;
		email.nextSibling.style.fontSize = `13px`;
		email.nextSibling.style.display = `flex`;
		email.nextSibling.style.position = `relative`;
		email.nextSibling.style.right = ``;
		email.nextSibling.style.opacity = `0.6`;
		email.focus();
		return;
	} else {
		email.nextSibling.textContent = ``;
	}

	if (zipcode.value == "") {
		find.nextSibling.textContent = `필수 입력란 입니다.`;
		find.nextSibling.style.fontSize = `13px`;
		find.nextSibling.style.display = `flex`;
		find.nextSibling.style.position = `relative`;
		find.nextSibling.style.right = ``;
		find.nextSibling.style.opacity = `0.6`;
		find.focus();
		return;
	} else {
		find.nextSibling.textContent = ``;
	}

	if (address1.value == "") {
		address1.nextSibling.textContent = `주소를 입력해 주세요.`;
		address1.nextSibling.style.fontSize = `13px`;
		address1.nextSibling.style.display = `flex`;
		address1.nextSibling.style.position = `relative`;
		address1.nextSibling.style.right = ``;
		address1.nextSibling.style.opacity = `0.6`;
		address1.focus();
		return;
	} else {
		address1.nextSibling.textContent = ``;
	}

	if (address2.value == "") {
		address2.nextSibling.textContent = `세부주소를 입력해 주세요.`;
		address2.nextSibling.style.fontSize = `13px`;
		address2.nextSibling.style.display = `flex`;
		address2.nextSibling.style.position = `relative`;
		address2.nextSibling.style.right = ``;
		address2.nextSibling.style.opacity = `0.6`;
		address2.focus();
		return;
	} else {
		address2.nextSibling.textContent = ``;
	}

	document.register.submit();
}

function myPageinputCheck() {

	const eMailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
	let pass = document.register.pass;
	let repass = document.register.repass;
	let name = document.register.name;
	const phone1 = document.register.phone1;
	const phone2 = document.register.phone2;
	const phone3 = document.register.phone3;
	const email = document.register.email;
	const address1 = document.register.address1;
	let address2 = document.register.address2;
	let find = document.register.find;
	let zipcode = document.register.zipcode;


	if (pass.value == "") {
		pass.nextSibling.textContent = `비밀번호를 입력 해 주세요`;
		pass.nextSibling.style.fontSize = `13px`;
		pass.nextSibling.style.display = `flex`;
		pass.nextSibling.style.position = `relative`;
		pass.nextSibling.style.right = ``;
		pass.nextSibling.style.opacity = `0.6`;
		pass.focus();
		return;
	} else {
		pass.nextSibling.textContent = ``;
	}

	if (repass.value == "") {
		repass.nextSibling.textContent = `비밀번호를 입력 해 주세요.`;
		repass.nextSibling.style.fontSize = `13px`;
		repass.nextSibling.style.display = `flex`;
		repass.nextSibling.style.position = `relative`;
		repass.nextSibling.style.right = ``;
		repass.nextSibling.style.opacity = `0.6`;
		repass.focus();
		return;
	} else {
		repass.nextSibling.textContent = ``;
	}
	if (pass.value != repass.value) {
		repass.nextSibling.textContent = `비밀번호가 일치하지 않습니다.`;
		repass.nextSibling.style.fontSize = `13px`;
		repass.nextSibling.style.display = `flex`;
		repass.nextSibling.style.position = `relative`;
		repass.nextSibling.style.right = ``;
		repass.nextSibling.style.opacity = `0.6`;
		repass.focus();
		return;
	} else {
		repass.nextSibling.textContent = ``;
	}

	if (name.value == "") {
		name.nextSibling.textContent = `이름을 입력 해 주세요.`;
		name.nextSibling.style.fontSize = `13px`;
		name.nextSibling.style.display = `flex`;
		name.nextSibling.style.position = `relative`;
		name.nextSibling.style.right = ``;
		name.nextSibling.style.opacity = `0.6`;
		document.register.name.focus();
		return;
	} else {
		name.nextSibling.textContent = ``;
	}

	if (phone1.value == "") {
		phone3.nextSibling.textContent = `필수 입력란 입니다.`;
		phone3.nextSibling.style.fontSize = `13px`;
		phone3.nextSibling.style.display = `flex`;
		phone3.nextSibling.style.position = `relative`;
		phone3.nextSibling.style.right = ``;
		phone3.nextSibling.style.opacity = `0.6`;
		return;
	} else {
		phone3.nextSibling.textContent = ``;
	}

	if (phone2.value == "") {
		phone3.nextSibling.textContent = `필수 입력란 입니다.`;
		phone3.nextSibling.style.fontSize = `13px`;
		phone3.nextSibling.style.display = `flex`;
		phone3.nextSibling.style.position = `relative`;
		phone3.nextSibling.style.right = ``;
		phone3.nextSibling.style.opacity = `0.6`;
		phone2.focus();
		return;
	} else {
		phone3.nextSibling.textContent = ``;
	}

	if (phone3.value == "") {
		phone3.nextSibling.textContent = `필수 입력란 입니다.`;
		phone3.nextSibling.style.fontSize = `13px`;
		phone3.nextSibling.style.display = `flex`;
		phone3.nextSibling.style.position = `relative`;
		phone3.nextSibling.style.right = ``;
		phone3.nextSibling.style.opacity = `0.6`;
		phone3.focus();
		return;
	} else {
		phone3.nextSibling.textContent = ``;
	}

	if (email.value == "") {
		email.nextSibling.textContent = `이메일을 입력 해 주세요.`;
		email.nextSibling.style.fontSize = `13px`;
		email.nextSibling.style.display = `flex`;
		email.nextSibling.style.position = `relative`;
		email.nextSibling.style.right = ``;
		email.nextSibling.style.opacity = `0.6`;
		email.focus();
		return;
	} else {
		email.nextSibling.textContent = ``;
	}

	if (eMailPattern.test(email.value) === false) {
		email.nextSibling.textContent = `이메일 주소 형식이 잘못되었습니다.\n\r다시 입력 바랍니다.`;
		email.nextSibling.style.fontSize = `13px`;
		email.nextSibling.style.display = `flex`;
		email.nextSibling.style.position = `relative`;
		email.nextSibling.style.right = ``;
		email.nextSibling.style.opacity = `0.6`;
		email.focus();
		return;
	} else {
		email.nextSibling.textContent = ``;
	}

	if (zipcode.value == "") {
		find.nextSibling.textContent = `필수 입력란 입니다.`;
		find.nextSibling.style.fontSize = `13px`;
		find.nextSibling.style.display = `flex`;
		find.nextSibling.style.position = `relative`;
		find.nextSibling.style.right = ``;
		find.nextSibling.style.opacity = `0.6`;
		find.focus();
		return;
	} else {
		find.nextSibling.textContent = ``;
	}

	if (address1.value == "") {
		address1.nextSibling.textContent = `주소를 입력해 주세요.`;
		address1.nextSibling.style.fontSize = `13px`;
		address1.nextSibling.style.display = `flex`;
		address1.nextSibling.style.position = `relative`;
		address1.nextSibling.style.right = ``;
		address1.nextSibling.style.opacity = `0.6`;
		address1.focus();
		return;
	} else {
		address1.nextSibling.textContent = ``;
	}

	if (address2.value == "") {
		address2.nextSibling.textContent = `세부주소를 입력해 주세요.`;
		address2.nextSibling.style.fontSize = `13px`;
		address2.nextSibling.style.display = `flex`;
		address2.nextSibling.style.position = `relative`;
		address2.nextSibling.style.right = ``;
		address2.nextSibling.style.opacity = `0.6`;
		address2.focus();
		return;
	} else {
		address2.nextSibling.textContent = ``;
	}

	document.register.submit();
}

