<%@ page import="java.util.ArrayList" %>
<%@ page import="process.Vendor" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
</head>
<body>
<%

        String sessionVendorString = session.getAttribute("sessionVendor").toString();
        String sessionOutletName = Vendor.getOutletName(sessionVendorString);

        ArrayList<String> customerDetails = Vendor.getVendorOrdersCustomers(sessionOutletName);
        ArrayList<ArrayList<?>> itemNames = Vendor.getVendorOrdersItemNames(sessionOutletName);
        ArrayList<ArrayList<?>> itemPrices = Vendor.getVendorOrdersItemPrices(sessionOutletName);
        ArrayList<ArrayList<?>> quantity = Vendor.getVendorOrdersQuantity(sessionOutletName);
        ArrayList<ArrayList<?>> itemTotals = Vendor.getVendorOrdersItemTotal(sessionOutletName);
        ArrayList<String> totalBills = Vendor.getVendorOrdersTotalBill(sessionOutletName);

        Iterator<String> customerDetailsItr = customerDetails.iterator();
        Iterator itemNamesItr = itemNames.iterator();
        Iterator itemPricesItr = itemPrices.iterator();
        Iterator quantityItr = quantity.iterator();
        Iterator itemTotalsItr = itemTotals.iterator();
        Iterator<String> totalBillsItr = totalBills.iterator();

        int orderNumber =1;

        while(customerDetailsItr.hasNext() && itemNamesItr.hasNext() && itemPricesItr.hasNext() && quantityItr.hasNext()
                && itemTotalsItr.hasNext() && totalBillsItr.hasNext()){
            out.println(orderNumber + "."); %>
<br/>
<%
    String customer = customerDetailsItr.next();
    out.println("Ordered by: " + customer); %>
<br/>
<%

    ArrayList<?> namesInEachOrder = (ArrayList<?>)itemNamesItr.next();
    Iterator namesInEachOrderItr = namesInEachOrder.iterator();

    ArrayList<?> pricesInEachOrder = (ArrayList<?>)itemPricesItr.next();
    Iterator pricesInEachOrderItr = pricesInEachOrder.iterator();

    ArrayList<?> quantityInEachOrder = (ArrayList<?>)quantityItr.next();
    Iterator quantityInEachOrderItr = quantityInEachOrder.iterator();

    ArrayList<?> itemTotalInEachOrder = (ArrayList<?>)itemTotalsItr.next();
    Iterator itemTotalInEachOrderItr = itemTotalInEachOrder.iterator();

    while(namesInEachOrderItr.hasNext() && pricesInEachOrderItr.hasNext() && quantityInEachOrderItr.hasNext()
            && itemTotalInEachOrderItr.hasNext()){
        String name = namesInEachOrderItr.next().toString();
        String price = pricesInEachOrderItr.next().toString();
        String qty = quantityInEachOrderItr.next().toString();
        String totalForItem = itemTotalInEachOrderItr.next().toString();

        out.println(name + " - ₹" + price + " :: Quantity = " + qty + " :: Total for " + name + " = ₹" + totalForItem); %>
<br/>
<%
    }
    String totalBill = totalBillsItr.next();
    out.println("Total Bill = ₹" + totalBill); %>
<br/>
<br/>
<%
            orderNumber++;
        }

%>
</body>
</html>