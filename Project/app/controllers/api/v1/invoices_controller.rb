module Api::V1
  class InvoicesController < ApplicationController

    def show
      @invoices = Invoice.preload(:client).preload(:category)
      respond_to do |format|
          format.json { render json: @invoices, root: 'invoices' }
      end
    end

    def index
      @invoices = Invoice.preload(:client).preload(:category)
      respond_to do |format|
          format.json { render json: @invoices, root: 'invoices' }
      end
    end
  end
end
