class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)

      if @ticket.save
        redirect_to ticket_url(@ticket), notice: "Ticket criado com successo!"
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @ticket.update(ticket_params)
        redirect_to ticket_url(@ticket), notice: "Ticket editado com successo!"
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: "Ticket excluído com successo!" 
  end

  def generate_pdf
    tickets = Ticket.all

    response = HTTParty.post('http://127.0.0.1:3001/generate_pdf', :headers => { 'Content-Type' => 'application/json' }, :body => { :tickets => tickets
    }.to_json)

    File.open("#{Rails.root}/tmp/pdf/relatorios_semanais.pdf", 'wb') do |file|
      file.write(response.body)
    end

    send_file("#{Rails.root}/tmp/pdf/relatorios_semanais.pdf", filename: 'relatorios_semanais.pdf', type: 'application/pdf')
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:codigo, :descricao, :hora_inicio, :hora_fim, :dia_semana, :status)
    end
end
