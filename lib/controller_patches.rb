Rails.configuration.to_prepare do
  HelpController.class_eval do
    before_action :set_history, except: :index

    private

    def set_history
      @history ||= HelpPageHistory.new(
        lookup_context.find_template("#{controller_path}/#{action_name}")
      )
    end
  end
end
