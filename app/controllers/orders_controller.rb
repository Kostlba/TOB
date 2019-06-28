# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @message = 'Напишите свой ID и ПІБ в соответствующие поля'
  end

  def find
    @fullname = params[:fullname]
    @order = Order.find_by(id: params[:id])
    if @order && @order.fullname == @fullname

      redirect_to order_path(@order.id, @fullname)
    else
      @message = 'Ви не ввели ПІБ ' if @fullname == '' || @fullname.nil?
      @message = 'Not found' unless @order && params[:id] != ''
      @message = 'ПІБ не співпадає ' if @order && @order.fullname != @fullname && @fullname != ''
      render 'orders/index'
    end
  end

  def show
    @fullname ||= params[:fullname]
    @order = Order.find(params[:id])
    render 'orders/index' if !@order.fullname == @fullname
  end
end
