<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@	taglib	prefix="spring"	uri="http://www.springframework.org/tags"	%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<c:url value = "/"/>"><img src="/images/logo.png" alt="logo" /></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="<c:url value="/vols-disponible" />"><i class="fa fa-plane" aria-hidden="true"></i> Vols Disponible </a></li>
        
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <c:if test="${empty sessionScope.type }">
          <li><a href="<c:url value="/inscription-client" />"><i class="fa fa-user-plus" aria-hidden="true"></i> Inscrire </a></li>
          <li><a href="<c:url value="/login" />"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a></li>
        </c:if>
         <c:if test="${sessionScope.type == 'client'}">
          
          <li><a href="<c:url value="/deconnecter" />"><i class="fa fa-sign-in" aria-hidden="true"></i> Deconnnecter</a></li>
        </c:if>
        
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>