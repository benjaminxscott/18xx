# frozen_string_literal: true

require_relative '../base'
require_relative '../token_merger'

module Engine
  module Step
    module G18CZ
      class BuyCorporation < Base
        include TokenMerger

        ACTIONS = %w[buy_corporation pass].freeze

        def actions(entity)
          return [] if entity != current_entity || @game.corporations.none? { |item| can_buy?(entity, item) }

          ACTIONS
        end

        def description
          'Acquire Corporation'
        end

        def process_buy_corporation(action)
          buyer = action.entity
          bought_corp = action.corporation
          price_per_share = action.price

          max_cost = bought_corp.num_player_shares * price_per_share
          raise GameError,
                "#{buyer.name} cannot buy #{bought_corp.name} for #{price_per_share} per share.
                 #{max_cost} is needed but only #{buyer.cash} available" if buyer.cash < max_cost

          @game.players.each do |player|
            num_shares = player.num_shares_of(bought_corp, ceil: false)
            next unless num_shares.positive?

            buyer.spend(num_shares * price_per_share, player)
            @log << "#{player.name} receives #{num_shares * price_per_share}
             for #{num_shares} shares of #{bought_corp.name} from #{buyer.name}"
          end
          receiving = []

          receiving << @game.format_currency(bought_corp.cash)
          bought_corp.spend(bought_corp.cash, buyer)

          companies = @game.transfer(:companies, bought_corp, buyer).map(&:name)
          receiving << "companies (#{companies.join(', ')})" if companies.any?

          trains = @game.transfer(:trains, bought_corp, buyer)

          unless trains.empty?
            receiving << "trains (#{trains.map(&:name)})"

            @round.bought_trains << {
              buyer: buyer,
              trains: trains,
            }
          end

          remove_duplicate_tokens(buyer, bought_corp)
          tokens_to_clear = tokens_in_same_hex(buyer, bought_corp)
          if tokens_to_clear
            @round.corporations_removing_tokens = [buyer, bought_corp]
          else
            move_tokens_to_surviving(buyer, bought_corp, price_for_new_token: @game.new_token_price,
                                                         check_tokenable: false)
            @game.close_corporation(bought_corp)
            bought_corp.close!
          end
          buyer.tokens.each do |token|
            # after acquisition, the larger corp forfeits their $40 token
            token.price = @game.new_token_price
          end
          receiving <<
              "and tokens (#{bought_corp.tokens.size}: hexes #{bought_corp.tokens.map do |token|
                                                              token.city&.hex&.id
                                                            end.compact.uniq})"

          @log << "#{buyer.name} buys #{bought_corp.name}
            for #{@game.format_currency(price_per_share)} per share receiving #{receiving.join(', ')}"

          return unless tokens_to_clear

        end

        def pass_description
          @acted ? 'Done (Acquire Corporations)' : 'Skip (Acquire Corporations)'
        end

        def can_buy?(entity, corporation)
          return false if entity.type == :small || !corporation.floated? || corporation.closed?

          if entity.type == :medium && corporation.type == :small ||
             entity.type == :large && (corporation.type == :small || corporation.type == :medium)
            return true
          end

          false
        end

        def show_other_players
          false
        end

        def transfer_companies(source, destination)
          return unless source.companies.any?

          transferred = @game.transfer(:companies, source, destination)

          @game.log << "#{destination.name} takes #{transferred.map(&:name).join(', ')} from #{source.name}"
        end

        def price_range(_corporation, corporation_to_boy)
          max_price = (corporation_to_boy.share_price.price * 1.5).ceil
          min_price = (corporation_to_boy.share_price.price * 0.5).ceil
          [min_price, max_price]
        end

        def tokens_in_same_hex(surviving, others)
          (surviving.tokens.map { |t| t.city&.hex } & others_tokens(others).map { |t| t.city&.hex }).any?
        end
      end
    end
  end
end
