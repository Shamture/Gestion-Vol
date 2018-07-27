<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib	prefix="spring"	uri="http://www.springframework.org/tags"	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste Des demandes</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />"/>
<link rel="stylesheet" href="<c:url value="/css/main.css" />"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<%@ include file="MenuAdmin.jsp" %>

<section id="ajout-fournisseur" class="container">
<h1>Liste Des Demandes d'inscription</h1>
     <hr/>
   <div class="col-md-12">
     <p id="table-total">
       (${requestScope.listDemandes.size()}) En Total
     </p>
     <table class="table  table-striped table-bordered">
       <tr>
         <th>Nom</th>
         <th>Email</th>
         <th>Telephone</th>
         <th></th>
       </tr>
       
       <c:forEach items="${requestScope.listDemandes }" var="item">
          <tr id="l${item.id }">
             <td> <c:out value="${item.nom }" /> </td>
             <td> <c:out value="${item.email }" /> </td>
             <td> <c:out value="${item.tel }" /> </td>
             <td>
                
                <button class="btn btn-success accepter" id="a${item.id }"><i class="fa fa-check" aria-hidden="true"></i> Accepter</button>
                 <button class="btn btn-danger deleter" id="${item.id }" title="supprimer"><i class="fa fa-trash-o" aria-hidden="true"></i> Refuser</button>
             </td>
             
             
          </tr>
       </c:forEach>
     </table>
     
     
   </div>
   
   
   
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

   $('.accepter').click(function(){
		var res = confirm('Etês vous sure de vouloir accepter ce client !');
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