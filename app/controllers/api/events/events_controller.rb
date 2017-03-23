class Api::Events::EventsController < ApplicationApiController
  skip_before_action :verify_authenticity_token
  #verificar se esta logado
  before_action :user_api
  before_action :set_event_edit, only: :edit
  before_action :filter_week, except: :index
  before_action :check_conflicts_time, only: [:create, :edit]

  def index
    pag = params[:page] || 1
    limit = params[:limit]  || 30
    events =  ::Event.paginate(:page => pag, :per_page => limit).where(user_id: current_user.id)
    render :status => 200, :json => {success: true, limit: limit, page:pag, data: events }
  end

  def create
    params[:user_id] = current_user.id
    event = Event.new(event_params)
    event.save!
    render :status => 200, :json => {success: true, action: 'create' ,data: event.as_json}
  end

  def edit
    @event.update(event_params)
    render :status => 200, :json => {success: true, action: 'edit' ,data: @event }
  end

  private

  def event_params
    params.permit(:name, :event_hour_start, :event_hour_end, :event_week, :user_id)
  end

  def set_event_edit
    @event = Event.where(user_id: current_user.id, id: params[:id])
    unless @event.count > 0
      render :status => 200, :json => {success: false, erros: "Event deve existir, ou user deve pertencer a este evento"}
    else
      @event
    end
  end

  def filter_week
    edit = event_params
    if !event_params[:event_week].nil? && event_params[:event_week].split(',').count != 7
      render :status => 200, :json => {success: false, erros: "[:event_week] Semana incompleta! Formato: 0,0,0,0,0,0,1"}
      return true
    end
  end

  def check_conflicts_time
    #Lista todos os eventos do usuario atual
    @my_events = Event.where(user_id: current_user.id)
    @my_events.each do |event|
      #verifica o dia da semana de cada evento (do banco)
      event.event_week.split(',').each.with_index do |week, i|
        #se o dia da semana estiver ativo, verifica as hora pra esse dia
        if week.to_i == 1
          #compara a semana enviada(params) com a semanas do banco de dados
          params[:event_week].split(",").each.with_index do |param_week,j|
            if param_week.to_i  == 1
              jj = j+1
              #a magica vem agora (verificar se existe o evento no intervalo de tempo ja cadastrado)
              count = @my_events.where("split_part(event_week, ',', #{jj}) = ?", "1").where("event_hour_start > ? OR event_hour_end > ?",params[:event_hour_start],params[:event_hour_start]).where("event_hour_start < ? OR event_hour_end < ?",params[:event_hour_end],params[:event_hour_end]).count
              if count >= 1
                render :status => 200, :json => {success: false, erros: "Já existe um horário para este dia da semana. Dia: #{t('date.abbr_day_names')[jj]}"}
                return true
              end
            end
          end
        end
      end
    end
    #zerar variavel
    @my_events = nil
  end
end
