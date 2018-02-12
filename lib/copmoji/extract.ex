defmodule CopMoji.Extract do
	def urls(map) do
		{:ok, body, _} = map

		extract_url(body, "")
	end

	def extract_url([header | footer], _) do
		url = get_in(header, ["url"])
		IO.puts url
		{url, extract_url(footer, "")}
	end
	def extract_url([], _) do
		[]
	end

	def mapping(map) do
		{:ok, body, dirname} = map

		custom_map(body, dirname)
	end

	def custom_map([head | tail], dirname) do
		shortcode = get_in(head, ["shortcode"])
		url = get_in(head, ["url"]) |> Path.basename

		IO.puts("#{shortcode}, /emoji/#{dirname}/#{url}")
		custom_map(tail, dirname)
	end
	def custom_map([], _) do
		[]
	end
end
