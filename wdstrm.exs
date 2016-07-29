File.stream!("./words.txt")
|> Stream.flat_map(fn line ->
    String.split(line, [" ","\r","\n"], trim: true)
   end)
|> Enum.reduce(%{}, fn word, acc ->
    Map.update(acc, word, 1, & &1 + 1)
   end)
|> Enum.to_list()