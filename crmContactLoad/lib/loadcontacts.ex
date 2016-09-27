defmodule Load do
 #require CSV

  def readfile(filename) do
    stream = File.stream!(filename)

    Enum.each(stream, fn(ln) -> safelywriteline(ln) end)
    # Enum.each(stream, writeline)

  end

  def safelywriteline(ln) do
    case writeline(ln) do
        {:error, reason} -> IO.puts "Error: #{reason}"
        _ -> IO.puts "Success:"
    end


  end

  def writeline(ln) do
    IO.puts ln
    Crm.testm
  end

  def csvdecode do
     "contacts.CSV" |> Path.expand(__DIR__) |>
      File.stream! |>
        CSV.Decoder.decode(headers: true) |>
          Enum.take(2)
  end

  def csvdecode(fqfilename) do
       File.stream!(fqfilename) |>
        CSV.Decoder.decode(headers: true) |>
          Enum.take(1)
          #|> map("E-mail Address")

  end

end
