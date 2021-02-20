# frozen_string_literal: true

require 'view/game/actionable'
require 'view/game/corporation'
require 'view/game/buy_value_input'

module View
  module Game
    class BuyCorporation < Snabberb::Component
      include Actionable
      needs :selected_corporation, default: nil, store: true
      needs :show_other_players, default: nil, store: true

      def render
        @step = @game.active_step
        @corporation = @game.current_entity
        children = []

        # TODO - only show companies that can be legally acquired (.5*share price is available)
        # TODO - max out price slider by default to the highest price affordable to buyer
        hidden_corps = false
        @show_other_players = true if @step.show_other_players
        @game.corporations.select { |item| @step.can_buy?(@corporation, item) }.each do |target|
          if @show_other_players || target.owner == @corporation.owner
            children << h(Corporation, corporation: target, selected_corporation: @selected_corporation)
            children << render_input if target == @selected_corporation
          else
            hidden_corps = true
          end
        end

        if hidden_corps
          children << h('button',
                        { on: { click: -> { store(:show_other_players, true) } } },
                        'Show corporations from other players')
        elsif @show_other_players
          children << h('button',
                        { on: { click: -> { store(:show_other_players, false) } } },
                        'Hide corporations from other players')
        end

        h(:div, [
          h(:div, { style: { marginTop: '1rem', marginBottom: '1rem', fontWeight: 'bold' } },
            "Acquire a smaller corporation and its treasury, private companies, tokens, and trains.
            Choose a price to pay for each share in players\'s hands
            between 50% and 150% of its current share price, paid out of
             #{@corporation.name}\'s current treasury of #{@game.format_currency(@corporation.cash)}."),
          *children,
        ])
      end

      def render_input
        min_price, max_price = @step.price_range(@corporation, @selected_corporation)

        h(BuyValueInput, value: @selected_corporation.share_price.price, min_value: min_price,
                         max_value: max_price,
                         size: max_price,
                         selected_entity: @selected_corporation)
      end
    end
  end
end
