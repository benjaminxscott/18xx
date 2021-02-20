# frozen_string_literal: true

require 'view/game/actionable'

module View
  module Game
    class DiscardTrains < Snabberb::Component
      include Actionable

      def render
        block_props = {
          style: {
            display: 'inline-block',
            verticalAlign: 'top',
          },
        }
        step = @game.active_step
        # TODO - this assumes there's only one corp thrown into crowded_corps, which unsure as to how it could happen where multiple are in there, like who chooses?
        children = []
        step.crowded_corps.map do |corporation|
          trains = step.trains(corporation).map do |train|
            @corp = corporation
            train_props = {
              style: {
                border: 'solid 1px gainsboro',
                padding: '0.5rem',
                width: 'fit-content',
              },
            }
            train_options = [h('span.margined', train_props, train.name)]
            train_options << h(:button, {
                                 on: {
                                   click: lambda {
                                     process_action(Engine::Action::DiscardTrain.new(corporation, train: train))
                                   },
                                 },
                               }, 'Discard')
            h('div.margined', train_options)
          end

          children << h(:div, block_props, [
            h(Corporation, corporation: corporation),
            h(:div, trains),
          ])

          children << h(Map, game: @game) if @game.round.operating?
        end

        h(:div, [
          h(:div, { style: { marginTop: '1rem', marginBottom: '1rem', fontWeight: 'bold' } }, "#{@corp.name} must choose trains to discard until below train limit of #{@game.phase.train_limit(@corp)}"),
          *children,
        ])
      end
    end
  end
end
