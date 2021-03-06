<%@ page import="search.EntryIndexer" %>
<%@include file="../init.jsp"%>

<portlet:defineObjects/>
<liferay-theme:defineObjects />

<%
    String keywords = ParamUtil.getString(request, "keywords");
    long guestbookId = ParamUtil.getLong(renderRequest, "guestbookId");
%>

<liferay-portlet:renderURL varImpl="searchURL">
    <portlet:param name="mvcPath"
                   value="/guestbookwebportlet/view_search.jsp" />
</liferay-portlet:renderURL>

<portlet:renderURL var="viewURL">
    <portlet:param
            name="mvcPath"
            value="/guestbookwebportlet/view.jsp"
    />
</portlet:renderURL>

<aui:form action="<%= searchURL %>" method="get" name="fm">
    <liferay-portlet:renderURLParams varImpl="searchURL" />

    <liferay-ui:header
            backURL="<%= viewURL.toString() %>"
            title="search"
    />

    <div class="search-form">
        <span class="aui-search-bar">
            <aui:input inlineField="<%= true %>" label="" name="keywords"
                       size="30" title="search-entries" type="text" />

            <aui:button type="submit" value="search" />
        </span>
    </div>
</aui:form>

<%
        SearchContext searchContext = SearchContextFactory
                .getInstance(request);

        searchContext.setKeywords(keywords);
        searchContext.setAttribute("paginationType", "more");
        searchContext.setStart(0);
        searchContext.setEnd(10);

        Indexer indexer = IndexerRegistryUtil.getIndexer(Entry.class);

        Hits hits = indexer.search(searchContext);

        List<Entry> entries = new ArrayList<>();

        Log _log = LogFactoryUtil.getLog(EntryIndexer.class);

        for (int i = 0; i < hits.getDocs().length; i++) {
            Document doc = hits.doc(i);

            long entryId = GetterUtil
                    .getLong(doc.get(Field.ENTRY_CLASS_PK));

            Entry entry = null;

            try {
                entry = EntryLocalServiceUtil.getEntry(entryId);
            } catch (PortalException pe) {
                _log.error(pe.getLocalizedMessage());
            } catch (SystemException se) {
                _log.error(se.getLocalizedMessage());
            }

            entries.add(entry);
        }

    List<Guestbook> guestbooks = GuestbookLocalServiceUtil.getGuestbooks(scopeGroupId);

    Map<String, String> guestbookMap = new HashMap<>();

    for (Guestbook guestbook : guestbooks) {
        guestbookMap.put(Long.toString(guestbook.getGuestbookId()), guestbook.getName());
    }
%>

<liferay-ui:search-container delta="10"
                             emptyResultsMessage="no-entries-were-found"
                             total="<%= entries.size() %>">
    <liferay-ui:search-container-results
            results="<%= entries %>"/>

    <liferay-ui:search-container-row
            className="guestbook.model.Entry"
            keyProperty="entryId" modelVar="entry" escapedModel="<%=true%>">
        <liferay-ui:search-container-column-text name="guestbook"
                                                 value="<%=guestbookMap.get(Long.toString(entry.getGuestbookId()))%>" />

        <liferay-ui:search-container-column-text property="message" />

        <liferay-ui:search-container-column-text property="name" />

        <liferay-ui:search-container-column-jsp
                path="/guestbookwebportlet/entry_actions.jsp"
                align="right" />
    </liferay-ui:search-container-row>

    <liferay-ui:search-iterator />
</liferay-ui:search-container>
