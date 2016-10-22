defmodule GetJSON do
  use Application
	use HTTPoison.Base
	import RequestGithubInfo.Email
	import RequestGithubInfo.Mailer

	def grab_JSON(url) do
		HTTPoison.get!(url).body
	end

	def filter_JSON(section) do
		 grabJSON
		 	|> Poison.decode!
			|> Map.fetch(section)
			|> Tuple.to_list
			|> Enum.join(", ")
	end

	def send_data_via_email(recipient, sender, subject) do
		filterJSON
		|> welcome_text_email(recipient, sender, subject)
		|> deliver_now
	end

end
