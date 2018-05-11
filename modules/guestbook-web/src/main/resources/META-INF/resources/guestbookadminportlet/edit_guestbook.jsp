<%@include file = "../init.jsp" %>

<portlet:renderURL var="viewURL">
    <portlet:param name="mvcPath" value="/guestbookadminportlet/view.jsp" />
</portlet:renderURL>

<portlet:actionURL name='${guestbookId == null ? "addGuestbook" : "updateGuestbook"}' var="editGuestbookURL" />

<aui:form action="<%= editGuestbookURL %>" name="fm">

    <aui:model-context bean="${guestbookId}" model="${guestbook.model.Guestbook.class}" />

    <aui:input type="hidden" name="guestbookId"
               value='${guestbookId == null ? "" : guestbookId.getGuestbookId()}' />

    <aui:fieldset>
        <aui:input name="name" />
    </aui:fieldset>

    <aui:button-row>
        <aui:button type="submit" />
        <aui:button onClick="<%= viewURL %>" type="cancel"  />
    </aui:button-row>
</aui:form>