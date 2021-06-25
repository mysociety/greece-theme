# -*- encoding : utf-8 -*-
# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
  InfoRequest.class_eval do
    def email_subject_request(opts = {})
      return super unless I18n.locale == :el

      html = opts.fetch(:html, true)
      _('Αίτημα Κατάθεσης Εγγράφων - {{title}}',
        title: (html ? title : title.html_safe))
    end
  end
end
