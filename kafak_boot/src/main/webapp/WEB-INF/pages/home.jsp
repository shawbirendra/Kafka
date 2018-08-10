<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<style type="text/css">
ul {
	list-style: none;
}

li {
	float: left;
	margin-right: 10px;
	width: 100px
}
</style>
<script type="text/javascript">
	function sendMsg() {
		
		var ajx;
		ajx = new XMLHttpRequest();
    	
		var url="producer?message=";
		var message=document.getElementById("message").value;
		//alert(message)
		
		ajx.onreadystatechange=function(){
			if(this.status==200&&this.readyState==4){		
				var res = JSON.parse(ajx.responseText);
				var length = Object.keys(res).length;
				
				var op="";
				
				for(var i=0;i<length;i++){
					 op=op+res[i]+"\n";
				}
				document.getElementById("res").innerHTML=op;
			}			
		}
		ajx.open("POST",url+message,true);		
		ajx.send();
		
	}
</script>
</head>
<body>
	<div style="width: 80%" align="center">

		<ul>
			<li><a href="#">Query?</a></li>
			<li><a href="#">About</a></li>
		</ul>
		<br>
		
			<div id="demo1"
				style="float: left; margin-top: 50px; margin-right: 50px">
				<table width="500px" align="center"
					style="box-shadow: 0px 0px 30px 0px rgba(0, 0, 0, 100);">
					<tr><h4>Sender</h4>
					
				
						<td>Type Message: <textarea rows="5" cols="50" name="message" id="message"></textarea></td>
					</tr>
					<tr>
						<td><input type="submit" value="send"
							onclick="sendMsg()"> <font color="green">${message }</font></td>
					</tr>
				</table>

			</div>
			<div
				style="float: left; margin-top: 50px; margin-right: 50px; box-shadow: 0px 0px 30px 0px rgba(0, 0, 0, 100);">
				<h4>Receiver</h4>
				<textarea rows="10" cols="50" id="res"></textarea>
			</div>
		
		<div style="margin-top: 500px">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>

</html>