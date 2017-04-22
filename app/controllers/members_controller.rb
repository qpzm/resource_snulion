class MembersController < ApplicationController
  def destroy  
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      flash[:notice] = "추방완료!"
      format.html { redirect_to(place_path(@member.place_id)) }
      format.xml  { head :ok }
    end
  end
end
