<%@ page import="process.Customer" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" errorPage="Error.jsp"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
</head>
<body>
<center>
    <h2>
        <% String sessionCustomerString=session.getAttribute("sessionCustomer").toString();
            out.println("Hello "+sessionCustomerString);
        %>
    </h2>
    <br/>
    <h3>
        Please select the outlet:
    </h3>
    <br/>
    <%
        ArrayList outlets = Customer.getOutlets();
        Iterator<String> outletItr = outlets.iterator();
        int i = 1;
        while (outletItr.hasNext()) {
            String outlet = outletItr.next();
    %>
    <br/> <a href="CustomerOrder.jsp"> <% out.println(outlet); %> </a>
    <%
            i++;
        }
    %>
    <br/>
    <a href="Logout.jsp">Logout</a>
</center>
</body>
</html>
