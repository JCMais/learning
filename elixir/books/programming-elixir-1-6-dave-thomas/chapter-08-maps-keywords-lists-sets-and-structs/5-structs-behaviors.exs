defmodule Attendee do
  defstruct name: "", has_paid: false, is_over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.has_paid && attendee.is_over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts("Very cheap badge for #{name}")
  end

  def print_vip_badge(%Attendee{}) do
    raise "missing name for badge"
  end
end
