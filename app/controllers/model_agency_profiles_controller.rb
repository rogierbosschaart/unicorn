class ModelAgencyProfilesController < ApplicationController
  def inbox
    @connections = Connection.all.order(created_at: :desc)
    @messages = @connections.map do |conn|
      {
        id: conn.id,
        # Отправитель: Можно использовать имя клиента или имя агента, связанного с Listing
        sender: conn.listing&.client&.name || conn.listing&.user&.f_name || "Unknown Sender",
        # Тема: Тип листинга + адрес, или просто тип
        subject: "#{conn.listing&.listing_type&.capitalize} - #{conn.listing&.address || 'No Address'}",
        # Тело сообщения: Может включать ставку и другую информацию
        body: "Rate: #{conn.rate}€ - Listing for: #{conn.listing&.client&.name || 'N/A'}. Starts: #{conn.listing&.start_date&.strftime('%Y-%m-%d') || 'N/A'}",
        # Дата: Дата начала листинга
        date: conn.listing&.start_date&.strftime('%Y-%m-%d') || 'N/A',
        # Статус прочитанного: В модели Connection нет поля 'read'.
        # Можно добавить его в Connection, или всегда считать непрочитанным для простоты.
        read: false # По умолчанию всегда непрочитано для этого примера
      }
    end

  end

  def travel
    @travels = Travel.all
    @hotels = Hotel.all
  end
end
