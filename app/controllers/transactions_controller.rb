class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.where(subsidiary: current_user.subsidiary)
  end
end