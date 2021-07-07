#Desafio Herencia/UML

class Appointment
    attr_reader :location, :purpose, :hour, :min
    def initialize(location, purpose, hour, min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end

class MonthlyAppointment < Appointment
    attr_reader :day
    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min)
        @day = day
    end

    def occurs_on?(day)
        self.day == day ? true : false
    end

    def to_s
        "Reunión mensual en #{self.location} sobre #{self.purpose} el #{self.day} a la(s) #{self.hour}:#{self.min}."
    end
end

class DailyAppointment < Appointment
    def occurs_on?(hour, min)
        self.hour == hour && self.min == min ? true : false
    end

    def to_s
        "Reunión diaria en #{self.location} sobre #{self.purpose} a la(s) #{self.hour}:#{self.min}." 
    end
end
class OneTimeAppointment < Appointment
    attr_reader :day, :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
        super(location, purpose, hour, min)
        @day = day
        @month = month
        @year = year
    end

    def occurs_on?(day, month, year)
        self.day == day && self.month == month && self.year == year ? true : false
    end

    def to_s
        "Reunión única en #{self.location} sobre #{self.purpose} el #{self.day}/#{self.month}/#{self.year} a la(s) #{self.hour}:#{self.min}."
    end
end

#creating instances
puts one_time = OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts daily = DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts monthly = MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)

#testing occurs_on? method
puts one_time.occurs_on?(4, 6, 2019)
puts daily.occurs_on?(8, 15)
puts monthly.occurs_on?(23)