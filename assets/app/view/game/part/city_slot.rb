# frozen_string_literal: true

require 'view/game/actionable'
require 'view/game/part/base'
require 'view/game/token'

module View
  module Game
    module Part
      # a "slot" is a space in a city for a token
      class CitySlot < Base
        include Actionable

        needs :token
        needs :slot_index, default: 0
        needs :city
        needs :num_cities
        needs :radius
        needs :tile_selector, default: nil, store: true
        needs :reservation, default: nil
        needs :game, default: nil, store: true

        def render_part
          children = []
          children << h(:circle, attrs: { r: @radius, fill: 'white' })
          children << reservation if @reservation
          children << h(Token, corporation: @token.corporation, radius: @radius) if @token

          props = { on: { click: -> { on_click } } }

          props[:attrs] = { transform: rotation_for_layout } if @num_cities > 1

          h(:g, props, children)
        end

        def reservation
          h(
            :text,
            { attrs: { 'text-anchor': 'middle', fill: 'black', transform: 'translate(0 9) scale(1.75)' } },
            @reservation,
          )
        end

        def on_click
          return if @token
          return unless @game.round.can_place_token?

          action = Engine::Action::PlaceToken.new(
            @game.current_entity,
            @city,
            @slot_index
          )

          process_action(action)
        end
      end
    end
  end
end
