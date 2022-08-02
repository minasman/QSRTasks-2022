class Documentations::OepeImportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @oepe_import = OepeImport.new
    authorize @oepe_import
  end

  def create
    @oepe_import = OepeImport.new(params[:oepe_import])
    authorize @oepe_import
    if @oepe_import.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

end
