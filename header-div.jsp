<div id="header-div" class="container-fluid">
<div class="row">
	<div id="left-header-div" class="col-sm-6">
		<%if(session.getAttribute("loginType")!=null && session.getAttribute("loginType").toString().equals("Bank"))
		{%>
			<span id="s1">bankingBazaar</span><span id="s2">.com</span>
		<%}
		else
		{%>
			<a href="index.jsp"><span id="s1">bankingBazaar</span><span id="s2">.com</span></a>
		<%} %>
	</div>
	<div id="right-header-div" class="col-sm-6">
		<% if(session.getAttribute("id")==null || (Integer)session.getAttribute("id")==0)
			{%>
		<ul>
		<li>
			<a href="vregister">New Vendor?</a>
		</li>
		<li>
			<a href="uregister">New User?</a>
		</li>
		<li class="bdropdown">
    		<a href="#" class="bdropbtn">Log in</a>
    			<div class="bdropdown-content">
      				<a href="login">User Log in</a>
      				<a href="vlogin">Vendor Log in</a>
     			</div>
  		</li>
		</ul>
		<%}
		else
		{
		%>	
		<ul>
			<%if(session.getAttribute("loginType").toString().equals("User"))
			{%>
				<li>
					<a href="userprofile"><%= session.getAttribute("name").toString() %></a>
				</li>
			<%}
			else if(session.getAttribute("loginType").toString().equals("Bank"))
			{%>
				<li>
					<a href="bankprofile"><%= session.getAttribute("name").toString() %></a>
				</li>
			<%} %>
		<li>
			<a href="logout">Log out</a>
		</li>
		</ul>
		<%} %>
		<!-- <br>
		<div class="input-group" style="width:300px;float:right">
    		<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
    		<input id="search" type="text" align="right" class="form-control" name="search" placeholder="Search">
    	</div> -->
	</div>
</div>
</div>
    