# frozen_string_literal: true

require 'view/game/actionable'

module View
  module Game
    class UpgradeOrDiscardTrains < Snabberb::Component
      include Actionable

      def render
        block_props = {
          style: {
            display: 'inline-block',
            verticalAlign: 'top',
          },
        }
        step = @game.active_step
        corporation = step.buying_entity

        trains = step.trains.map do |train|
          train_props = {
            style: {
              border: 'solid 1px gainsboro',
              padding: '0.5rem',
              width: 'fit-content',
            },
          }
          train_options = [h('span.margined', train_props, train.name)]

          # TODO stash this change since i don't seem to understand it very well
          if step.upgradable?(train)
            upgraded_train_name, upgrade_price = step.upgrade_info(train, corporation)
            train_options << h(:button, {
                                 on: {
                                   click: lambda {
                                     process_action(Engine::Action::SwapTrain.new(corporation, train: train))
                                   },
                                 },
                               },
                               "Upgrade to #{upgraded_train_name}
                             (#{@game.format_currency(upgrade_price)})")
          end
          train_options << h(:button, {
                               on: {
                                 click: lambda {
                                   process_action(Engine::Action::DiscardTrain.new(corporation, train: train))
                                 },
                               },
                             }, 'Scrap')
          h('div.margined', train_options)
        end
        children = []

        children << h(:div, block_props, [
          h(Corporation, corporation: corporation),
          h(:div, trains),
        ])

        children << h(Map, game: @game) if @game.round.operating?

        h(:div, [
          h(:div, { style: { marginBottom: '1rem', fontWeight: 'bold' } }, 'Upgrade or Scrap Trains'),
          *children,
        ])
      end
    end
  end
end
