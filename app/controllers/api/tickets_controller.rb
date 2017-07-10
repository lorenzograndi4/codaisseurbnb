class Api::TicketsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_event

  def create
    # @ticket = current_user.tickets.new(allowed_ticket_params.merge(event_id: params[:event_id]))
    ticket = @event.tickets.create(allowed_ticket_params)

    if ticket.save
      render status: 200, json: {
        message: "Ticket reserved",
        event: @event,
        ticket: ticket
      }.to_json
    else
      render status: 422, json: {
        message: "Ticket could not be reserved",
        errors: ticket.errors
        }.to_json
    end
  end

  def update
    ticket = @event.tickets.find(params[:id])
    if ticket.update(allowed_ticket_params)
      render status: 200, json: {
        message: "Ticket updated",
        event: @event,
        ticket: ticket
      }.to_json
    else
      render status: 422, json: {
        message: "Ticket could not be updated",
        errors: ticket.errors
      }.to_json
    end
  end

  def destroy
    ticket = @event.tickets.find(params[:id])
    ticket.destroy
    render status: 200, json: {
      message: "Ticket deleted",
      event: @event,
      ticket: ticket
    }.to_json
  end

  private

  def set_event
    event = Event.find params[:event_id]
  end

  def allowed_ticket_params
    params.require(:event).permit(:amount)
  end
end
