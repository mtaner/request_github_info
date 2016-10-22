defmodule GetJSON do
  use Application
	use HTTPoison.Base

	def grabJSON do
		HTTPoison.get!("https://api.github.com/repos/mtaner/crowdcode").body
	end

	def filterJSON do
		 grabJSON
					 	|> Poison.decode!
						|> Map.fetch("open_issues")
	end

end

# created_at
# updated_at
# open_issues
