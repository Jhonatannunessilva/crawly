defmodule Epipe do
  def run([], state) do
    {:ok, state}
  end

  def run([{label, func} | rest], state) do
    case func.(state) do
      {:ok, new_state} ->
        run(rest, new_state)

      {:error, reason} ->
        {:error, label, reason, state}

      {:error, reason, new_state} ->
        {:error, label, reason, new_state}
    end
  end
end
