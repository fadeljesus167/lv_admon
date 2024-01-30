class BillsController < ApplicationController
  def index
  end

  def new
    @payments = Payment.where(verified: true).order(created_at: :desc)
  end

  def show
  end
end
