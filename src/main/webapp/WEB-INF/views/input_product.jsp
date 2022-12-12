<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<style>
	@font-face {
    font-family: 'LINESeedKR-Bd';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
@font-face {
    font-family: 'LINESeedKR-Rg';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Rg.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
	*{
		font-size: 25px;
		font-family: 'LINESeedKR-Rg';
	}
    .drop-zone {
        width:800px;
        height:500px;
        display:flex;
        flex-direction:column;
        align-items:center;
        justify-content: center;
        position:relative;
        overflow: hidden;
    }
    h1{
    font-family: 'LINESeedKR-Bd';
    }
    .drop-zone-dragenter, .drop-zone-dragover {
        border: 5px solid blue;
        width:80%;
        height:500px;
        padding:-10% -10%;
        position: absolute;
        top : 50%;
        left: 9%;
        transform:translateY(-210px);
        display:flex;
        justify-content: center;
    }
    .dragenter {
        width:100%;
    }
    .drop-container{
        display: flex;
        justify-content:center;
        align-items: center;
        width: 90%;
        height: 500px;
        cursor : pointer;
        border : 3px dotted black;
        overflow:hidden;
    }
    #drop-session {
        display:flex;
        justify-content: center;
    }
    .text-primary:hover{
    	opacity:0.5;
    }
</style>
</head>
<body>
	<div class="all_con mb-5" style ="transform:translateY(15%)">
	<div class="title" style="display:flex; justify-content:center;">
			<h1> 제품코드와 정확도판별 AI
			</h1>
	</div>
      <session id="drop-session">
        <form ></form>
    <div class="drop-container bg-light">
    <form action="http://127.0.0.1:5000/predict" method="POST" enctype="multipart/form-data">
		
        <div class="drop-zone">
        <div class="submit-input d-flex justify-content-center" style="width:225px;">
            <input type="file" name = 'img' id="img" multiple="multiple">
        </div>
            <div class="mt-2 text-primary">또는 파일을 여기로 드래그하세요. <i class="fa-solid fa-upload"></i></div>
            <div class="drop-submit d-flex justify-content-center">
            <button type='submit' class='btn btn-success mt-3'> 제출 </button>
        </div>
        </div>
    </form>
    
 
    
    
</div>
</session>
	
	</div>
  <script>
        (function() {
            var $file = document.getElementById("file")
            var dropZone = document.querySelector(".drop-zone")
            var toggleClass = function(className) {
                console.log("current event: " + className)
                var list = ["dragenter", "dragleave", "dragover", "drop"]
                for (var i = 0; i < list.length; i++) {
                    if (className === list[i]) {
                        dropZone.classList.add("drop-zone-" + list[i])
                    } else {
                        dropZone.classList.remove("drop-zone-" + list[i])
                    }
                }
            }
            var showFiles = function(files) {
                dropZone.innerHTML = ""
                for(var i = 0, len = files.length; i < len; i++) {
                    dropZone.innerHTML += "<p>" + files[i].name + "</p>"
                }
                
            }
            var selectFile = function(files) {
                // input file 영역에 드랍된 파일들로 대체
                $file.files = files
                showFiles($file.files)
            }
            $file.addEventListener("change", function(e) {
                showFiles(e.target.files)
            })
            // 드래그한 파일이 최초로 진입했을 때
            dropZone.addEventListener("dragenter", function(e) {
                e.stopPropagation()
                e.preventDefault()
                toggleClass("dragenter")
            })
            // 드래그한 파일이 dropZone 영역을 벗어났을 때
            dropZone.addEventListener("dragleave", function(e) {
                e.stopPropagation()
                e.preventDefault()
                toggleClass("dragleave")
            })
            // 드래그한 파일이 dropZone 영역에 머물러 있을 때
            dropZone.addEventListener("dragover", function(e) {
                e.stopPropagation()
                e.preventDefault()
                toggleClass("dragover")
            })
            // 드래그한 파일이 드랍되었을 때
            dropZone.addEventListener("drop", function(e) {
                e.preventDefault()
                toggleClass("drop")
                var files = e.dataTransfer && e.dataTransfer.files
                console.log(files)
                if (files != null) {
                    if (files.length < 1) {
                        alert("폴더 업로드 불가")
                        return
                    }
                    selectFile(files)
                } else {
                    alert("ERROR")
                }
            })
        })();
    </script>
</body>
</html>