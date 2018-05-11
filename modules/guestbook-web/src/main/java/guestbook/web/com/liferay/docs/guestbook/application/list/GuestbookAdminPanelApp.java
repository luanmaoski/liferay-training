package guestbook.web.com.liferay.docs.guestbook.application.list;

import com.liferay.application.list.BasePanelApp;
import com.liferay.application.list.PanelApp;
import guestbook.web.constants.GuestbookWebPortletKeys;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;


@Component(
        immediate = true,
        property = {
                "panel.app.order:Integer=300",
                "panel.category.key=" + GuestbookWebPortletKeys.CONTROL_PANEL_CATEGORY
        },
        service = PanelApp.class
)

public class GuestbookAdminPanelApp extends BasePanelApp {
    @Override
    public String getPortletId() {
        return GuestbookWebPortletKeys.GUESTBOOK_ADMIN;
    }

    @Override
    @Reference(
            target = "(javax.portlet.name=" + GuestbookWebPortletKeys.GUESTBOOK_ADMIN + ")",
            unbind = "-"
    )
    public void setPortlet(com.liferay.portal.kernel.model.Portlet portlet) {
        super.setPortlet(portlet);
    }
}
