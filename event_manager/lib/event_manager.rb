require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def  legislator_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def clean_phone_number(phone_number)
  if phone_number.start_with? "1"
    phone_number.slice!(0)
  end

  phone_number.to_s.gsub(/\D+/, "").rjust(10, "0")
end

def time_targeting(array)
  array.max_by { |i| array.count(i)}
end

puts "Event Manager Initialized!"

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

hours_array = Array.new
days_array = Array.new

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislator_by_zipcode(zipcode)
  phone_number = clean_phone_number(row[:homephone])
  hour = DateTime.strptime(row[:regdate],"%m/%d/%y %H:%M").hour
  week_day = DateTime.strptime(row[:regdate],"%m/%d/%y %H:%M").wday

  form_letter = erb_template.result(binding)

  #save_thank_you_letter(id, form_letter)

  hours_array.append(hour)

  days_array.append(week_day)
end

puts "Hour: #{time_targeting(hours_array)}"
puts "Day of the week: #{time_targeting(days_array)}"