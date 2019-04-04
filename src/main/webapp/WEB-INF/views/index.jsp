<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/resources/js/app.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<title>Validity Home Exercise</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-6">
				<br>
				<h2 class="text-muted">Upload a CSV File:-</h2>
				<br>
				<form action="uploadFile" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<label>Select File to Upload: </label> <input
							id="file" class="form-control-file" type="file" name="file" accept=".csv" required onchange="return fileValidation()"><br>
					</div>
					<input class="btn btn-info btn-block" type="submit" value="Upload">
					<br>
				</form>
			</div>
			<div class="col"></div>
		</div>
	</div>
</body>
</html>