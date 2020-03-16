class PortfoliosController < ApplicationController
  layout "portfolio"
  def index
    #Portoflio.all returns all the portfolios
    #Portoflio.where(subtitle: 'Angular') would return only Angular items
    #Instead of having Portoflio.where(subtitle: 'Angular') we can do it in the Portfolios class directly and use
    #only .angular in the controller
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio has ben succesfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    #Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])
    #Destroy / Delete the record
    @portfolio_item.destroy
    #Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end
  
  #This method can be called only inside the class because it is private
  private
  def portfolio_params
  params.require(:portfolio).permit(:title, 
                                    :subtitle, 
                                    :body, 
                                    technologies_attributes: [:name])
  end
end
