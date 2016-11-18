module RedirectorUi
  class RedirectRulesGrid
    include Datagrid

    scope { RedirectRule }

    def initialize attributes = nil, &block
      self.order ||= 'created_at'
      self.descending ||= 'true'
      super(attributes, &block)
    end

    filter(:source, :string) { |value| where('source LIKE ?', "%#{value}%") }
    filter(:destination, :string) { |value| where('destination LIKE ?', "%#{value}%") }
    filter(:active, :xboolean)
    filter(:source_is_regex, :xboolean)
    filter(:source_is_case_sensitive, :xboolean)

    column(:created_at) do |r|
      format(r.created_at) do |value|
        I18n.l r.created_at
      end
    end
    column(:source)
    column(:destination)
    column(:active) do |r|
      format(r.active) do |value|
        value ? fa_icon('check-circle', class: 'text-success') : fa_icon('times-circle', class: 'text-danger')
      end
    end
    column(:source_is_regex) do |r|
      format(r.source_is_regex) do |value|
        value ? fa_icon('check-circle', class: 'text-success') : fa_icon('times-circle', class: 'text-danger')
      end
    end
    column(:source_is_case_sensitive) do |r|
      format(r.source_is_case_sensitive) do |value|
        value ? fa_icon('check-circle', class: 'text-success') : fa_icon('times-circle', class: 'text-danger')
      end
    end
    column(:actions, header: '', html: true) do |r|
      link_to(fa_icon(:pencil), redirector_ui.edit_redirect_rule_path(r), class: %w(btn btn-primary btn-sm))
    end
  end
end
