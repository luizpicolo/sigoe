class TicketsController < ApplicationController
  load_and_authorize_resource

  before_action :set_ticket, only: [:edit, :destroy, :update]
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "SERTI", sector_actions_path('serti')
    add_breadcrumb "Tickets"

    if current_user.it_is_part_of_the_sector?('serti')
      @tickets = Ticket.where(answer: nil)
                       .search(params[:search])
                       .order('id desc')
                       .page(params[:page])
    else
      @tickets = Ticket.includes(:user)
                       .where(users: { 'sector': current_user.sector})
                       .where(answer: nil)
                       .order('id desc')
                       .page(params[:page])
    end
  end

  def new
    add_breadcrumb "SERTI", sector_actions_path('serti')
    add_breadcrumb "Tickets", :tickets_path
    add_breadcrumb "Novo Ticket"

    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      redirect_to tickets_path, flash: { success: 'Ticket cadastro com sucesso' }
    else
      flash.now[:error] = @ticket.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb "SERTI", sector_actions_path('serti')
    add_breadcrumb "Ticket", :tickets_path
    add_breadcrumb "Atualizar Ticket"
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to tickets_path, flash: { success: 'Ticket atualizado com sucesso' }
    else
      flash.now[:error] = @ticket.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @ticket.destroy
      redirect_to :back, flash: { success: "Ticket deletado com sucesso" }
    else
      flash.now[:error] = @ticket.errors.full_messages
      render :new
    end
  end

  def close
    if Ticket.find(params[:ticket_id]).update(status: 1)
      redirect_to tickets_path, flash: { success: 'Ticket fechado com sucesso' }
    else
      flash.now[:error] = @ticket.errors.full_messages
      render :edit
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(
      :from, :to, :subject, :priority, :local, :description, :status
    )
  end
end
