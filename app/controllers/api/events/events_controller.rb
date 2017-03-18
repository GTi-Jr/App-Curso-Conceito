class Api::Events::EventsController < ApplicationApiController
  skip_before_filter :verify_authenticity_token
  before_action :user_api
  before_action :set_user_create, only: :create
  before_action :set_event_edit, only: :edit
  before_action :filter_week, except: :index
  before_action :check_conflicts_time, except: :index

  def index
    pag            = params[:page]           ? params[:page]           : 1
    limit          = params[:limit]          ? params[:limit]          : 30
    events =  ::Event.paginate(:page => pag, :per_page => limit).where(user_id: current_user.id)
    render :status => 200, :json => {success: true, limit: limit, page:pag, data: events }
  end

  def create
    #checar se existe nesse horario

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

  def set_user_create
    @user = User.find_by_id(current_user.id)
    unless @user
      render :status => 200, :json => {success: false, erros: "User deve existir"}
    else
      @user
    end
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
    #Event.where('start_date < ? AND end_date > ? AND user_id = ?', date, date, current_user.id)
    #Lista todos os eventos do usuario atual
    @my_events = Event.where(user_id: current_user.id)
    @my_events.each do |event|
      #verifica o dia da semana de cada evento
      event.event_week.split(',').each.with_index do |week, i|
        #se o dia da semana estiver ativo, verifica as hora pra esse dia
        if week == "1"

          params[:event_week].split(",").each.with_index do |p_week,j|
            if p_week == "1"
              jj = j+1
              c = @my_events.where("split_part(event_week, ',', #{jj}) = ?", "1").where("event_hour_start <= ? AND event_hour_end >= ?",params[:event_hour_start],params[:event_hour_end]).count
              print c
              if c >= 1
                render :status => 200, :json => {success: false, erros: "Já existe um horario para este dia da semana"}
                return true
              end
            end
          end


        end
      end
    end
    @my_events = nil
  end
end
