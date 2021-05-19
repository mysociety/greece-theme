class HelpPageHistory
  GITHUB_BASE =
    'https://github.com/mysociety/greece-theme/commits/master'.freeze

  def initialize(template)
    @template = template
  end

  def commits_url
    template.inspect.gsub(/lib\/themes\/greece-theme/, GITHUB_BASE)
  end

  protected

  attr_reader :template
end
