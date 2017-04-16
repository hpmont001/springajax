<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>foods</title>
<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<table id="dataTable" class="table table-striped table-condensed">
		<thead>
			<tr>
				<th>id</th>
				<th>name</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
	<div class="table_paginate"></div>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
	
	
	<script src="static/jquery/jquery.min.js"></script>
	<script src="static/bootstrap/js/bootstrap.min.js"></script>
	<script src="static/jquery-bootpag/jquery.bootpag.js"></script>
	<script>
		$(function() {
			toPage(1);

			$('.table_paginate').bootpag().on('page', function(event, num) {
				toPage(num);
			});
		});

		function toPage(num) {
			var data = 'pn=' + num;
			$.post('http://localhost:8080/springajax/get', data,
					function(resp) {
						showRespData(resp);
					});
			$('.loading').fadeIn();
		}

		function showRespData(resp) {
			$('.loading').fadeOut();
			if (resp) {
				var tbody = $('#dataTable>tbody').html('');
				var foods = resp.foods;
				for (var i = 0; foods && i < foods.length; i++) {
					var food = foods[i];
					var tr = '<tr>';
					tr = tr + '<td><a href="javascript:showDetail(' + food.id
							+ ')">' + food.id + '</a></td>';
					tr = tr + '<td>' + food.name + '</td>';
					tr = tr + '</tr>';
					tbody.append(tr);
				}
				var page = resp.page;
				if (page.totalCount > 0) {

					$('.table_paginate').bootpag({
						total : page.totalPageCount,
						page : page.pageNow,
						maxVisible : 10,
						prev : '上一页',
						next : '下一页'
					});
				}
			}
		}

		function showDetail(id) {
			showModal("getById?id=" + id, '详情', true);
		}

		function showModal(url, title, isHtml) {
			$.get(url, function(data) {
				if (data) {
					$('#myModal .modal-title').text(title);
					if (isHtml) {
						var food = data;
						var text = '';
						text = text + '<br>id:' + food.id;
						text = text + '<br>name:' + food.name;
						$('#myModal .modal-body').html(text);
					} else {
					}
					$('#myModal').modal();
				}
			});
		}
	</script>
</body>
</html>