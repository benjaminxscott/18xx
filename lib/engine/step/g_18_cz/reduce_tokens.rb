# frozen_string_literal: true

require_relative '../reduce_tokens'

module Engine
  module Step
    module G18CZ
      class ReduceTokens < ReduceTokens
        def description
          'Choose one token to remove from each hex with conflicting tokens'
        end

        def process_remove_token(action)
          entity = action.entity
          token = action.city.tokens[action.slot]
          raise GameError, "Cannot remove #{token.corporation.name} token" unless available_hex(entity,
                                                                                                token.city.hex)

          token.remove!
          token.price = @game.new_token_price
          @log << "#{action.entity.name} removes token from #{action.city.hex.name}"

          return if tokens_in_same_hex(entity, acquired_corps)

          move_tokens_to_surviving(entity, acquired_corps, price_for_new_token: @game.new_token_price,
                                                           check_tokenable: false)

          @game.close_corporation(acquired_corps.first)
          acquired_corps.first.close!
          @round.corporations_removing_tokens = nil
        end
      end
    end
  end
end
