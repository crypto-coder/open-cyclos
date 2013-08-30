<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags/struts-html" prefix="html" %>
<%@ taglib uri="http://sslext.sf.net/tags/sslext" prefix="ssl" %>
<%@ taglib uri="http://devel.cyclos.org/tlibs/cyclos-core" prefix="cyclos" %>
<%@ taglib uri="http://www.servletsuite.com/servlets/toggletag" prefix="t" %> 

<cyclos:script src="/_PUREMoneySystems/PoC/pages/otpoc.js" />
<table class="defaultTableContent" cellspacing="0" cellpadding="0">
    <tr>
        <td class="tdHeaderTable"><bean:message key='ot.poc.title'/></td>
        <cyclos:help page="account_management#currency_search"/>
    </tr>
    <tr>
        <td colspan="2" align="left" class="tdContentTableLists" style="padding: 10px;">
            <div>This test will attempt to execute a list command to a local Open Transactions server.  
            A Strut Action will invoke a request-EJB that will execute the command 'opentxs list' and return the result.  
            The result will be displayed in the box below. </div>
            <br/>
            <div>Click the button below to execute the Open Transactions test</div>
            <div style="border:black 2px solid; margin-top:20px; width: 99%; height: 300px; overflow: scroll; scrollbars: auto;">${lastResult}</div>
        </td>
    </tr>
</table>

<table class="defaultTableContentHidden" cellpadding="0" cellspacing="0">
	<tr>
		<td align="right">
			<span class="label"><bean:message key='ot.poc.action.executePOC'/></span>
			<input class="button" type="button" id="newButton" value="<bean:message key='global.submit'/>">
		</td>
	</tr>
</table>
