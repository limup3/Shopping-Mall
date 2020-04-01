<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
   
   
   
    <title>Upload</title>
  </head>
  <style >
body {
    background: #dfdfdf;
    color: #666;
    font: 14px/24px sans-serif;
}

.pagination {
    background: #f2f2f2;
    padding: 20px;
    margin-bottom: 20px;
}

#container {
    width: 600px;
    margin: 0 auto;
    padding: 20px;
}



 </style>
  
  <body>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  
  
  
  <div id="container">
   <div class="pagination">
      <p>
      <form action = "../process/upload.jsp" method = "post" enctype = "multipart/form-data">
      <label for="InputSubject1">파일첨부 : </label>
      <input type="file" name = "file"><br>
      
      </p>
      <button type="submit" class="btn btn-warning" > 업로드 </button>
      </form>
      </div>
      </div>
      
      
      


  
  </body>
</html>