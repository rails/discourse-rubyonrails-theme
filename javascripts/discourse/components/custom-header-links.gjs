import Component from "@glimmer/component";
import { inject as service } from "@ember/service";
import { eq } from "truth-helpers";
import concatClass from "discourse/helpers/concat-class";

export default class CustomHeaderLinks extends Component {
  @service header;

  get hideMenus() {
    return this.header.topic;
  }

  get items() {
    return settings.Custom_header_links.split("|").map((item) => {
      const [
        linkText,
        linkTitle,
        linkHref,
        deviceClass,
        target,
        keepOnScrollClass,
      ] = item.split(",").map((v) => v.trim());
      return {
        deviceClass,
        keepOnScrollClass,
        linkHref,
        linkTitle,
        linkText,
        linkClass: `${linkText.trim().toLowerCase().replace(/\s/gi, "-")}`,
        linkTarget: target === "self" ? null : "_blank",
      };
    });
  }

  <template>
    <ul
      class={{concatClass
        "custom-header-links"
        (if this.hideMenus "hide-menus")
      }}
    >
      {{#each this.items as |link|}}
        <li
          class={{concatClass
            "headerLink"
            link.deviceClass
            (if (eq link.keepOnScrollClass "keep") "keep")
            link.linkClass
          }}
        >
          <a
            href={{link.linkHref}}
            title={{link.linkTitle}}
            target={{link.linkTarget}}
          >
            {{link.linkText}}
          </a>
        </li>
      {{/each}}
    </ul>
  </template>
}
