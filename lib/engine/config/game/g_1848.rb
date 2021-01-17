# frozen_string_literal: true

# File original exported from 18xx-maker/export-rb
# https://github.com/18xx-maker/export-rb
# rubocop:disable Lint/RedundantCopDisableDirective, Layout/LineLength, Layout/HeredocIndentation

module Engine
  module Config
    module Game
      module G1848
        JSON = <<-'DATA'
{
  "filename": "1848",
  "modulename": "1848",
  "currencyFormatStr": "£%d",
  "bankCash": 10000,
  "certLimit": {
    "3": 20,
    "4": 17,
    "5": 14,
    "6": 12
  },
  "startingCash": {
    "3": 840,
    "4": 630,
    "5": 510,
    "6": 430
  },
  "capitalization": "full",
  "layout": "pointy",
  "mustSellInBlocks": false,
  "locationNames": {
    "A4": "Alice Springs",
    "A6": "Alice Springs",
    "A18": "Cairns",
    "D1": "Perth",
    "F3": "Port Lincoln",
    "B17": "Toowoomba & Ipswich",
    "B19": "Brisbane",
    "F17": "Sydney",
    "G14": "Canberra",
    "H11": "Melbourne",
    "E4": "Port Augusta",
    "G6": "Adelaide",
    "C20": "Southport",
    "E18": "Newcastle",
    "E14": "Dubbo",
    "F13": "Wagga Wagga",
    "D9": "Broken Hill",
    "H9": "Geelong",
    "H7": "Mount Gambier",
    "F5": "Port Pirie",
    "E2": "Whyalla",
    "F15": "Orange & Bathurst",
    "G10": "Ballarat & Bendigo",
    "G16": "Wollongong"
  },
  "tiles": {
    "1": 1,
    "2": 1,
    "5": 3,
    "6": 4,
    "7": 4,
    "8": 9,
    "9": 12,
    "14": 3,
    "15": 6,
    "16": 1,
    "18": 1,
    "19": 1,
    "20": 1,
    "23": 2,
    "24": 2,
    "25": 2,
    "26": 1,
    "27": 1,
    "28": 1,
    "29": 1,
    "30": 1,
    "31": 1,
    "39": 1,
    "40": 1,
    "41": 1,
    "42": 1,
    "43": 1,
    "44": 1,
    "45": 1,
    "46": 1,
    "47": 1,
    "55": 1,
    "56": 1,
    "57": 3,
    "59": 2,
    "64": 1,
    "65": 1,
    "66": 1,
    "67": 1,
    "68": 1,
    "69": 1,
    "70": 1,
    "235": 3,
    "236": 2,
    "237": 1,
    "238": 1,
    "239": 3,
    "240": 2,
    "241": 1,
    "611": 4,
    "915": 1
  },
  "market": [
    [
      "0c",
      "70",
      "80",
      "90",
      "100",
      "110",
      "120",
      "140",
      "160",
      "190",
      "220",
      "250",
      "280",
      "320",
      "360",
      "400",
      "450e"
    ],
    [
      "0c",
      "60",
      "70",
      "80",
      "90",
      "100p",
      "110",
      "130",
      "150",
      "180",
      "210",
      "240",
      "270",
      "310",
      "350",
      "390",
      "440"
    ],
    [
      "0c",
      "50",
      "60",
      "70",
      "80",
      "90p",
      "100",
      "120",
      "140",
      "170",
      "200",
      "230",
      "260",
      "300"
    ],
    [
      "0c",
      "40",
      "50",
      "60",
      "70",
      "80p",
      "90",
      "110",
      "130",
      "160",
      "190"
    ],
    [
      "0c",
      "30",
      "40",
      "50",
      "60",
      "70p",
      "80",
      "100",
      "120"
    ],
    [
      "0c",
      "20",
      "30",
      "40",
      "50",
      "60",
      "70"
    ]
  ],
  "companies": [
    {
      "sym": "P1",
      "name": "Melbourne & Hobson's Bay Railway Company",
      "value": 40,
      "discount": 10,
      "revenue": 5,
      "desc": "No special abilities."
    },
    {
      "sym": "P2",
      "name": "Sydney Railway Company",
      "value": 80,
      "discount": 10,
      "revenue": 10,
      "desc": "A Public Company who owns this private (or its Director) is entitled to a one-time discount of £40 when placing a tile on any desert hex marked by a cactus icon. This power does not go away after a 5/5+ train is purchased.",
      "abilities": [
        {
          "type": "close",
          "when": "never",
          "owner_type": "player"
        },
        {
          "type": "close",
          "when": "never",
          "owner_type": "corporation"
        },
        {
          "type": "revenue_change",
          "revenue": 0,
          "when": "5",
          "owner_type": "player"
        },
        {
          "type": "revenue_change",
          "revenue": 0,
          "when": "5",
          "owner_type": "corporation"
        },
        {
          "type":"tile_lay",
          "free": true,
          "on_phase": 3,
          "count": 1,
          "when": "track",
          "owner_type": "corporation",
          "hexes": [
            "B3",
            "B7",
            "B9",
            "C2",
            "C4",
            "C8",
            "E6",
            "E8"
          ],
          "tiles": [
            "7","8", "9"
          ]
        },
        {
          "type":"tile_lay",
          "free": true,
          "on_phase": 3,
          "count": 1,
          "when": "track",
          "owner_type": "player",
          "hexes": [
            "B3",
            "B7",
            "B9",
            "C2",
            "C4",
            "C8",
            "E6",
            "E8"
          ],
          "tiles": [
            "7","8", "9"
          ]
        }
      ]
    },
    {
      "sym": "P3",
      "name": "Tasmanian Railways",
      "value": 140,
      "discount": 30,
      "revenue": 15,
      "desc": "The Tasmania tile can be placed by a Public Company on one of the dark blue hexes. This is in addition to the company's normal build that turn."
    },
    {
      "sym": "P4",
      "name": "The Ghan",
      "value": 220,
      "discount": 50,
      "revenue": 20,
      "desc": "Owning Public Company or its Director may receive a one-time discount of £100 on the purchase of a 2E (Ghan) train. This power does not go away after a 5/5+ train is purchased.",
      "abilities": [
        {
          "type": "close",
          "when": "never",
          "owner_type": "player"
        },
        {
          "type": "close",
          "when": "never",
          "owner_type": "corporation"
        },
        {
          "type": "revenue_change",
          "revenue": 0,
          "when": "5",
          "owner_type": "player"
        },
        {
          "type": "revenue_change",
          "revenue": 0,
          "when": "5",
          "owner_type": "corporation"
        }
      ]
    },
    {
      "sym": "P5",
      "name": "Trans-Australian Railway",
      "value": 0,
      "discount": -170,
      "revenue": 25,
      "desc": "The owner receives a 10% share of the QR. Cannot be bought by a corporation",
      "abilities": [
        {
          "type": "shares",
          "shares": "QR_1"
        },
        {
            "type": "no_buy"
        }
      ]
    },
    {
      "sym": "P6",
      "name": "North Australian Railway",
      "value": 0,
      "discount": -230,
      "revenue": 30,
      "desc": "The owner receives a 20% President's share of the CAR, which must start at a par value of 100£. Cannot be bought by a corporation",
      "abilities": [
        {
            "type": "shares",
            "shares": "CAR_0"
        },
        {
            "type": "no_buy"
        }
      ]
    }
  ],
  "corporations": [
    {
      "sym": "BOE",
      "name": "Bank of England",
      "logo": "1848/BOE",
      "tokens": [],
      "text_color": "black",
      "color": "antiqueWhite"
    },
    {
      "sym": "CAR",
      "name": "Central Australian Railway",
      "logo": "1848/CAR",
      "tokens": [
        0,
        40,
        100
      ],
      "coordinates": "E4",
      "color": "#232b2b"
    },
    {
      "sym": "VR",
      "name": "Victorian Railways",
      "logo": "1848/VR",
      "tokens": [
        0,
        40,
        100
      ],
      "coordinates": "H11",
      "text_color": "black",
      "color": "gold"
    },
    {
      "sym": "NSW",
      "name": "New South Wales Railways",
      "logo": "1848/NSW",
      "tokens": [
        0,
        40,
        100,
        100
      ],
      "coordinates": "F17",
      "text_color": "black",
      "color": "orange"
    },
    {
      "sym": "SAR",
      "name": "South Australian Railway",
      "logo": "1848/SAR",
      "tokens": [
        0,
        40,
        100,
        100
      ],
      "coordinates": "G6",
      "color": "darkMagenta"
    },
    {
      "sym": "COM",
      "name": "Commonwealth Railways",
      "logo": "1848/COM",
      "tokens": [
        0,
        0,
        100,
        100,
        100
      ],
      "text_color": "black",
      "color": "darkGray"
    },
    {
      "sym": "FT",
      "name": "Federal Territory Railway",
      "logo": "1848/FT",
      "tokens": [
        0,
        40,
        100,
        100
      ],
      "coordinates": "G14",
      "color": "mediumBlue"
    },
    {
      "sym": "WA",
      "name": "West Australian Railway",
      "logo": "1848/WA",
      "tokens": [
        0,
        40,
        100,
        100,
        100
      ],
      "coordinates": "D1",
      "color": "maroon"
    },
    {
      "sym": "QR",
      "name": "Queensland Gov't Railway",
      "logo": "1848/QR",
      "tokens": [
        0,
        40,
        100,
        100,
        100
      ],
      "coordinates": "B19",
      "color": "darkGreen"
    }
  ],
  "trains": [
    {
      "name": "2+",
      "distance":[
         {
            "nodes":[
               "city",
               "offboard"
            ],
            "pay":4,
            "visit":2
         },
         {
            "nodes":[
               "town"
            ],
            "pay":99,
            "visit":99
         }
      ],
      "price": 120,
      "rusts_on": "4+",
      "num": 6,
      "variants": [
         {
           "name": "2",
           "price": 100
         }
      ]
    },
    {
      "name": "3+",
      "distance":[
         {
            "nodes":[
               "city",
               "offboard"
            ],
            "pay":5,
            "visit":3
         },
         {
            "nodes":[
               "town"
            ],
            "pay":99,
            "visit":99
         }
      ],
      "price": 230,
      "rusts_on": "6+",
      "num": 5,
      "variants": [
         {
           "name": "3",
           "price": 200
         }
      ]
    },
    {
      "name": "4+",
      "distance":[
         {
            "nodes":[
               "city",
               "offboard"
            ],
            "pay":6,
            "visit":4
         },
         {
            "nodes":[
               "town"
            ],
            "pay":99,
            "visit":99
         }
      ],
      "price": 340,
      "rusts_on": "D",
      "num": 4,
      "variants": [
         {
           "name": "4",
           "price": 300
         }
      ]
    },
    {
      "name": "5+",
      "distance":[
         {
            "nodes":[
               "city",
               "offboard"
            ],
            "pay":7,
            "visit":5
         },
         {
            "nodes":[
               "town"
            ],
            "pay":99,
            "visit":99
         }
      ],
      "price": 550,
      "num": 3,
      "variants": [
         {
           "name": "5",
           "price": 500
         }
      ],
      "events":[
        {"type": "close_companies"}
      ]
    },
    {
      "name": "6+",
      "distance":[
         {
            "nodes":[
               "city",
               "offboard"
            ],
            "pay":8,
            "visit":6
         },
         {
            "nodes":[
               "town"
            ],
            "pay":99,
            "visit":99
         }
      ],
      "price": 660,
      "num": 2,
      "variants": [
         {
           "name": "6",
           "price": 600
         }
      ]
    },
    {
      "name": "D",
      "distance": 999,
      "price": 1100,
      "num": 6,
      "discount": {
        "4": 300,
        "5": 300,
        "6": 300
      },
      "variants": [
         {
           "name": "8",
           "distance":[
              {
                 "nodes":[
                    "city",
                    "offboard"
                 ],
                 "pay":10,
                 "visit":8
              },
              {
                 "nodes":[
                    "town"
                 ],
                 "pay":99,
                 "visit":99
              }
           ],
           "price": 800
         }
      ]
    },
    {
      "name": "2E",
      "distance": 2,
      "price": 200,
      "num": 6,
      "available_on":"5"
    }
  ],
  "hexes": {
    "red": {
      "offboard=revenue:yellow_10|green_20|brown_40|gray_60;path=a:5,b:_0;path=a:0,b:_0;border=edge:4": [
        "A4"
      ],
      "offboard=revenue:yellow_10|green_20|brown_40|gray_60;path=a:5,b:_0;path=a:0,b:_0;border=edge:1": [
        "A6"
      ],
      "offboard=revenue:yellow_10|green_20|brown_30|gray_40;path=a:5,b:_0;path=a:0,b:_0": [
        "A18"
      ],
      "city=revenue:yellow_20|green_40|brown_60|gray_80;path=a:4,b:_0;path=a:5,b:_0;path=a:3,b:_0;label=K": [
        "D1"
      ]
    },
    "blue": {
      "offboard=revenue:yellow_10|green_10|brown_20|gray_20,visit_cost:0;path=a:0,b:_0": [
        "B21"
      ],
      "offboard=revenue:yellow_10|green_10|brown_20|gray_20,visit_cost:0;path=a:2,b:_0": [
        "F3"
      ],
      "": [
        "I8",
        "I10"
      ]
    },
    "white": {
      "upgrade=cost:40,terrain:desert": [
        "B3",
        "B7",
        "B9",
        "C2",
        "C4",
        "C8",
        "E6",
        "E8"
      ],
      "upgrade=cost:50,terrain:mountain": [
        "D17",
        "E16",
        "H15",
        "H13"
      ],
      "": [
        "B11",
        "B13",
        "B15",
        "B5",
        "C10",
        "C12",
        "C14",
        "C16",
        "C6",
        "D11",
        "D13",
        "D15",
        "D19",
        "D5",
        "D7",
        "E10",
        "E12",
        "F11",
        "F7",
        "F9",
        "G8"
      ],
      "city=revenue:0;city=revenue:0;label=OO": [
        "B17",
        "G10"
      ],
      "town=revenue:0;town=revenue:0;upgrade=cost:50,terrain:mountain": [
        "C18"
      ],
      "city=revenue:0;label=K": [
        "B19",
        "F17",
        "H11",
        "G6"
      ],
      "city=revenue:0": [
        "G14",
        "E4",
        "C20",
        "E18",
        "E14",
        "F13",
        "D9",
        "H9",
        "H7",
        "F5",
        "E2"
      ],
      "city=revenue:0;city=revenue:0;upgrade=cost:50,terrain:mountain;label=OO": [
        "F15"
      ],
      "town=revenue:0;town=revenue:0": [
        "G12",
        "D3"
      ],
      "city=revenue:0;upgrade=cost:50,terrain:mountain": [
        "G16"
      ]
    }
  },
  "phases": [
    {
      "name": "2",
      "train_limit": 4,
      "tiles": [
        "yellow"
      ],
      "operating_rounds": 1
    },
    {
      "name": "3",
      "on": "3+",
      "train_limit": 4,
      "tiles": [
        "yellow",
        "green"
      ],
      "operating_rounds": 2,
      "status":[
         "can_buy_companies",
         "abilities_available"
      ]
    },
    {
      "name": "4",
      "on": "4+",
      "train_limit": 3,
      "tiles": [
        "yellow",
        "green"
      ],
      "operating_rounds": 2,
      "status":[
         "can_buy_companies",
         "abilities_available"
      ]
    },
    {
      "name": "5",
      "on": "5+",
      "train_limit": 2,
      "tiles": [
        "yellow",
        "green",
        "brown"
      ],
      "operating_rounds": 3,
      "status":[
         "abilities_available"
      ]
    },
    {
      "name": "6",
      "on": "6+",
      "train_limit": 2,
      "tiles": [
        "yellow",
        "green",
        "brown"
      ],
      "operating_rounds": 3,
      "status":[
         "abilities_available"
      ]
    },
    {
      "name": "8",
      "on": "D",
      "train_limit": 2,
      "tiles": [
        "yellow",
        "green",
        "brown",
        "gray"
      ],
      "operating_rounds": 3,
      "status":[
         "abilities_available"
      ]
    }
  ]
}
        DATA
      end
    end
  end
end

# rubocop:enable Lint/RedundantCopDisableDirective, Layout/LineLength, Layout/HeredocIndentation
