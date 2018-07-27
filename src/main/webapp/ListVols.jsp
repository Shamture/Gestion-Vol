<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vols Disponible</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />"/>
<link rel="stylesheet" href="<c:url value="/css/main.css" />"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
</head>
<body>
<c:choose>
  <c:when test="${sessionScope.type == 'agent' }">
     <%@ include file="MenuAdmin.jsp" %>
  </c:when>
  
  <c:otherwise>
     <%@ include file="MenuVisitor.jsp" %>
  </c:otherwise>
</c:choose>



<section class="container">
  <h1>Vols disponibles</h1>
  <hr/>
  <c:if test="${empty sessionScope.type or sessionScope.type == 'client' }">
    <div class="row">
     <h3>Recherche</h3>
     <form method="get" action="">
       <div class="col-md-4">
         <div class="form-group">
           <label>A Partir de</label>
           <input type="text" name="minDate" id="minDate" class="form-control" placeHolder = "Date minimale" value="${param.minDate }" />
         </div>
         <div class="form-group">
           <label>Avant le</label>
           <input type="text" name="maxDate" id="maxDate" class="form-control" placeHolder = "Date maximale"  value="${param.maxDate }"/>
         </div>
         
       </div>
       <div class="col-md-2"></div>
       <div class="col-md-4">
         <div class="form-group">
           <label>Pays Depart</label>
           <select name="paysDepart" class="form-control">
             <option value="0">----Pays Depart-----</option>
             <c:forEach items="${requestScope.pays }" var="item">
               <option value="${item.id }">${item.nom }</option>
             </c:forEach>
           </select>
         </div>
         <div class="form-group">
           <label>Pays Arrivee</label>
           <select name="paysArrivee" class="form-control">
             <option value="0">----Pays Arrivée-----</option>
             <c:forEach items="${requestScope.pays }" var="item">
               <option value="${item.id }">${item.nom }</option>
             </c:forEach>
           </select>
         </div>
       </div>
       <div class="col-md-4">
         <button class="btn btn-primary"><i class="fa fa-search" aria-hidden="true"></i> Rechercher</button>
         <br/><br/><hr/><br/>
       </div>
     </form>
   </div>
  </c:if>
   
    
  
  <c:forEach items="${requestScope.listVols }" var="item">
     <div class="row">
       <div class="col-md-2">
          <img src="<c:url value="/images/plane-logo.png" />" alt="" />
       </div>
       <div class="col-md-4">
         <p><strong>Depart : </strong> ${item.depart }</p>
         <p><strong>Arrivée : </strong> ${item.arrivee }</p>
         <p><strong>Lieu de Depart : </strong> ${item.aeroportDepart.ville.pays.nom } ${item.aeroportDepart.ville.nom }</p>
         
         <p><strong>Destination : </strong> ${item.aeroportArrivee.ville.pays.nom } ${item.aeroportArrivee.ville.nom }</p>
       </div>
       <div class="col-md-4">
          <p><strong>Prix : </strong> ${item.prix } DT</p>
          <br/><br/>
          <p>
            <c:choose>
               <c:when test="${sessionScope.type == 'agent' }">
     				<a href="<c:url value="/agent/modifier-vol/${item.id}" />"><button class="btn btn-success"><i class="fa fa-wrench" aria-hidden="true"></i> Modifier</button></a>
  			   </c:when>
  
  			   <c:otherwise>
     				 
                     <a href="<c:url value="/client/faire-reservation/${item.id}" />"><button class="btn btn-success"><i class="fa fa-bookmark-o" aria-hidden="true"></i> Faire reservation</button></a>
  			   </c:otherwise>
            </c:choose>
          
           
          </p>
       </div>
     </div>
     <hr/>
  </c:forEach>
</section>





<script type="text/javascript" src="<c:url value="/js/jquery.min.js" />" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value="/js/bootstrap.min.js" />" ></script>
<script>
$( "#minDate" ).datepicker({ dateFormat: 'yy-mm-dd'});
$( "#maxDate" ).datepicker({ dateFormat: 'yy-mm-dd'});
</script>

</body>
</html>