
function fileValidation() {
	let fileInput = document.getElementById('file');
	let filePath = fileInput.value;
	let allowedExtensions = /(\.csv)$/i;
	if (!allowedExtensions.exec(filePath)) {
		alert('Please upload file having extensions .csv only.');
		fileInput.value = '';
		return false;
	}
}
