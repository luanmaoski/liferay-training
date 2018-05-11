<%@include file="../init.jsp"%>

<liferay-ui:search-container total="${total}">
    <liferay-ui:search-container-results results="${results}"/>

    <liferay-ui:search-container-row
            className="guestbook.model.Entry" modelVar="entry">

        <liferay-ui:search-container-column-text property="message" />

        <liferay-ui:search-container-column-text property="name" />

    </liferay-ui:search-container-row>

    <liferay-ui:search-iterator />

</liferay-ui:search-container>

<portlet:renderURL var="addEntryURL">
    <portlet:param name="mvcPath" value="/edit_entry.jsp"/>
    <portlet:param name="guestbookId" value="${guestbookId}" />
</portlet:renderURL>

<aui:button-row>
    <aui:button onClick="${addEntryURL}" value="Add Entry"/>
</aui:button-row>