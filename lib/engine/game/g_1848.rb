# frozen_string_literal: true

require_relative '../config/game/g_1848'
require_relative 'company_price_up_to_face'
require_relative 'base'

module Engine
  module Game
    class G1848 < Base
      load_from_json(Config::Game::G1848::JSON)

      DEV_STAGE = :prealpha
      GAME_LOCATION = 'Australia'
      GAME_RULES_URL = 'http://ohley.de/english/1848/1848-rules.pdf'
      GAME_DESIGNER = 'Leonhard Orgler and Helmut Ohley'
      GAME_PUBLISHER = :oo_games
      GAME_INFO_URL = 'https://github.com/tobymao/18xx/wiki/1848'

      TILE_LAYS = [{ lay: true, upgrade: true }, { lay: true, upgrade: :not_if_upgraded }].freeze

      DISCARDED_TRAINS = :remove
      CLOSED_CORP_TRAINS = :removed
      SELL_BUY_ORDER = :sell_buy
      SELL_MOVEMENT = :down_block

      CERT_LIMIT = {
        3 => 20,
        4 => 17,
        5 => 14,
        6 => 12,
      }.freeze

      STATUS_TEXT = Base::STATUS_TEXT.merge('abilities_available' =>
        ['Can Use Private Abilities', 'Private abilities may be used by owning corporation or player Director']).freeze

      HOME_TOKEN_TIMING = :operate

      def new_auction_round
        Round::Auction.new(self, [
          Step::G1848::DutchAuction,
        ])
      end

      def operating_round(round_num)
        Round::Operating.new(self, [
          Step::Bankrupt,
          Step::Exchange,
          Step::DiscardTrain,
          Step::BuyCompany,
          Step::Track,
          Step::Token,
          Step::Route,
          Step::Dividend,
          Step::BuyTrain,
          [Step::BuyCompany, blocks: true],
        ], round_num: round_num)
      end

      include CompanyPriceUpToFace

      def setup
        setup_company_price_up_to_face
      end

      # TODO: Keep yellow tile labeled as "K" after it's built
      # TODO: - if hex.label = K, upgrade to K
      def upgrades_to?(from, to)
        # initially blank K hexes can upgrade to regular cities, then reserved K tiles after that
        super(from, to, false, to.cities.size == 1 && %i[yellow].any?(to.color))
      end
    end
  end
end
