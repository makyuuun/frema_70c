class AddressesController < ApplicationController
  #before_action :set_category
  before_action :set_user_params, only: [:edit, :update]
  def edit
    @address = @user.address
  end

  def update
    @address = @user.address
    @address.update(update_params)
    unless @address.update(update_params)
      redirect_to edit_address_path(@address.id), notice: "変更できません。必須項目が入力されていません"
    end
    sign_in(:user, @user)
  end

  private
  def update_params
    params.require(:address).permit(:familyname, :firstname, :familyname_kana, :firstname_kana, :post_number, :prefecture_id, :local, :local_number, :building, :tel_number)
  end

  def set_user_params
    @user = User.find(params[:id])
  end


end





