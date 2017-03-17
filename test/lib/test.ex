defmodule Test do
  @valid_moves ["R", "P","S"]
  def start do
    welcome
    player_throw = take_throw
    ai_throw = get_ai_throw
    result = judge(player_throw, ai_throw)
          |> announce_winner(player_throw, ai_throw)
  end

  def welcome do
    IO.puts "Welcome to the dopest RPS ever!"
  end

  def take_throw do
  result = IO.gets("What do you want to throw? R/P/S")
        |> String.trim
        |> validate_throw
  end

  def validate_throw(player_throw) when player_throw in @valid_moves do
    player_throw
  end

  def validate_throw(_), do: take_throw

  def get_ai_throw do
    @valid_moves |> Enum.random
  end

  def judge("R", "S"), do: :win

  def judge("S", "P"), do: :win

  def judge("P", "R"), do: :win

  def judge(player, ai) when player == ai do
    :draw
  end

  def judge(_,_), do: :lose

  def announce_winner(result, player, ai) do
    IO.puts("You threw #{player}, AI threw #{ai}")
    do_announce_winner(result)
  end

  def do_announce_winner(:win), do: IO.puts "You win!"

  def do_announce_winner(:lose), do: IO.puts "You LOSE BITCH!"

  def do_announce_winner(:draw), do: IO.puts "You drew!"

end
