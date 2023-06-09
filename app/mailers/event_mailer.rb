class EventMailer < ApplicationMailer
  def subscription(subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = subscription.event

    mail to: @event.user.email, subject: "#{I18n.t("event_mailer.subscription.title")} #{ subscription.event.title }"
  end

  def comment(comment, email)
    @comment = comment
    @event = comment.event

    mail to: email, subject: "#{I18n.t("event_mailer.comment.title")} #{ comment.event.title }"
  end

  def photo(photo, email)
    @photo = photo
    @event = photo.event

    mail to: email, subject: "#{I18n.t("event_mailer.photo.title")} #{ photo.event.title }"
  end
end
