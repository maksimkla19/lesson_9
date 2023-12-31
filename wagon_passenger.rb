require_relative 'wagon'
# methods for Wagon type :passenger
class WagonPassenger < Wagon
  attr_reader :seats, :seats_occupied

  def initialize(seats)
    @seats = seats
    @seats_occupied = 0
    validate!
    super(:passenger)
  end

  def take_seat
    raise ArgumentError, 'Свободных мест нет' if seats_free.zero?

    @seats_occupied += 1
  end

  def seats_free
    @seats - @seats_occupied
  end

  protected

  def validate!
    unless @seats > 0
      raise ArgumentError, 'Количество мест в вагоне должно быть больше 0'
    end
  end
end
