<%@ page import="com.liferay.portal.kernel.service.ServiceContext" %>
<%@ page import="com.liferay.portal.kernel.service.ServiceContextFactory" %>
<%@include file="../init.jsp"%>
<liferay-ui:success key="entryAdded" message="entry-added" />
<liferay-ui:success key="guestbookAdded" message="guestbook-added" />
<liferay-ui:success key="entryDeleted" message="entry-deleted" />

<portlet:defineObjects/>
<%
    ServiceContext serviceContext = ServiceContextFactory.getInstance(Guestbook.class.getName(), renderRequest);

%>
<liferay-ui:search-container
        total="<%= GuestbookLocalServiceUtil.getGuestbooksCount() %>">
    <liferay-ui:search-container-results
            results="<%= GuestbookLocalServiceUtil.getGuestbooks(serviceContext.getScopeGroupId(),
            searchContainer.getStart(), searchContainer.getEnd()) %>" />

    <liferay-ui:search-container-row
            className="guestbook.model.Guestbook" modelVar="guestbook">

        <liferay-ui:search-container-column-text property="name" />

        <liferay-ui:search-container-column-jsp
                align="right"
                path="/guestbookadminportlet/guestbook_actions.jsp" />

    </liferay-ui:search-container-row>

    <liferay-ui:search-iterator />
</liferay-ui:search-container>

<aui:button-row cssClass="guestbook-admin-buttons">
    <portlet:renderURL var="addGuestbookURL">
        <portlet:param name="mvcPath"
                       value="/guestbookadminportlet/edit_guestbook.jsp" />
        <portlet:param name="redirect" value="<%= "currentURL" %>" />
    </portlet:renderURL>

    <aui:button onClick="<%= addGuestbookURL.toString() %>"
                value="Add Guestbook" />
</aui:button-row>