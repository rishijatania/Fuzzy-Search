<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/resources/js/app.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.bootstrap4.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.colVis.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.bootstrap4.min.css">


<title>Validity Exercise Result</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<a href="/" class="btn btn-info btn-block">Back</a>
		</div>
		
	<ul class="nav nav-tabs">
        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#duplicates" role="tab">Duplicates</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#nduplicates" role="tab">Non Duplicates</a></li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="duplicates" role="tabpanel">
		<div class="row">


				<table id="duplicateTable"
					class="table table-striped table-bordered" style="width: 100%">
					<thead>
						<tr>
							<c:forEach items="${columnHeaders}" var="colname">
								<th>${colname}</th>
							</c:forEach>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${duplicates}" var="innerset">

							<c:forEach items="${innerset}" var="innermap">
								<tr>
									<c:forEach items="${innermap}" var="entry">



										<td><c:out value="${entry.value}"></c:out></td>

									</c:forEach>
								</tr>
							</c:forEach>

						</c:forEach>
					</tbody>
				</table>
		</div>
		</div>

		<div class="tab-pane fade" id="nduplicates" role="tabpanel">

		<div class="row">
				
					<table id="nonDuplicates"
						class="table table-striped table-bordered">
						<thead>
							<tr>
								<c:forEach items="${columnHeaders}" var="colname">
									<th>${colname}</th>
								</c:forEach>
							</tr>
						</thead>

						<tbody>


							<c:forEach items="${nonDuplicates}" var="innermap">
								<tr>
									<c:forEach items="${innermap}" var="entry">



										<td><c:out value="${entry.value}"></c:out></td>

									</c:forEach>
								</tr>
							</c:forEach>

						</tbody>
					</table>

			
		</div>
	</div>
	</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(
			function() {
				var table = $('#duplicateTable').DataTable({
					"scrollX" : true,
					"autoWidth": false,
					buttons : [ 'csv', 'excel', 'pdf', 'colvis' ]
				});
				table.buttons().container().appendTo(
						'#duplicateTable_wrapper .col-md-6:eq(0)');

				var table1 = $('#nonDuplicates').DataTable({
					"scrollX" : true,
					"autoWidth": false,
					buttons : [ 'csv', 'excel', 'pdf', 'colvis' ]
				});
				table1.buttons().container().appendTo(
						'#nonDuplicates_wrapper .col-md-6:eq(0)');
				
				$('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
					   $($.fn.dataTable.tables(true)).DataTable()
					      .columns.adjust();
					});
			});
</script>
</html>