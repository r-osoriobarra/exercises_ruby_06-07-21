#Desafio Herencia/UML

class Appointment
    attr_reader :location, :purpose, :hour, :min
    def initialize(location, purpose, hour, min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
    def self.location
        self.location
    end
    def self.purpose
        self.purpose
    end
    def self.hour
        self.hour
    end
    def self.min
        self.min
    end
end

class MonthlyAppointment < Appointment
    attr_reader :day
    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min)
        @day = day
    end
    def self.day
        self.day
    end
    def occurs_on?(d)
        if day == d
            true
        else
            false
        end
    end

    def to_s
        "Reunión mensual en #{location} sobre #{purpose} el #{day} a la(s) #{hour}:#{min}."
    end
end

class DailyAppointment < Appointment
    def occurs_on?(h, m)
        if hour == h and min == m
            true
        else
            false
        end
    end
    def to_s
        "Reunión diaria en #{location} sobre #{purpose} a la(s) #{hour}:#{min}." 
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
    def self.day
        self.day
    end
    def self.month
        self.month
    end
    def self.year
        self.year
    end
    def occurs_on?(d, m, y)
        if day == d and month = m and year = y
            true
        else
            false
        end
    end
    def to_s
        "Reunión única en #{location} sobre #{purpose} el #{day}/#{month}/#{year} a la(s) #{hour}:#{min}."
    end
end

puts one_time = OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts one_time.occurs_on?(4, 6, 2019)
puts daily = DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts daily.occurs_on?(8, 15)
puts monthly = MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
puts monthly.occurs_on?(23)


