<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name = "viewport" content = "width=device-width, initial-scale=1">
		<title>게시판</title>
		
		<link rel="stylesheet" href="/css/board.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
		<script type = "text/javascript">
			$(document).ready(function(){
				var storage = [];
				var i = 1;
				
				$("form").submit(function(e){
					e.preventDefault();
					if($(this).attr("id") == "login"){
						$("#myModal").modal("hide");
					}
			});
				
			$("#edit button: button").on("click", function(){
				$("#update").addClass("disabled");
				$("#delete").addClass("disabled");
				switch ($("#edit button:button").index(this)){
				case 0:
					createEvent();
					break;
				case 1:
					editEvent("update");
					break;
				case 2:
					editEvent("delete");
					break;
				default:
					alert("5류...");
				break;
				}
			});
			
			function createHtml(){
				get();
				$("tbody").empty();
				$("#text").val("");
				for(var j = 0; j < storage.length; j++){
					var tag = '<tr>' +
								'<td><input type = "checkbox"></td>' +
								'<td>' + storage[j].no + '</td>' +
								'<td>' + storage[j].text + '</td>' +
								'</tr>';
					$("tbody").append(tag);
				}
				
				if(storage.length > 0){
					
					i = storage.length + 1;
					
					$("input:checkbox").off();
					$("input:checkbox").click(function(){
						$("button:button").removeClass("disabled");
						var index = $("input:checkbox").index(this);
						var tr = $("tbody tr").eq(index);
						var tds = tr.find("td");
						var text = "";
						
						if($(this).prop("checked")){
							$("input:checkbox").prop("checked", false);
							$(this).prop("checked", true);
							
							text = tds.eq(2).text();
							$("#text").val(text);
						}else{
							$("input:checkbox").prop("checked", false);
							$("#text").val("");
						}
					});
					
				}else {
					i = 1;
				}
			}
			
			function createEvent(){
				var text = $("#text").val();
				if(text){
					var newData = {"no": i, "text": text};
					storage.push(newData);
					set(storage);
					
					createHtml();
					$("#text").val("");
				}else{
					alert("입력 후 다시 시도해주세요.");
				}
			}
			
			function editEvent(type){
				var index = checkboxIndex();
				if(index > -1){
					if(type == "update"){
						var newData = storage[index];
						var text = $("#text").val();
						newData.text = text;
						storage[index] = newData;
					}else if(type == "delete"){
						storage.splice(index, 1);
					}
					set(storage);
					createHtml();
				}else{
					alert("선택 후 다시 시도해주세요.");
				}
			}
			
			function checkboxIndex(){
				var index = -1;
				for(var i = 0; i < $("input:checkbox").length; i++){
					if($("input:checkbox").eq(i).prop("checked")){
						index = i;
						break;
					}
				}
				return index;
			}
			
			function set(data){
				localStorage.setItem("data", JSON.stringify(data));
			}
			
			function get(){
				if(JSON.parse(localStorage.getItem("data"))){
					storage = JSON.parse(localStorage.getItem("data"));
				}
			}
			
			createHtml();
			
			});
		</script>
	
	
	</head>
	
	
	<body>
	
		<div class = "container">
			<form id = "edit">
				<div class = "form-group row">
					<div class = "col-xs-2">
						<label for = "text">입력: </label>
					</div>
					<div class = "col-xs-7">
					<input type = "text" class = "form-control" id = "text" name = "text" placeholder = "입력하세요" autocomplete = "off">
					</div>
					<div class = "col-xs-1">
						<button type = "button" class = "btn btn-primary" id = "submit">추가</button>
					</div>
					<div class = "col-xs-1">
						<button type = "button" class = "btn btn-success disabled" id = "update">수정</button>
					</div>
					<div class = "col-xs-1">
						<button type = "button" class = "btn btn-danger disabled" id = "delete">삭제</button>
					</div>
				</div>
			</form>
		</div>
		
		<div class = "container">
			<table class = "table">
				<thead>
					<tr>
						<th>선택</th>
						<th>번호</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<input type = "checkbox">
						</td>
					</tr>
				</tbody>	
			</table>
		</div>
		
		
	
	</body>
</html>