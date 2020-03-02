# Discourse Theme for Ruby on Rails
This theme requires the installation of the [custom-header-links component.](https://meta.discourse.org/t/custom-header-links/90588.)

**Preview**

<img src="https://i.ibb.co/17Q4Nzf/Screenshot-2020-03-02-Trial-Project-1.png" alt="Screenshot-2020-03-02-Trial-Project-1" width="50%" />

Instructions for installing a theme-component can be found [here](https://meta.discourse.org/t/how-do-i-install-a-theme-or-theme-component/63682).

Once installed, in the admin panel, navigate to `Customize > Themes` , then click on `Components` and select the "Custom Header Links" component to edit it's settings. Look for the settings below on your site.

<img src="https://i.ibb.co/Svv3m8S/Screenshot-2020-03-02-Trial-Project.png" width="50%"/>

In the `custom header links` section, remove all current links, and add each of the following rows via `Search or Create...`:
- `Blog, Link to Blog, https://weblog.rubyonrails.org/, vdo, blank, remove`
- `Guides, Link to Guides, https://guides.rubyonrails.org/, vdo, blank, remove`
- `API, Link to API, https://api.rubyonrails.org/, vdo, blank, remove`
- `Ask for help, Link to Stack Overflow, https://stackoverflow.com/questions/tagged/ruby-on-rails, vdo, blank, remove`

Then set `links position` to left.

After these settings are saved, your page should render as designed!
