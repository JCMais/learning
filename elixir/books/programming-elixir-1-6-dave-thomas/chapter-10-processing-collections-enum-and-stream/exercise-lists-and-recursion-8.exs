defmodule TaxCalculator do
  def calculate_taxes(tax_rates, orders) do
    _calculate_taxes(tax_rates, orders)
  end

  defp _calculate_taxes(tax_rates, orders) when tax_rates == [] or orders == [],
    do: 0

  # We could simply use recursion here, just adding
  #  an acc_taxes parameter, but let's follow Dave Thomas advice:
  # > Part of the process of learning to be effective in Elixir is working out for yourself
  # > when to use recursion and when to use enumerators. I recommend enumerating
  # > when you can.
  defp _calculate_taxes(tax_rates, orders) do
    Enum.map(orders, fn order ->
      order ++
        [
          total_amount:
            order[:net_amount] + (tax_rates[order[:ship_to]] || 0) * order[:net_amount]
        ]
    end)
  end

  def run do
    tax_rates = [NC: 0.075, TX: 0.08]

    orders = [
      [id: 123, ship_to: :NC, net_amount: 100.00],
      [id: 124, ship_to: :OK, net_amount: 35.50],
      [id: 125, ship_to: :TX, net_amount: 24.00],
      [id: 126, ship_to: :TX, net_amount: 44.80],
      [id: 127, ship_to: :NC, net_amount: 25.00],
      [id: 128, ship_to: :MA, net_amount: 10.00],
      [id: 129, ship_to: :CA, net_amount: 102.00],
      [id: 130, ship_to: :NC, net_amount: 50.00]
    ]

    calculate_taxes(tax_rates, orders)
  end
end
