class TicketsController < ApplicationController
  before_action :authenticate_user!

  def create
    @ticket = current_user.tickets.create(ticket_params)

    redirect_to @ticket.event, notice: "Thanks for getting this ticket!"
  end

  private

  def ticket_params
    params.require(:ticket).permit(:starts_at, :ends_at, :price, :total, :event_id)
  end
end
