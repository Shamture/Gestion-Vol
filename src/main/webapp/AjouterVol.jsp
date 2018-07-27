<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib	prefix="spring"	uri="http://www.springframework.org/tags"	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajouter Vol</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />"/>
<link rel="stylesheet" href="<c:url value="/css/main.css" />"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">

</head>
<body>
<%@ include file="MenuAdmin.jsp" %>

<section id="ajout-fournisseur" class="container">
<h1>Créer Nouveau Vol</h1>
     <hr/>
   <div class="col-md-6">
     
     <c:choose>
       <c:when test="${requestScope.res == true }">
          <div class="alert alert-success">
            Vol crée avec succées !
          </div>
       </c:when>
       
       <c:when test="${requestScope.res == false }">
          <div class="alert alert-danger">
             Une erreur s'est produite
          </div>
       </c:when>
     </c:choose>
     
     <form:form method="post" action="" modelAttribute="newVol">
       <div class="form-group">
         <label>Date Depart</label>
         <div class='input-group date' id='datetimepicker1'>
         <form:input path="depart" type="text" placeHolder="Date Depart" class="form-control" required = "required"/>
         <span class="input-group-addon">
             <span class="glyphicon glyphicon-calendar"></span>
         </span>
         <form:errors	path="arrivee"	cssClass="text-danger"/>
         </div>
       </div>
       <div class="form-group">
         <label>Aeroport Depart</label>
         
         <form:select path="aeroportDepart.id" class="form-control">
         	<c:forEach items="${requestScope.aeros }" var="item">
         	   <option value="${item.id}">${item.nom }</option>
         	</c:forEach>
         </form:select>
       </div>
       <div class="form-group">
         <label>Date Arrivé</label>
         <div class='input-group date' id='datetimepicker2'>
         <form:input path="arrivee" type="text" placeHolder="Date Arrivé" class="form-control" required = "required"/>
         <span class="input-group-addon">
             <span class="glyphicon glyphicon-calendar"></span>
         </span>
         <form:errors	path="arrivee"	cssClass="text-danger"/>
         </div>
       </div>
       
       <div class="form-group">
         <label>Aeroport Arrivé</label>
         <form:select path="aeroportArrivee.id" class="form-control">
         	<c:forEach items="${requestScope.aeros }" var="item">
         	   <option value="${item.id}">${item.nom }</option>
         	</c:forEach>
         </form:select>
       </div>
       <hr/>
       <div class="form-group">
         <label>Prix</label>
         <form:input path="prix" type="text" placeHolder="Prix Vol" class="form-control" required = "required"/>
         <form:errors	path="prix"	cssClass="text-danger"/>
       </div>
       
       <div class="form-group">
         <label>Avion</label>
         <form:select path="avion.id" class="form-control">
           <c:forEach items="${requestScope.avions }" var="item">
           		<option value="${item.id }" >${item.code }</option>
           </c:forEach>
         </form:select>
       </div>
        <hr/>
       <div class="row">
       <div class="form-group col-md-8">
         <label>Escales</label>
         <form:input path="escalesString" type="text" placeHolder="Escales" class="form-control" />
         <form:errors	path="escalesString"	cssClass="text-danger"/>
       </div>
       <div class="col-md-4">
          <button class="btn btn-success" id="opener" type="button"><i class="fa fa-plus" aria-hidden="true"></i> Ajouter Escale</button>
       </div>
       </div>
       
       
       <br/>
       <div class="col-md-12">
       <br/><br/><br/>
       	<input type="submit" value="Créer Vol" class="btn btn-danger"/>
       </div>
       
       
     </form:form>
     
   </div>
   <div class="col-md-1"></div>
   <div class="col-md-5">
     <img src="<c:url value="/images/plane-travel-flight-tourism-travel-icon-png-10.png" />" alt="" />
   </div>
</section>
<br/><br/><br/>
<div id="my-dialog-container">
  
  <div id="window-container">
    <div id="closing-div">
    <p>
       <button id="closing-button"><i class="fa fa-times" aria-hidden="true"></i></button>
       </p>
    </div>
     <div id="form-container">
       <label>Aeroport Escale</label><br/><br/>
        <select id="one-contact">
          <c:forEach items="${requestScope.aeros }" var="item">
           <option value="${item.id }">${item.nom }</option>
          </c:forEach>
        </select>
		<br/><br/><br/>
       <button class="btn btn-success" id="add-contact-button">Ajouter Escale</button>
     </div>
     
  </div>
</div>







<script type="text/javascript" src="<c:url value="/js/jquery.min.js" />" ></script>
  
<script type="text/javascript" src="<c:url value="/js/bootstrap.min.js" />" ></script>
<script type="text/javascript" src="<c:url value="/js/moment.min.js" />" ></script>
<script type="text/javascript" src="<c:url value="/js/bootstrap-datetimepicker.js" />" ></script>

<script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datetimepicker({
                	format : 'YYYY-MM-DD hh:mm:ss'
    				
                });
 				$('#datetimepicker2').datetimepicker({
 					format : 'YYYY-MM-DD hh:mm:ss'
    				
                });
				/*
				Partie prompt box for adding escale
				*/
 				$('#opener').click(function(){
 					
 			 		$('#my-dialog-container').css('display','block');
 				});

 				$('#closing-button').click(function(){
 					$('#my-dialog-container').css('display','none');
 					$('#one-contact').val('');
 					
 				});

 				$('#add-contact-button').click(function(){
 					var name = $('#one-contact').val();
 					var existingContacts= $('#escalesString').val();
 					if(existingContacts.length >0){
 						$('#escalesString').val(existingContacts+','+name)
 					}else{
 						$('#escalesString').val(name)
 					}
 					$('#my-dialog-container').css('display','none');
 					$('#one-contact').val('');
 				});
            });
        </script>

</body>
</html>