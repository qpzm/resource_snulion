class VisitorsController < ApplicationController
  def index  
    @visitors = Visitor.all
    @sum_fun = Visitor.sum(:fun)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @visitorss }
    end
  end

  def new  
    @visitor = Visitor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @visitor }
    end
  end

  def create  
    @visitor = Visitor.new(visitor_params)

    respond_to do |format|
      if @visitor.save
        flash[:notice] = 'Visitor was successfully created.'
        format.html { redirect_to(visitors_url) }
        format.xml  { render xml: @visitor, status: :created, location: @visitor }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit  
    @visitor = Visitor.find(params[:id])
  end

  def update 
    @visitor = Visitor.find(params[:id])

    respond_to do |format|
      if @visitor.update(visitor_params)
        flash[:notice] = 'Visitor was successfully updated.'
        format.html { redirect_to(visitors_url) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy  
    @visitor = Visitor.find(params[:id])
    @visitor.destroy

    respond_to do |format|
      format.html { redirect_to(visitors_url) }
      format.xml  { head :ok }
    end
  end

  def visitor_params
    params.require(:visitor).permit(:name, :fun)
  end
end
