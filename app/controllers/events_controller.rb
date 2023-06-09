class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[ show index ]
  before_action :set_event, except: %i[ index new create ]

  after_action :verify_authorized, except: %i[ index ]

  def index
    @events = Event.all
  end

  def show
    begin
      authorize @event
    rescue Pundit::NotAuthorizedError
      flash.now[:alert] = I18n.t("controllers.events.wrong_pincode") if params[:pincode].present?
      render "password_form"
    end

    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
    @new_photo = @event.photos.build(params[:photo])
  end

  def new
    @event = Event.new
    authorize @event
  end

  def edit
    authorize @event
  end

  def create
    @event = current_user.events.build(event_params)

    authorize @event

    if @event.save
      redirect_to @event, notice: I18n.t("controllers.events.created")
    else
      render :new
    end
  end

  def update
    authorize @event

    if @event.update(event_params)
      redirect_to @event, notice: I18n.t("controllers.events.updated")
    else
      render :edit
    end
  end

  def destroy
    authorize @event

    @event.destroy

    redirect_to events_path, notice: I18n.t("controllers.events.destroyed")
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description, :pincode)
  end
end
