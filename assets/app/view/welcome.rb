# frozen_string_literal: true

require 'lib/publisher'

module View
  class Welcome < Snabberb::Component
    needs :app_route, default: nil, store: true
    needs :show_intro, default: true

    def render
      children = [render_notification]
      children << render_introduction if @show_intro
      children << render_buttons

      h('div#welcome.half', children)
    end

    def render_notification
      message = <<~MESSAGE
        <p><a href='https://github.com/tobymao/18xx/wiki/1880'>1880</a> is now in Alpha.</p>
        <p>Rolling Stock, Rolling Stock Stars, 18GB, 18NY and 18USA are now in production.</p>
        <p>Learn how to get <a href='https://github.com/tobymao/18xx/wiki/Notifications'>notifications</a> by email, Slack, Discord, and Telegram.</p>
        <p>Please submit problem reports and make suggestions for improvements on
        <a href='https://github.com/tobymao/18xx/issues'>GitHub</a>. Join the
        <a href='https://join.slack.com/t/18xxgames/shared_invite/zt-8ksy028m-CSZC~G5QtiFv60_jdqqulQ'>18xx Slack</a>.
        to chat about 18xx and the website.
        </p>
        <p>The <a href='https://github.com/tobymao/18xx/wiki'>18xx.games Wiki</a> has rules, maps,
        and other information about all the games, along with an FAQ.</p>

        <p>Support our publishers: #{Lib::Publisher.link_list.join}.</p>
        <p>You can support this project on <a href='https://www.patreon.com/18xxgames'>Patreon</a>.</p>
      MESSAGE

      props = {
        style: {
          background: 'rgb(240, 229, 140)',
          color: 'black',
          marginBottom: '1rem',
        },
        props: {
          innerHTML: message,
        },
      }

      h('div#notification.padded', props)
    end

    def render_introduction
      message = <<~MESSAGE
        <p>18xx.games is a website where you can play async or real-time 18xx games (based on the system originally devised by the brilliant Francis Tresham)!
        If you are new to 18xx games then Shikoku 1889, 18Chesapeake, or 18MS are good games to begin with.</p>

        <p>You can create a Hotseat game without an account, which will let you play locally on your computer. If you want to view and join open Multiplayer games you'll need to create an account and log in</p>

        <p>Observing a game lets you rewind the game state or test alternative strategies. Your changes are saved locally and do not affect the live game.</p>
        <p>Enable Master Mode in the Tools tab to make moves for other players. This action is logged as a "master" move and should only be used with permission, e.g. "Please run my routes and pay out dividends"</p>
      MESSAGE

      props = {
        style: {
          marginBottom: '1rem',
        },
        props: {
          innerHTML: message,
        },
      }

      h('div#introduction', props)
    end

    def render_buttons
      props = {
        style: {
          margin: '1rem 0',
        },
      }

      create_props = {
        on: {
          click: -> { store(:app_route, '/new_game') },
        },
      }

      tutorial_props = {
        on: {
          click: -> { store(:app_route, '/tutorial?action=1') },
        },
      }

      h('div#buttons', props, [
        h(:button, create_props, 'CREATE A NEW GAME'),
        h(:button, tutorial_props, 'TUTORIAL'),
      ])
    end
  end
end
