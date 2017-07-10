class TicketsController < ApplicationController
  before_action :authenticate_user!

  def create
    # @event = Event.find(params[:event_id])
    @ticket = current_user.tickets.new(allowed_ticket_params)
    @ticket.event_id = params[:event_id]
    # alternative for previouse 2 lines:
    # @ticket = current_user.tickets.create(allowed_ticket_params.merge(event_id: params[:event_id]))

    # @ticket.set_total_price # this is done in the model now
    @ticket.save

    redirect_to @ticket.event, notice: "Thanks for getting this ticket!"
  end

  private

  def allowed_ticket_params
    params.require(:ticket).permit(:amount)
  end
end
