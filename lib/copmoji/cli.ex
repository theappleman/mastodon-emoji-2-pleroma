defmodule CopMoji.CLI do
	def main(args) do
		parse_args(args)
		|> process
	end

	def parse_args(args) do
		parse = OptionParser.parse(args,
			switches: [
				help: :boolean,
				urls: :boolean,
				map:  :boolean
			],
			aliases: [
				h: :help,
				u: :urls,
				m: :map
			]
		)

		case parse do
			{[urls: true], [custom_emoji], _} -> {:urls, custom_emoji}
			{[map: true],  [custom_emoji], _} -> {:map,  custom_emoji}
			{_, _, _} -> :help
		end
	end
	
	def process({:urls, custom_emoji}) do
		CopMoji.JSONfetch.fetch(custom_emoji)
		|> CopMoji.Extract.urls
	end
	def process({:map, custom_emoji}) do
		CopMoji.JSONfetch.fetch(custom_emoji)
		|> CopMoji.Extract.mapping
	end
	def process(:help) do
		IO.puts """
		Convert (copy) Mastodon emoji into Pleroma
		---
		usage: copmoji <domain name> <-m|-u>
		"""
	end
end
