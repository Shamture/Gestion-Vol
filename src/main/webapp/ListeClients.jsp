<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib	prefix="spring"	uri="http://www.springframework.org/tags"	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste Clients</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />"/>
<link rel="stylesheet" href="<c:url value="/css/main.css" />"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<%@ include file="MenuAdmin.jsp" %>

<section id="ajout-fournisseur" class="container">
<h1>Liste Des Clients</h1>
     <hr/>
   <div class="col-md-12">
     <p class="table-total">
       (${requestScope.listClients.size()}) En Total
     </p>
     <table class="table  table-striped table-bordered">
       <tr>
         <th>Nom</th>
         <th>Email</th>
         <th>Telephone</th>
         <th></th>
       </tr>
       
       <c:forEach items="${requestScope.listClients }" var="item">
          <tr id="l${item.id }">
             <td> <c:out value="${item.nom }" /> </td>
             <td> <c:out value="${item.email }" /> </td>
             <td> <c:out value="${item.tel }" /> </td>
             <td>
                
                <button class="btn btn-link blocker" id="b${item.id }"><i class="fa fa-ban" aria-hidden="true"></i> Bloquer</button>
                <button class="btn btn-danger deleter" id="${item.id }" title="supprimer"><i class="fa fa-trash-o" aria-hidden="true"></i> Supprimer</button>
             </td>
             
             
          </tr>
       </c:forEach>
     </table>
     
     
   </div>
   
   
   <c:if test="${requestScope.listBlocked.size()>0 }">
       <div class="row">
       
       <hr/>
       
       <h2 id="list-clients-blocked">Liste des clients blockées</h2>
       
       
       <div class="col-md-12">
     <p  class="table-total">
       (${requestScope.listBlocked.size()}) En Total
     </p>
     <table class="table  table-striped table-bordered">
       <tr>
         <th>Nom</th>
         <th>Email</th>
         <th>Telephone</th>
         <th></th>
       </tr>
       
       <c:forEach items="${requestScope.listBlocked }" var="item">
          <tr id="l${item.id }">
             <td> <c:out value="${item.nom }" /> </td>
             <td> <c:out value="${item.email }" /> </td>
             <td> <c:out value="${item.tel }" /> </td>
             <td>
                
                <button class="btn btn-success deblocker" id="b${item.id }"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> Debloquer</button>
                <button class="btn btn-danger deleter" id="${item.id }" title="supprimer"><i class="fa fa-trash-o" aria-hidden="true"></i> Supprimer</button>
             </td>
             
             
          </tr>
       </c:forEach>
     </table>
     
     
   </div>
   </div>
   </c:if>
</section>









<script type="text/javascript" src="<c:url value="/js/jquery.min.js" />" ></script>
  
<script type="text/javascript" src="<c:url value="/js/bootstrap.min.js" />" ></script>

<script>
$(function(){
   $('.deleter').click(function(){
		var res = confirm('Etês vous sure de vouloir supprimer ce client !');
	    if(res){
	    	var idClient = this.id;
			$.get('supprimer-client?id='+idClient,function(data){
				if(data == 'OK')
					$('#l'+idClient).remove();
				else
					alert("Une erreur s'est produite");	
			});
		}
		
   });

   $('.blocker').click(function(){
		var res = confirm('Etês vous sure de vouloir bloquer ce client !');
	    if(res){
	    	var idClient = this.id;
	    	
	    	idClient = idClient.substring(1);
			$.get('bloquer-client?id='+idClient,function(data){
				if(data == 'OK')
					$('#l'+idClient).remove();
				else
					alert("Une erreur s'est produite");	
			});
		}
		
  });

   $('.deblocker').click(function(){
		var res = confirm('Etês vous sure de vouloir debloquer ce client !');
	    if(res){
	    	var idClient = this.id;
	    	idClient = idClient.substring(1);
			$.get('debloquer-client?id='+idClient,function(data){
				if(data == 'OK')
					$('#l'+idClient).remove();
				else
					alert("Une erreur s'est produite");	
			});
		}
		
 });


});
</script>
</body>
</html>