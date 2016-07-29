File.read!("./words.txt")
|> String.split(["\r","\n", " "], trim: true)
|> Enum.flat_map(fn line ->
    String.split(line, " ")
   end)
|> Enum.reduce(%{}, fn word, acc ->
    Map.update(acc, word, 1, & &1 + 1)
   end)
|> Enum.to_list()