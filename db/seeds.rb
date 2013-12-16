
GlucoseLevel.destroy_all
10.times do
  glucose_levels = GlucoseLevel.create!(serial_number: "FaFa-FaFa-FaFa-FaFa",
                                        glucose_value: rand(255),
                                        systolic: rand(255),
                                        diastolic: rand(255),
                                        pulse: rand(255),
                                        measured_at: rand(255),
                                        retrieved_at: rand(255),
                                        MAP: rand(255),
                                        measured_at: Time.now - (rand(3)).days - - (rand(50)).hours
                                        )
end
