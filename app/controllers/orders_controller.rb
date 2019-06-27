# frozen_string_literal: true

class OrdersController < ApplicationController
  def index; end

  def find
    @fullname = params[:fullname]
    @order = Order.find_by(id: params[:id])
    if @order && @order.fullname == @fullname

      redirect_to order_path(@order.id, @fullname)
    else
      @massage = ''
      @massage += 'Ви не ввели ключ ' if params[:id] == '' || params[:id].nil?
      @massage += 'Ви не ввели fullname ' if @fullname == '' || @fullname.nil?
      @massage += 'НЕ ЗНАЙДЕНО TOB З ТАКИМ ключом ' unless @order && params[:id] != ''
      @massage += 'Fullname не співпадає ' if @order && @order.fullname != @fullname && @fullname != ''
      render 'orders/index'
    end
  end

  def show
    @fullname ||= params[:fullname]
    @order = Order.find(params[:id])
    render 'orders/index' if !@order.fullname == @fullname
  end
end
