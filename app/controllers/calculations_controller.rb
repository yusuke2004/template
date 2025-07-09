class CalculationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_calculation, only: [:edit, :update, :destroy]

  def index
    year = params[:year]&.to_i || Date.today.year
    month = params[:month]&.to_i || Date.today.month
    date = Date.new(year, month, 1)

    @display_year = year
    @display_month = month
    range = date.beginning_of_month..date.end_of_month

    @calculations = current_user.calculations.where(date: range)
    @total_income = @calculations.where(calculation_type: "income").sum(:amount)
    @total_expense = @calculations.where(calculation_type: "expense").sum(:amount)
    @balance = @total_income - @total_expense
  end

  def new
    @calculation = Calculation.new
  end

  def create
    @calculation = current_user.calculations.build(calculation_params)
    if @calculation.save
      redirect_to calculations_path, notice: "登録が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @calculation.update(calculation_params)
      redirect_to calculations_path, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @calculation.destroy
    redirect_to calculations_path, notice: "削除しました"
  end

  private

  def set_calculation
    @calculation = current_user.calculations.find(params[:id])
  end

  def calculation_params
    params.require(:calculation).permit(:date, :amount, :calculation_type, :category_id, :note)
  end
end