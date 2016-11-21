module RedirectorUi
  class RedirectRulesController < ApplicationController

    before_action :set_redirect_rule, only: [:edit, :update, :destroy]

    def index
      @redirect_rules_grid = RedirectRulesGrid.new(params[:redirector_ui_redirect_rules_grid])

      respond_to do |f|
        f.html do
          @redirect_rules_grid.scope { |scope| scope.page(params[:page]) }
        end
        f.csv do
          send_data @redirect_rules_grid.to_csv,
          type: 'text/csv',
          disposition: 'inline',
          filename: "redirect-rules-#{Time.now.to_s}.csv"
        end
      end
    end

    def new
      @redirect_rule = RedirectRule.new
    end

    def create
      @redirect_rule = RedirectRule.new(redirect_rule_params)

      if @redirect_rule.save
        redirect_to redirector_ui.redirect_rules_path, notice: 'Redirect rule has been correctly created.'
      else
        render action: 'new'
      end
    end

    def edit
    end

    def update
      if @redirect_rule.update(redirect_rule_params)
        redirect_to redirector_ui.redirect_rules_path, notice: 'Redirect rule has been correctly updated.'
      else
        render :edit
      end
    end

    def destroy
      @redirect_rule.destroy
      redirect_to redirector_ui.redirect_rules_path, notice: 'Redirect rule has been correctly destroyed.'
    end

    private

    def set_redirect_rule
      @redirect_rule = RedirectRule.find(params[:id])
    end

    def redirect_rule_params
      params.require(:redirect_rule).permit(:source, :destination, :active, :source_is_regex, :source_is_case_sensitive)
    end
  end
end
