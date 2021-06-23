Rails.configuration.to_prepare do
  HelpController.class_eval do
    before_action :set_history, except: :index

    def house_rules; end

    private

    def set_history
      @history ||= HelpPageHistory.new(
        lookup_context.find_template("#{controller_path}/#{action_name}")
      )
    end
  end

  PublicBodyController.class_eval do
    before_action :get_greek_alphabet, only: [:list]

    def get_greek_alphabet
      @greek_alphabet = %w[Α Β Γ Δ Ε Ζ Η Θ Ι Κ Λ Μ Ν Ξ Ο Π Ρ Σ Τ Υ Φ Χ Ψ Ω]
    end
  end
end
