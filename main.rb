require 'telegram/bot'
require 'dotenv/load'

ANSWERS = [
  # Положительные
  'Бесспорно',
  'Предрешено',
  'Никаких сомнений',
  'Определенно да',
  'Можешь быть уверен в этом',
  # Нерешительно положительные
  'Мне кажется - да',
  'Вероятнее всего',
  'Хорошие перспективы',
  'Знаки говорят - да ',
  'Да',
  # Нейтральные
  'Пока не ясно, поробуй еще',
  'Спроси позже',
  'Лучше не рассказывать',
  'Сейчас нельзя предсказать',
  'Сконесентрируйся и спроси опять',
  # Отрицатильные
  'Даже не думай',
  'Мой ответ - нет',
  'По моим данным - нет',
  'Перспективы не очень хорошие',
  'Весьма сомнительно'
].freeze

Telegram::Bot::Client.run(ENV['TELEGRAM_TOKEN']) do |bot|
  bot.listen do |message|
    case message.text
    when '/start', '/start start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Привет, #{message.from.first_name}"
      )
    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text: ANSWERS.sample
      )
    end
  end
end
