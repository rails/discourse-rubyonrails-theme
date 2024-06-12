import HomeLogoContents from "discourse/components/header/home-logo-contents";
import { withPluginApi } from "discourse/lib/plugin-api";
import CustomHeaderLinks from "../components/custom-header-links";

export default {
  name: `rubyonrails-theme-header-customizations`,
  initialize(container) {
    const site = container.lookup("service:site");

    withPluginApi("1.29.0", (api) => {
      renderRailsHomeLogo(api);

      if (site.desktopView) {
        renderHeaderLinks(api);
      }
    });
  },
};

function renderRailsHomeLogo(api) {
  const logoSmallUrl = settings.theme_uploads["rails-logo-small"] || "";
  const logoUrl = settings.theme_uploads["rails-logo"] || "";
  const mobileLogoUrl = settings.theme_uploads["rails-logo"] || "";

  api.renderInOutlet("home-logo-contents", <template>
    <HomeLogoContents
      @logoSmallUrl={{logoSmallUrl}}
      @logoUrl={{logoUrl}}
      @minimized={{@outletArgs.minimized}}
      @mobileLogoUrl={{mobileLogoUrl}}
      @showMobileLogo={{@outletArgs.showMobileLogo}}
      @title={{@outletArgs.title}}
    />
  </template>);
}

function renderHeaderLinks(api) {
  if (!settings.Custom_header_links.length) {
    return;
  }

  if (settings.links_position === "right") {
    api.headerButtons.add("custom-header-links", CustomHeaderLinks);
  } else {
    api.renderInOutlet("before-header-panel", CustomHeaderLinks);
  }
}
