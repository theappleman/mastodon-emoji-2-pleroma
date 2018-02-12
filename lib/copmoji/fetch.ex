defmodule CopMoji.JSONfetch do
	def fetch(domain) do
		domain_custom_emojis(domain)
		|> HTTPoison.get
		|> handle_json(domain)
	end

	def domain_custom_emojis(domain) do
		"https://#{domain}/api/v1/custom_emojis"
	end

	def handle_json({:ok, %{status_code: 200, body: body}}, domain) do
		{:ok, Poison.Parser.parse!(body), domain}
	end
	def handle_json({_, %{status_code: _, body: _}}, _) do
		IO.puts "Something went wrong"
	end
end
