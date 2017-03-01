class TicketsAnswersController < ApplicationController
  # load_and_authorize_resource

  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "SERTI", sector_actions_path('serti')
    add_breadcrumb "Respostas Tickets"

    @ticket = Ticket.find(params[:ticket_id])
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.answer = params[:ticket_id]
    @ticket.user = current_user
    if @ticket.save
      redirect_to :back, flash: { success: 'Resposta cadastra com sucesso' }
    else
      flash.now[:error] = @ticket.errors.full_messages
      render :create
    end
  end

  private

  def ticket_params
    params.require(:ticket_answer).permit(
      :description
    )
  end
end
