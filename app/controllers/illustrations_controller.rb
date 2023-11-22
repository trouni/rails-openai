class IllustrationsController < ApplicationController
  def destroy
    @illustration = ActiveStorage::Attachment.find(params[:id])
    @character = @illustration.record
    @illustration.purge
    redirect_to character_path(@character)
  end

  private

  def character_params
    params.require(:character).permit(:photo)
  end
end
