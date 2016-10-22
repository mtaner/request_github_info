defmodule RequestGithubInfo.Email do
	import Bamboo.Email
	use Bamboo.Phoenix, view: RequestGithubInfo.EmailView

	def welcome_text_email(data, recipient, sender, subject) do
		new_email
		|> to(recipient)
		|> from(sender)
		|> subject(subject)
		|> text_body(data)
	end
end
