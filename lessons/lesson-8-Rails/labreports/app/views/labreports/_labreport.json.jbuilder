json.extract! labreport, :id, :number_report, :title, :description, :file_name, :email
json.url labreport_url(labreport, format: :json)
