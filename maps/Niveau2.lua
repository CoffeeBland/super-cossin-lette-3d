return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "isometric",
  renderorder = "right-down",
  width = 30,
  height = 20,
  tilewidth = 128,
  tileheight = 74,
  nextlayerid = 94,
  nextobjectid = 2654,
  properties = {
    ["vars.nextMap"] = "map_jessi",
    ["vars.targetFruits"] = 6,
    ["vars.timer"] = 60
  },
  tilesets = {
    {
      name = "objects",
      firstgid = 1,
      class = "",
      tilewidth = 1152,
      tileheight = 1286,
      spacing = 0,
      margin = 0,
      columns = 0,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 1,
        height = 1
      },
      properties = {},
      wangsets = {},
      tilecount = 77,
      tiles = {
        {
          id = 89,
          properties = {
            ["height"] = 480,
            ["offsetX"] = 860,
            ["offsetY"] = 830,
            ["replaceTo[0]"] = {},
            ["replaceTo[1]"] = {
              ["id"] = 1,
              ["objectId"] = 1
            },
            ["replaceTo[2]"] = {
              ["id"] = 88,
              ["objectId"] = 88,
              ["posX"] = 36,
              ["posY"] = -355
            }
          },
          image = "../img/Arche.png",
          width = 1152,
          height = 1024
        },
        {
          id = 92,
          properties = {
            ["height"] = 1000,
            ["maxTruncateHeight"] = 230,
            ["offsetX"] = 510,
            ["offsetY"] = 1210,
            ["randomTruncateHeight"] = false,
            ["replaceTo[0]"] = {
              ["applyTruncate"] = true,
              ["flipX"] = "random",
              ["ids"] = "5,6,7"
            },
            ["replaceTo[1]"] = {
              ["flipX"] = "random",
              ["ids"] = "2,3,4",
              ["offsetByTruncate"] = true,
              ["posY"] = 0
            },
            ["truncateHeight"] = 0
          },
          image = "../img/Arbre.png",
          width = 1024,
          height = 1286
        },
        {
          id = 10,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 192,
            ["offsetY"] = 110
          },
          image = "../img/Buisson_grand-1.png",
          width = 384,
          height = 216,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 69.5,
                y = 126,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 118.5, y = 53 },
                  { x = 169, y = 20 },
                  { x = 49.5, y = -34 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 11,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 192,
            ["offsetY"] = 120
          },
          image = "../img/Buisson_grand-2.png",
          width = 384,
          height = 216,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 74,
                y = 122.54,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 125.862, y = 56.9598 },
                  { x = 179.5, y = 21.4943 },
                  { x = 52.5754, y = -36.5402 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 12,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 128,
            ["offsetY"] = 90
          },
          image = "../img/Buisson_moyen-1.png",
          width = 256,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64.7531,
                y = 97.264,
                width = 0,
                height = 0,
                rotation = 350.178,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 86.9739, y = 35.6379 },
                  { x = 124.039, y = 13.4483 },
                  { x = 36.3309, y = -22.8621 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 13,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 128,
            ["offsetY"] = 75
          },
          image = "../img/Buisson_moyen-2.png",
          width = 256,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 49.3572,
                y = 90.9749,
                width = 0,
                height = 0,
                rotation = 353.421,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 86.9739, y = 35.6379 },
                  { x = 124.039, y = 13.4483 },
                  { x = 36.3309, y = -22.8621 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 14,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 64,
            ["offsetY"] = 110
          },
          image = "../img/Buisson_petit-1.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 35.7383,
                y = 121.403,
                width = 0,
                height = 0,
                rotation = 350.178,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 40.2254, y = 15.7462 },
                  { x = 57.368, y = 5.94198 },
                  { x = 16.803, y = -10.1014 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 15,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 64,
            ["offsetY"] = 110
          },
          image = "../img/Buisson_petit-2.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 31.2356,
                y = 119.361,
                width = 0,
                height = 0,
                rotation = 350.178,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 47.5593, y = 17.8991 },
                  { x = 67.8274, y = 6.75439 },
                  { x = 19.8665, y = -11.4825 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 16,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 64,
            ["offsetY"] = 110
          },
          image = "../img/Buisson_petit-3.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 26.3998,
                y = 120.81,
                width = 0,
                height = 0,
                rotation = 350.178,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 51.3129, y = 19.3998 },
                  { x = 73.1806, y = 7.32068 },
                  { x = 21.4344, y = -12.4452 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 17,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 64,
            ["offsetY"] = 95
          },
          image = "../img/Buisson_petit-4.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 20.5561,
                y = 111.656,
                width = 0,
                height = 0,
                rotation = 354.883,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 62.4871, y = 22.0487 },
                  { x = 89.1168, y = 8.32028 },
                  { x = 26.1021, y = -14.1445 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 18,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 64,
            ["offsetY"] = 95
          },
          image = "../img/Buisson_petit-5.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 20.5561,
                y = 111.656,
                width = 0,
                height = 0,
                rotation = 354.883,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 62.4871, y = 22.0487 },
                  { x = 89.1168, y = 8.32028 },
                  { x = 26.1021, y = -14.1445 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 19,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 60
          },
          image = "../img/Champignons-1.png",
          width = 128,
          height = 74
        },
        {
          id = 20,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 60
          },
          image = "../img/Champignons-2.png",
          width = 128,
          height = 74
        },
        {
          id = 21,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 60
          },
          image = "../img/Champignons-3.png",
          width = 128,
          height = 74
        },
        {
          id = 22,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 60
          },
          image = "../img/Champignons-4.png",
          width = 128,
          height = 74
        },
        {
          id = 24,
          properties = {
            ["offsetX"] = 96,
            ["offsetY"] = 236,
            ["prefab"] = "cossin"
          },
          image = "../img/cossin.png",
          width = 192,
          height = 256
        },
        {
          id = 32,
          properties = {
            ["autoheightBulge"] = 125,
            ["fruit"] = "apple",
            ["golden"] = false,
            ["offsetX"] = 64,
            ["offsetY"] = 170,
            ["prefab"] = "fruit"
          },
          image = "../img/Fruit-1.png",
          width = 128,
          height = 192
        },
        {
          id = 33,
          properties = {
            ["autoheightBulge"] = 125,
            ["fruit"] = "banana",
            ["golden"] = false,
            ["offsetX"] = 64,
            ["offsetY"] = 170,
            ["prefab"] = "fruit"
          },
          image = "../img/Fruit-2.png",
          width = 128,
          height = 192
        },
        {
          id = 34,
          properties = {
            ["autoheightBulge"] = 125,
            ["fruit"] = "pineapple",
            ["golden"] = false,
            ["offsetX"] = 64,
            ["offsetY"] = 170,
            ["prefab"] = "fruit"
          },
          image = "../img/Fruit-3.png",
          width = 128,
          height = 192
        },
        {
          id = 35,
          properties = {
            ["autoheightBulge"] = 125,
            ["fruit"] = "pear",
            ["golden"] = false,
            ["offsetX"] = 64,
            ["offsetY"] = 170,
            ["prefab"] = "fruit"
          },
          image = "../img/Fruit-4.png",
          width = 128,
          height = 192
        },
        {
          id = 36,
          properties = {
            ["autoheightBulge"] = 125,
            ["fruit"] = "tomato",
            ["golden"] = false,
            ["offsetX"] = 64,
            ["offsetY"] = 170,
            ["prefab"] = "fruit"
          },
          image = "../img/Fruit-5.png",
          width = 128,
          height = 192
        },
        {
          id = 37,
          properties = {
            ["autoheightBulge"] = 125,
            ["fruit"] = "orange",
            ["golden"] = false,
            ["offsetX"] = 64,
            ["offsetY"] = 170,
            ["prefab"] = "fruit"
          },
          image = "../img/Fruit-6.png",
          width = 128,
          height = 192
        },
        {
          id = 38,
          properties = {
            ["autoheightBulge"] = 125,
            ["fruit"] = "mushroom",
            ["golden"] = false,
            ["offsetX"] = 64,
            ["offsetY"] = 170,
            ["prefab"] = "fruit"
          },
          image = "../img/Fruit-7.png",
          width = 128,
          height = 192
        },
        {
          id = 39,
          properties = {
            ["autoheightBulge"] = 125,
            ["fruit"] = "grape",
            ["golden"] = false,
            ["offsetX"] = 64,
            ["offsetY"] = 170,
            ["prefab"] = "fruit"
          },
          image = "../img/Fruit-8.png",
          width = 128,
          height = 192
        },
        {
          id = 40,
          properties = {
            ["autoheightBulge"] = 125,
            ["fruit"] = "durian",
            ["golden"] = false,
            ["offsetX"] = 64,
            ["offsetY"] = 170,
            ["prefab"] = "fruit"
          },
          image = "../img/Fruit-9.png",
          width = 128,
          height = 192
        },
        {
          id = 41,
          properties = {
            ["autoheightBulge"] = 125,
            ["fruit"] = "peach",
            ["golden"] = false,
            ["offsetX"] = 64,
            ["offsetY"] = 170,
            ["prefab"] = "fruit"
          },
          image = "../img/Fruit-10.png",
          width = 128,
          height = 192
        },
        {
          id = 42,
          properties = {
            ["fruit"] = "radish",
            ["golden"] = false,
            ["offsetX"] = 64,
            ["offsetY"] = 170,
            ["prefab"] = "fruit"
          },
          image = "../img/Fruit-11.png",
          width = 128,
          height = 192
        },
        {
          id = 43,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 45
          },
          image = "../img/Roche_mini-1.png",
          width = 128,
          height = 74
        },
        {
          id = 44,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 30
          },
          image = "../img/Roche_mini-2.png",
          width = 128,
          height = 74
        },
        {
          id = 45,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 30
          },
          image = "../img/Roche_mini-3.png",
          width = 128,
          height = 74
        },
        {
          id = 46,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 25
          },
          image = "../img/Roche_mini-4.png",
          width = 128,
          height = 74
        },
        {
          id = 47,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 64,
            ["offsetY"] = 100
          },
          image = "../img/Roche_moyenne-1.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 8.5,
                y = 102.5,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -2, y = 1 },
                  { x = 60.5, y = 35.5 },
                  { x = 105, y = 13 },
                  { x = 45.5, y = -20 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 48,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 64,
            ["offsetY"] = 100
          },
          image = "../img/Roche_moyenne-2.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 11,
                y = 108.5,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -1.5, y = 0 },
                  { x = 55.5, y = 27.5 },
                  { x = 106.5, y = 1.5 },
                  { x = 48, y = -25 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 49,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 64,
            ["offsetY"] = 100
          },
          image = "../img/Roche_moyenne-3.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 8,
                y = 100.5,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -1, y = 4 },
                  { x = 56, y = 31 },
                  { x = 110, y = 6 },
                  { x = 53, y = -22.5 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 50,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 64,
            ["offsetY"] = 100
          },
          image = "../img/Roche_moyenne-4.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 14,
                y = 103.5,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -5, y = -1 },
                  { x = 55.5, y = 33.5 },
                  { x = 97, y = 13.5 },
                  { x = 37.5, y = -20.5 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 51,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 64,
            ["offsetY"] = 100
          },
          image = "../img/Roche_moyenne-5.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 10.5,
                y = 107.5,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -3, y = 2 },
                  { x = 54.5, y = 29 },
                  { x = 106, y = 3.5 },
                  { x = 47, y = -22.5 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 52,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 64,
            ["offsetY"] = 100
          },
          image = "../img/Roche_moyenne-6.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 7.5,
                y = 101,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -2, y = 2 },
                  { x = 56, y = 30 },
                  { x = 114, y = 4 },
                  { x = 58, y = -22.5 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 53,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 64,
            ["offsetY"] = 40
          },
          image = "../img/Roche_petit-1.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 37.5,
                y = 45.5,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -3, y = 3 },
                  { x = 29, y = 15.5 },
                  { x = 54.5, y = 0 },
                  { x = 24.5, y = -11.5 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 54,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 64,
            ["offsetY"] = 30
          },
          image = "../img/Roche_petit-2.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 26,
                y = 45,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -2, y = -0.5 },
                  { x = 44, y = 18 },
                  { x = 73, y = -2 },
                  { x = 26, y = -17.5 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 55,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 64,
            ["offsetY"] = 35
          },
          image = "../img/Roche_petit-3.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 37,
                y = 46,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -3.5, y = -0.5 },
                  { x = 26.5, y = 12.5 },
                  { x = 62, y = -3.5 },
                  { x = 29.5, y = -14.5 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 56,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 64,
            ["offsetY"] = 40
          },
          image = "../img/Roche_petit-4.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 34.5,
                y = 49,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -3.5, y = 0 },
                  { x = 28.5, y = 14 },
                  { x = 60, y = -1.5 },
                  { x = 27, y = -13.5 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 57,
          properties = {
            ["height"] = 20,
            ["offsetX"] = 64,
            ["offsetY"] = 40
          },
          image = "../img/Roche_petit-5.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 30.5,
                y = 44.5,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 1 },
                  { x = 32, y = 19.5 },
                  { x = 63.5, y = 4.5 },
                  { x = 31, y = -12 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 62,
          properties = {
            ["offsetX"] = 128,
            ["offsetY"] = 0
          },
          image = "../img/Tuile_roche_large.png",
          width = 256,
          height = 148
        },
        {
          id = 63,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 0
          },
          image = "../img/Tuile_roche_moyen.png",
          width = 128,
          height = 72
        },
        {
          id = 64,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 0
          },
          image = "../img/Tuile_roche_petit-1.png",
          width = 128,
          height = 74
        },
        {
          id = 65,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 0
          },
          image = "../img/Tuile_roche_petit-2.png",
          width = 128,
          height = 74
        },
        {
          id = 66,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 0
          },
          image = "../img/Tuile_roche_petit-3.png",
          width = 128,
          height = 74
        },
        {
          id = 67,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 0
          },
          image = "../img/Tuile_roche_petit-4.png",
          width = 128,
          height = 74
        },
        {
          id = 68,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 0
          },
          image = "../img/Tuile_roche_petit-5.png",
          width = 128,
          height = 74
        },
        {
          id = 69,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 0
          },
          image = "../img/Tuile_roche_petit-6.png",
          width = 128,
          height = 74
        },
        {
          id = 70,
          properties = {
            ["offsetX"] = 64,
            ["offsetY"] = 0
          },
          image = "../img/Tuile_roche_petit-7.png",
          width = 128,
          height = 74
        },
        {
          id = 71,
          properties = {
            ["offsetX"] = 128,
            ["offsetY"] = 0
          },
          image = "../img/Tuile_roche_ultra.png",
          width = 256,
          height = 148
        },
        {
          id = 73,
          properties = {
            ["autoshadow"] = true,
            ["dropRange"] = 880,
            ["height"] = 80,
            ["offsetX"] = 302.5,
            ["offsetY"] = 300,
            ["prefab"] = "picnic"
          },
          image = "../img/Picnic.png",
          width = 605,
          height = 459,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 3,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 31,
                y = 260,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 8 },
                  { x = 273, y = -161.333 },
                  { x = 535, y = 5 },
                  { x = 268, y = 174 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 74,
          properties = {
            ["height"] = 120,
            ["offsetX"] = 156.5,
            ["offsetY"] = 190
          },
          image = "../img/Roche_gros_mousse-1.png",
          width = 313,
          height = 321,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 28,
                y = 235,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 1, y = 2 },
                  { x = 85, y = -53 },
                  { x = 261, y = 18 },
                  { x = 176, y = 79 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 75,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 156.5,
            ["offsetY"] = 250
          },
          image = "../img/Roche_gros_mousse-2.png",
          width = 313,
          height = 321,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 36,
                y = 224,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -3, y = 2 },
                  { x = 97, y = -59 },
                  { x = 255, y = 15 },
                  { x = 159, y = 88 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 76,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 156.5,
            ["offsetY"] = 250
          },
          image = "../img/Roche_gros_mousse-3.png",
          width = 313,
          height = 321,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 50,
                y = 241,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 100, y = -40 },
                  { x = 232, y = 27 },
                  { x = 139, y = 75 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 77,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 156.5,
            ["offsetY"] = 250
          },
          image = "../img/Roche_gros_mousse-4.png",
          width = 313,
          height = 321,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 94,
                y = 257,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -6, y = 3 },
                  { x = 71, y = -40 },
                  { x = 180, y = 18 },
                  { x = 106, y = 61 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 78,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 156.5,
            ["offsetY"] = 250
          },
          image = "../img/Roche_gros_mousse-5.png",
          width = 313,
          height = 321,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 70,
                y = 244,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 4 },
                  { x = 81, y = -33 },
                  { x = 202, y = 27 },
                  { x = 115, y = 69 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 79,
          properties = {
            ["height"] = 120,
            ["offsetX"] = 156.5,
            ["offsetY"] = 250
          },
          image = "../img/Roche_gros_mousse-6.png",
          width = 313,
          height = 321,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 25,
                y = 219,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -5, y = 12 },
                  { x = 97, y = -44 },
                  { x = 266, y = 37 },
                  { x = 165, y = 97 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 80,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 156.5,
            ["offsetY"] = 250
          },
          image = "../img/Roche_gros_mousse-7.png",
          width = 313,
          height = 321,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 75,
                y = 255,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 120, y = 61 },
                  { x = 214, y = 8 },
                  { x = 97, y = -51 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 81,
          properties = {
            ["height"] = 120,
            ["offsetX"] = 161,
            ["offsetY"] = 250
          },
          image = "../img/Roche_gros-1.png",
          width = 322,
          height = 319,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 26,
                y = 228,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 107, y = -47 },
                  { x = 266, y = 28 },
                  { x = 164, y = 84 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 82,
          properties = {
            ["height"] = 40,
            ["offsetX"] = 161,
            ["offsetY"] = 250
          },
          image = "../img/Roche_gros-2.png",
          width = 322,
          height = 319,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 85,
                y = 247,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 82, y = -40 },
                  { x = 192, y = 18 },
                  { x = 111, y = 61 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 83,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 161,
            ["offsetY"] = 240
          },
          image = "../img/Roche_gros-3.png",
          width = 322,
          height = 319,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 40,
                y = 223,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 1, y = 1 },
                  { x = 101, y = -48 },
                  { x = 256, y = 25 },
                  { x = 151, y = 82 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 84,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 161,
            ["offsetY"] = 250
          },
          image = "../img/Roche_gros-4.png",
          width = 322,
          height = 319,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 48,
                y = 230,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 91, y = -47 },
                  { x = 230, y = 27 },
                  { x = 140, y = 78 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 85,
          properties = {
            ["height"] = 120,
            ["offsetX"] = 161,
            ["offsetY"] = 250
          },
          image = "../img/Roche_gros-5.png",
          width = 322,
          height = 319,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 27,
                y = 224,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -3, y = 9 },
                  { x = 158, y = 89 },
                  { x = 266, y = 24 },
                  { x = 103, y = -50 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 86,
          properties = {
            ["height"] = 40,
            ["offsetX"] = 161,
            ["offsetY"] = 250
          },
          image = "../img/Roche_gros-6.png",
          width = 322,
          height = 319,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 77,
                y = 250,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -2, y = 4 },
                  { x = 78, y = -40 },
                  { x = 201, y = 23 },
                  { x = 118, y = 71 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 87,
          properties = {
            ["height"] = 80,
            ["offsetX"] = 161,
            ["offsetY"] = 250
          },
          image = "../img/Roche_gros-7.png",
          width = 322,
          height = 319,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 76,
                y = 250,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 89, y = -45 },
                  { x = 212, y = 17 },
                  { x = 120, y = 64 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 88,
          properties = {
            ["autoshadow"] = true,
            ["height"] = 240,
            ["lensed"] = true,
            ["offsetX"] = 400,
            ["offsetY"] = 360,
            ["posZ"] = 240
          },
          image = "../img/Arche_top.png",
          width = 961,
          height = 622,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 954,
                y = 466,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -160.667, y = -35.333 },
                  { x = -465, y = 121 },
                  { x = -855.333, y = -103 },
                  { x = -619.333, y = -238.667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 0,
          properties = {
            ["autoheightDelta"] = 220,
            ["autoshadow"] = true,
            ["height"] = 480,
            ["lensed"] = true,
            ["offsetX"] = 280,
            ["offsetY"] = 560
          },
          image = "../img/Arche_arriere.png",
          width = 1152,
          height = 1024,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 3,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 8,
                name = "",
                type = "",
                shape = "polygon",
                x = 49,
                y = 580,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -4, y = 1 },
                  { x = 174, y = 108 },
                  { x = 448, y = -31 },
                  { x = 251, y = -143 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 1,
          properties = {
            ["autoheightDelta"] = -90,
            ["autoshadow"] = true,
            ["height"] = 480,
            ["lensed"] = true,
            ["offsetX"] = 860,
            ["offsetY"] = 830
          },
          image = "../img/Arche_avant.png",
          width = 1152,
          height = 1024,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 588,
                y = 884,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -14.3333, y = 6.33333 },
                  { x = 192, y = 99 },
                  { x = 519, y = -76 },
                  { x = 321.333, y = -170 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 2,
          properties = {
            ["autoheightBulge"] = 930,
            ["autoshadow"] = true,
            ["height"] = 260,
            ["lensed"] = true,
            ["offsetX"] = 510,
            ["offsetY"] = 470,
            ["posZ"] = 740
          },
          image = "../img/Feuillage1.png",
          width = 1024,
          height = 1286,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 3,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 4,
                name = "",
                type = "",
                shape = "ellipse",
                x = 56.6667,
                y = 218,
                width = 881.251,
                height = 542.883,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 3,
          properties = {
            ["autoheightBulge"] = 930,
            ["autoshadow"] = true,
            ["height"] = 260,
            ["lensed"] = true,
            ["offsetX"] = 510,
            ["offsetY"] = 470,
            ["posZ"] = 740
          },
          image = "../img/Feuillage2.png",
          width = 1024,
          height = 1286,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 3,
                name = "",
                type = "",
                shape = "ellipse",
                x = 78.6667,
                y = 270.333,
                width = 881.251,
                height = 542.883,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 4,
          properties = {
            ["autoheightBulge"] = 930,
            ["autoshadow"] = true,
            ["height"] = 260,
            ["lensed"] = true,
            ["offsetX"] = 510,
            ["offsetY"] = 470,
            ["posZ"] = 740
          },
          image = "../img/Feuillage3.png",
          width = 1024,
          height = 1286,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "ellipse",
                x = 66.6667,
                y = 266.333,
                width = 881.251,
                height = 542.883,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 5,
          properties = {
            ["height"] = 770,
            ["offsetX"] = 510,
            ["offsetY"] = 1210
          },
          image = "../img/Tronc1.png",
          width = 1024,
          height = 1286,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 4,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 6,
                name = "",
                type = "",
                shape = "polygon",
                x = 394,
                y = 1215,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 70, y = 29 },
                  { x = 161, y = 25 },
                  { x = 222, y = 2 },
                  { x = 170, y = -45 },
                  { x = 48, y = -44 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 6,
          properties = {
            ["height"] = 770,
            ["offsetX"] = 510,
            ["offsetY"] = 1210
          },
          image = "../img/Tronc2.png",
          width = 1024,
          height = 1286,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 442,
                y = 1207,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 65.2703, y = 29 },
                  { x = 150.122, y = 25 },
                  { x = 207, y = 2 },
                  { x = 158.514, y = -45 },
                  { x = 44.7568, y = -44 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 7,
          properties = {
            ["height"] = 770,
            ["offsetX"] = 510,
            ["offsetY"] = 1210
          },
          image = "../img/Tronc3.png",
          width = 1024,
          height = 1286,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 357.765,
                y = 1214.86,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 14.2353, y = -1 },
                  { x = 85.6288, y = 32.1351 },
                  { x = 196.946, y = 27.7027 },
                  { x = 256.235, y = 1.21622 },
                  { x = 207.956, y = -49.8649 },
                  { x = 58.7169, y = -48.7568 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 91,
          properties = {
            ["offsetX"] = 160,
            ["offsetY"] = 428,
            ["prefab"] = "blonde"
          },
          image = "../img/Blonde.png",
          width = 320,
          height = 448
        }
      }
    },
    {
      name = "AutoMap Rules",
      firstgid = 94,
      class = "",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 5,
      image = "qrc:/automap-tiles.svg",
      imagewidth = 160,
      imageheight = 32,
      objectalignment = "unspecified",
      tilerendersize = "grid",
      fillmode = "preserve-aspect-fit",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      wangsets = {},
      tilecount = 5,
      tiles = {
        {
          id = 3,
          properties = {
            ["MatchType"] = "Empty"
          }
        },
        {
          id = 1,
          properties = {
            ["MatchType"] = "Ignore"
          }
        },
        {
          id = 2,
          properties = {
            ["MatchType"] = "NonEmpty"
          }
        },
        {
          id = 4,
          properties = {
            ["MatchType"] = "Other"
          }
        },
        {
          id = 0,
          properties = {
            ["MatchType"] = "Negate"
          }
        }
      }
    },
    {
      name = "tileset",
      firstgid = 99,
      class = "",
      tilewidth = 256,
      tileheight = 222,
      spacing = 0,
      margin = 0,
      columns = 0,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 1,
        height = 1
      },
      properties = {},
      wangsets = {
        {
          name = "Gazon pâle",
          class = "",
          tile = -1,
          wangsettype = "corner",
          properties = {},
          colors = {
            {
              color = { 170, 255, 127 },
              name = "gazon pâle",
              class = "",
              probability = 1,
              tile = -1,
              properties = {}
            },
            {
              color = { 255, 255, 127 },
              name = "chemin",
              class = "",
              probability = 1,
              tile = -1,
              properties = {}
            },
            {
              color = { 0, 0, 255 },
              name = "eau",
              class = "",
              probability = 1,
              tile = -1,
              properties = {}
            },
            {
              color = { 0, 170, 0 },
              name = "gazon",
              class = "",
              probability = 1,
              tile = -1,
              properties = {}
            },
            {
              color = { 170, 170, 127 },
              name = "falaise niv1",
              class = "",
              probability = 1,
              tile = -1,
              properties = {}
            },
            {
              color = { 112, 112, 83 },
              name = "falaise niv2",
              class = "",
              probability = 1,
              tile = -1,
              properties = {}
            }
          },
          wangtiles = {
            {
              wangid = { 0, 2, 0, 0, 0, 2, 0, 2 },
              tileid = 1
            },
            {
              wangid = { 0, 2, 0, 2, 0, 0, 0, 2 },
              tileid = 2
            },
            {
              wangid = { 0, 0, 0, 2, 0, 2, 0, 2 },
              tileid = 3
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 0 },
              tileid = 4
            },
            {
              wangid = { 0, 2, 0, 2, 0, 0, 0, 0 },
              tileid = 5
            },
            {
              wangid = { 0, 2, 0, 2, 0, 0, 0, 0 },
              tileid = 6
            },
            {
              wangid = { 0, 2, 0, 2, 0, 0, 0, 0 },
              tileid = 7
            },
            {
              wangid = { 0, 2, 0, 2, 0, 0, 0, 0 },
              tileid = 8
            },
            {
              wangid = { 0, 2, 0, 2, 0, 0, 0, 0 },
              tileid = 9
            },
            {
              wangid = { 0, 2, 0, 0, 0, 0, 0, 2 },
              tileid = 10
            },
            {
              wangid = { 0, 2, 0, 0, 0, 0, 0, 2 },
              tileid = 11
            },
            {
              wangid = { 0, 2, 0, 0, 0, 0, 0, 2 },
              tileid = 12
            },
            {
              wangid = { 0, 2, 0, 0, 0, 0, 0, 2 },
              tileid = 13
            },
            {
              wangid = { 0, 2, 0, 0, 0, 0, 0, 2 },
              tileid = 14
            },
            {
              wangid = { 0, 0, 0, 0, 0, 2, 0, 2 },
              tileid = 15
            },
            {
              wangid = { 0, 0, 0, 0, 0, 2, 0, 2 },
              tileid = 16
            },
            {
              wangid = { 0, 0, 0, 0, 0, 2, 0, 2 },
              tileid = 17
            },
            {
              wangid = { 0, 0, 0, 0, 0, 2, 0, 2 },
              tileid = 18
            },
            {
              wangid = { 0, 0, 0, 0, 0, 2, 0, 2 },
              tileid = 19
            },
            {
              wangid = { 0, 0, 0, 2, 0, 2, 0, 0 },
              tileid = 20
            },
            {
              wangid = { 0, 0, 0, 2, 0, 2, 0, 0 },
              tileid = 21
            },
            {
              wangid = { 0, 0, 0, 2, 0, 2, 0, 0 },
              tileid = 22
            },
            {
              wangid = { 0, 0, 0, 2, 0, 2, 0, 0 },
              tileid = 23
            },
            {
              wangid = { 0, 0, 0, 2, 0, 2, 0, 0 },
              tileid = 24
            },
            {
              wangid = { 0, 0, 0, 0, 0, 0, 0, 2 },
              tileid = 25
            },
            {
              wangid = { 0, 0, 0, 0, 0, 0, 0, 2 },
              tileid = 26
            },
            {
              wangid = { 0, 2, 0, 0, 0, 0, 0, 0 },
              tileid = 27
            },
            {
              wangid = { 0, 2, 0, 0, 0, 0, 0, 0 },
              tileid = 28
            },
            {
              wangid = { 0, 0, 0, 0, 0, 2, 0, 0 },
              tileid = 29
            },
            {
              wangid = { 0, 0, 0, 0, 0, 2, 0, 0 },
              tileid = 30
            },
            {
              wangid = { 0, 3, 0, 3, 0, 0, 0, 0 },
              tileid = 32
            },
            {
              wangid = { 0, 3, 0, 0, 0, 0, 0, 3 },
              tileid = 36
            },
            {
              wangid = { 0, 0, 0, 0, 0, 3, 0, 3 },
              tileid = 40
            },
            {
              wangid = { 0, 0, 0, 3, 0, 3, 0, 0 },
              tileid = 44
            },
            {
              wangid = { 0, 3, 0, 3, 0, 0, 0, 3 },
              tileid = 56
            },
            {
              wangid = { 0, 3, 0, 3, 0, 3, 0, 0 },
              tileid = 57
            },
            {
              wangid = { 0, 0, 0, 3, 0, 3, 0, 3 },
              tileid = 58
            },
            {
              wangid = { 0, 3, 0, 0, 0, 3, 0, 3 },
              tileid = 59
            },
            {
              wangid = { 0, 0, 0, 0, 0, 3, 0, 0 },
              tileid = 60
            },
            {
              wangid = { 0, 0, 0, 0, 0, 3, 0, 3 },
              tileid = 61
            },
            {
              wangid = { 0, 0, 0, 0, 0, 3, 0, 3 },
              tileid = 62
            },
            {
              wangid = { 0, 0, 0, 0, 0, 3, 0, 3 },
              tileid = 63
            },
            {
              wangid = { 0, 0, 0, 0, 0, 3, 0, 3 },
              tileid = 64
            },
            {
              wangid = { 0, 0, 0, 0, 0, 0, 0, 3 },
              tileid = 65
            },
            {
              wangid = { 0, 3, 0, 0, 0, 0, 0, 3 },
              tileid = 66
            },
            {
              wangid = { 0, 3, 0, 0, 0, 0, 0, 3 },
              tileid = 67
            },
            {
              wangid = { 0, 3, 0, 0, 0, 0, 0, 3 },
              tileid = 68
            },
            {
              wangid = { 0, 3, 0, 0, 0, 0, 0, 3 },
              tileid = 69
            },
            {
              wangid = { 0, 3, 0, 0, 0, 0, 0, 0 },
              tileid = 70
            },
            {
              wangid = { 0, 3, 0, 3, 0, 0, 0, 0 },
              tileid = 71
            },
            {
              wangid = { 0, 3, 0, 3, 0, 0, 0, 0 },
              tileid = 72
            },
            {
              wangid = { 0, 3, 0, 3, 0, 0, 0, 0 },
              tileid = 73
            },
            {
              wangid = { 0, 3, 0, 3, 0, 0, 0, 0 },
              tileid = 74
            },
            {
              wangid = { 0, 0, 0, 3, 0, 0, 0, 0 },
              tileid = 75
            },
            {
              wangid = { 0, 0, 0, 3, 0, 3, 0, 0 },
              tileid = 76
            },
            {
              wangid = { 0, 0, 0, 3, 0, 3, 0, 0 },
              tileid = 77
            },
            {
              wangid = { 0, 0, 0, 3, 0, 3, 0, 0 },
              tileid = 78
            },
            {
              wangid = { 0, 0, 0, 3, 0, 3, 0, 0 },
              tileid = 79
            },
            {
              wangid = { 0, 3, 0, 3, 0, 3, 0, 3 },
              tileid = 95
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 96
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 97
            },
            {
              wangid = { 0, 0, 0, 1, 0, 0, 0, 0 },
              tileid = 122
            },
            {
              wangid = { 0, 0, 0, 1, 0, 1, 0, 0 },
              tileid = 123
            },
            {
              wangid = { 0, 0, 0, 0, 0, 1, 0, 0 },
              tileid = 124
            },
            {
              wangid = { 0, 1, 0, 1, 0, 0, 0, 0 },
              tileid = 125
            },
            {
              wangid = { 0, 0, 0, 0, 0, 1, 0, 1 },
              tileid = 127
            },
            {
              wangid = { 0, 1, 0, 0, 0, 0, 0, 0 },
              tileid = 128
            },
            {
              wangid = { 0, 1, 0, 0, 0, 0, 0, 1 },
              tileid = 129
            },
            {
              wangid = { 0, 0, 0, 0, 0, 0, 0, 1 },
              tileid = 130
            },
            {
              wangid = { 0, 1, 0, 0, 0, 1, 0, 1 },
              tileid = 131
            },
            {
              wangid = { 0, 1, 0, 0, 0, 0, 0, 1 },
              tileid = 132
            },
            {
              wangid = { 0, 1, 0, 1, 0, 0, 0, 1 },
              tileid = 133
            },
            {
              wangid = { 0, 0, 0, 0, 0, 1, 0, 1 },
              tileid = 134
            },
            {
              wangid = { 0, 1, 0, 1, 0, 0, 0, 0 },
              tileid = 135
            },
            {
              wangid = { 0, 0, 0, 1, 0, 1, 0, 1 },
              tileid = 136
            },
            {
              wangid = { 0, 0, 0, 1, 0, 1, 0, 0 },
              tileid = 137
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 0 },
              tileid = 138
            },
            {
              wangid = { 0, 0, 0, 2, 0, 0, 0, 0 },
              tileid = 153
            },
            {
              wangid = { 0, 0, 0, 2, 0, 0, 0, 0 },
              tileid = 154
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 155
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 156
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 157
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 158
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 159
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 160
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 161
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 162
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 171
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 172
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 173
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 174
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 175
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 176
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 177
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 178
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 179
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 180
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 181
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 182
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 4 },
              tileid = 183
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 184
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 185
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 186
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 187
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 188
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 189
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 190
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 191
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 192
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 193
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 194
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 195
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 196
            },
            {
              wangid = { 0, 5, 0, 5, 0, 5, 0, 0 },
              tileid = 201
            },
            {
              wangid = { 0, 5, 0, 5, 0, 0, 0, 5 },
              tileid = 202
            },
            {
              wangid = { 0, 0, 0, 5, 0, 5, 0, 5 },
              tileid = 203
            },
            {
              wangid = { 0, 5, 0, 0, 0, 5, 0, 5 },
              tileid = 204
            },
            {
              wangid = { 0, 5, 0, 5, 0, 0, 0, 0 },
              tileid = 205
            },
            {
              wangid = { 0, 5, 0, 5, 0, 0, 0, 0 },
              tileid = 206
            },
            {
              wangid = { 0, 5, 0, 5, 0, 0, 0, 0 },
              tileid = 207
            },
            {
              wangid = { 0, 5, 0, 5, 0, 0, 0, 0 },
              tileid = 208
            },
            {
              wangid = { 0, 5, 0, 0, 0, 0, 0, 5 },
              tileid = 209
            },
            {
              wangid = { 0, 5, 0, 0, 0, 0, 0, 5 },
              tileid = 210
            },
            {
              wangid = { 0, 5, 0, 0, 0, 0, 0, 5 },
              tileid = 211
            },
            {
              wangid = { 0, 5, 0, 0, 0, 0, 0, 5 },
              tileid = 212
            },
            {
              wangid = { 0, 0, 0, 0, 0, 5, 0, 5 },
              tileid = 213
            },
            {
              wangid = { 0, 0, 0, 0, 0, 5, 0, 5 },
              tileid = 214
            },
            {
              wangid = { 0, 0, 0, 0, 0, 5, 0, 5 },
              tileid = 215
            },
            {
              wangid = { 0, 0, 0, 0, 0, 5, 0, 5 },
              tileid = 216
            },
            {
              wangid = { 0, 0, 0, 5, 0, 5, 0, 0 },
              tileid = 217
            },
            {
              wangid = { 0, 0, 0, 5, 0, 5, 0, 0 },
              tileid = 218
            },
            {
              wangid = { 0, 0, 0, 5, 0, 5, 0, 0 },
              tileid = 219
            },
            {
              wangid = { 0, 0, 0, 5, 0, 5, 0, 0 },
              tileid = 220
            },
            {
              wangid = { 0, 0, 0, 0, 0, 0, 0, 5 },
              tileid = 221
            },
            {
              wangid = { 0, 0, 0, 0, 0, 0, 0, 5 },
              tileid = 222
            },
            {
              wangid = { 0, 5, 0, 0, 0, 0, 0, 0 },
              tileid = 223
            },
            {
              wangid = { 0, 5, 0, 0, 0, 0, 0, 0 },
              tileid = 224
            },
            {
              wangid = { 0, 0, 0, 0, 0, 5, 0, 0 },
              tileid = 225
            },
            {
              wangid = { 0, 0, 0, 0, 0, 5, 0, 0 },
              tileid = 226
            },
            {
              wangid = { 0, 0, 0, 5, 0, 0, 0, 0 },
              tileid = 227
            },
            {
              wangid = { 0, 0, 0, 5, 0, 0, 0, 0 },
              tileid = 228
            },
            {
              wangid = { 0, 5, 0, 5, 0, 5, 0, 5 },
              tileid = 229
            },
            {
              wangid = { 0, 5, 0, 5, 0, 5, 0, 5 },
              tileid = 230
            },
            {
              wangid = { 0, 5, 0, 5, 0, 5, 0, 5 },
              tileid = 231
            },
            {
              wangid = { 0, 5, 0, 5, 0, 5, 0, 5 },
              tileid = 232
            },
            {
              wangid = { 0, 5, 0, 5, 0, 5, 0, 5 },
              tileid = 233
            },
            {
              wangid = { 0, 6, 0, 6, 0, 6, 0, 6 },
              tileid = 234
            },
            {
              wangid = { 0, 6, 0, 6, 0, 6, 0, 6 },
              tileid = 235
            },
            {
              wangid = { 0, 6, 0, 6, 0, 6, 0, 6 },
              tileid = 236
            },
            {
              wangid = { 0, 6, 0, 6, 0, 6, 0, 6 },
              tileid = 237
            },
            {
              wangid = { 0, 6, 0, 6, 0, 6, 0, 6 },
              tileid = 238
            },
            {
              wangid = { 0, 0, 0, 6, 0, 0, 0, 0 },
              tileid = 239
            },
            {
              wangid = { 0, 0, 0, 6, 0, 0, 0, 0 },
              tileid = 240
            },
            {
              wangid = { 0, 0, 0, 0, 0, 6, 0, 0 },
              tileid = 241
            },
            {
              wangid = { 0, 0, 0, 0, 0, 6, 0, 0 },
              tileid = 242
            },
            {
              wangid = { 0, 6, 0, 0, 0, 0, 0, 0 },
              tileid = 243
            },
            {
              wangid = { 0, 6, 0, 0, 0, 0, 0, 0 },
              tileid = 244
            },
            {
              wangid = { 0, 0, 0, 0, 0, 0, 0, 6 },
              tileid = 245
            },
            {
              wangid = { 0, 0, 0, 0, 0, 0, 0, 6 },
              tileid = 246
            },
            {
              wangid = { 0, 0, 0, 6, 0, 6, 0, 0 },
              tileid = 247
            },
            {
              wangid = { 0, 0, 0, 6, 0, 6, 0, 0 },
              tileid = 248
            },
            {
              wangid = { 0, 0, 0, 6, 0, 6, 0, 0 },
              tileid = 249
            },
            {
              wangid = { 0, 0, 0, 6, 0, 6, 0, 0 },
              tileid = 250
            },
            {
              wangid = { 0, 0, 0, 0, 0, 6, 0, 6 },
              tileid = 251
            },
            {
              wangid = { 0, 0, 0, 0, 0, 6, 0, 6 },
              tileid = 252
            },
            {
              wangid = { 0, 0, 0, 0, 0, 6, 0, 6 },
              tileid = 253
            },
            {
              wangid = { 0, 0, 0, 0, 0, 6, 0, 6 },
              tileid = 254
            },
            {
              wangid = { 0, 6, 0, 0, 0, 0, 0, 6 },
              tileid = 255
            },
            {
              wangid = { 0, 6, 0, 0, 0, 0, 0, 6 },
              tileid = 256
            },
            {
              wangid = { 0, 6, 0, 0, 0, 0, 0, 6 },
              tileid = 257
            },
            {
              wangid = { 0, 6, 0, 0, 0, 0, 0, 6 },
              tileid = 258
            },
            {
              wangid = { 0, 6, 0, 6, 0, 0, 0, 0 },
              tileid = 259
            },
            {
              wangid = { 0, 6, 0, 6, 0, 0, 0, 0 },
              tileid = 260
            },
            {
              wangid = { 0, 6, 0, 6, 0, 0, 0, 0 },
              tileid = 261
            },
            {
              wangid = { 0, 6, 0, 6, 0, 0, 0, 0 },
              tileid = 262
            },
            {
              wangid = { 0, 6, 0, 0, 0, 6, 0, 6 },
              tileid = 263
            },
            {
              wangid = { 0, 6, 0, 6, 0, 0, 0, 6 },
              tileid = 264
            },
            {
              wangid = { 0, 0, 0, 6, 0, 6, 0, 6 },
              tileid = 265
            },
            {
              wangid = { 0, 6, 0, 6, 0, 6, 0, 0 },
              tileid = 266
            },
            {
              wangid = { 0, 0, 0, 4, 0, 0, 0, 0 },
              tileid = 267
            },
            {
              wangid = { 0, 0, 0, 4, 0, 4, 0, 0 },
              tileid = 268
            },
            {
              wangid = { 0, 0, 0, 0, 0, 4, 0, 0 },
              tileid = 269
            },
            {
              wangid = { 0, 4, 0, 4, 0, 0, 0, 0 },
              tileid = 270
            },
            {
              wangid = { 0, 0, 0, 0, 0, 4, 0, 4 },
              tileid = 271
            },
            {
              wangid = { 0, 4, 0, 0, 0, 0, 0, 0 },
              tileid = 272
            },
            {
              wangid = { 0, 4, 0, 0, 0, 0, 0, 4 },
              tileid = 273
            },
            {
              wangid = { 0, 0, 0, 0, 0, 0, 0, 4 },
              tileid = 274
            },
            {
              wangid = { 0, 4, 0, 0, 0, 4, 0, 4 },
              tileid = 275
            },
            {
              wangid = { 0, 4, 0, 0, 0, 0, 0, 4 },
              tileid = 276
            },
            {
              wangid = { 0, 4, 0, 4, 0, 0, 0, 4 },
              tileid = 277
            },
            {
              wangid = { 0, 0, 0, 0, 0, 4, 0, 4 },
              tileid = 278
            },
            {
              wangid = { 0, 4, 0, 4, 0, 0, 0, 0 },
              tileid = 279
            },
            {
              wangid = { 0, 0, 0, 4, 0, 4, 0, 4 },
              tileid = 280
            },
            {
              wangid = { 0, 0, 0, 4, 0, 4, 0, 0 },
              tileid = 281
            },
            {
              wangid = { 0, 4, 0, 4, 0, 4, 0, 0 },
              tileid = 282
            }
          }
        }
      },
      tilecount = 250,
      tiles = {
        {
          id = 96,
          image = "../img/Tiles/Tuile_herbe-2.png",
          width = 128,
          height = 74,
          probability = 0.8
        },
        {
          id = 171,
          image = "../img/Tiles/Tuile_herbe-21.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 177,
          image = "../img/Tiles/Tuile_herbe-27.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 183,
          image = "../img/Tiles/Tuile_herbe-213.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 178,
          image = "../img/Tiles/Tuile_herbe-28.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 179,
          image = "../img/Tiles/Tuile_herbe-29.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 180,
          image = "../img/Tiles/Tuile_herbe-210.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 181,
          image = "../img/Tiles/Tuile_herbe-211.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 172,
          image = "../img/Tiles/Tuile_herbe-22.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 173,
          image = "../img/Tiles/Tuile_herbe-23.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 174,
          image = "../img/Tiles/Tuile_herbe-24.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 175,
          image = "../img/Tiles/Tuile_herbe-25.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 176,
          image = "../img/Tiles/Tuile_herbe-26.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 182,
          image = "../img/Tiles/Tuile_herbe-212.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 267,
          image = "../img/Tiles/Tuile_gazon-32.png",
          width = 128,
          height = 74
        },
        {
          id = 269,
          image = "../img/Tiles/Tuile_gazon-34.png",
          width = 128,
          height = 74
        },
        {
          id = 272,
          image = "../img/Tiles/Tuile_gazon-37.png",
          width = 128,
          height = 74
        },
        {
          id = 274,
          image = "../img/Tiles/Tuile_gazon-39.png",
          width = 128,
          height = 74
        },
        {
          id = 281,
          image = "../img/Tiles/Tuile_gazon-46.png",
          width = 128,
          height = 74
        },
        {
          id = 268,
          image = "../img/Tiles/Tuile_gazon-33.png",
          width = 128,
          height = 74
        },
        {
          id = 271,
          image = "../img/Tiles/Tuile_gazon-36.png",
          width = 128,
          height = 74
        },
        {
          id = 278,
          image = "../img/Tiles/Tuile_gazon-43.png",
          width = 128,
          height = 74
        },
        {
          id = 276,
          image = "../img/Tiles/Tuile_gazon-41.png",
          width = 128,
          height = 74
        },
        {
          id = 273,
          image = "../img/Tiles/Tuile_gazon-38.png",
          width = 128,
          height = 74
        },
        {
          id = 279,
          image = "../img/Tiles/Tuile_gazon-44.png",
          width = 128,
          height = 74
        },
        {
          id = 270,
          image = "../img/Tiles/Tuile_gazon-35.png",
          width = 128,
          height = 74
        },
        {
          id = 275,
          image = "../img/Tiles/Tuile_gazon-40.png",
          width = 128,
          height = 74
        },
        {
          id = 277,
          image = "../img/Tiles/Tuile_gazon-42.png",
          width = 128,
          height = 74
        },
        {
          id = 280,
          image = "../img/Tiles/Tuile_gazon-45.png",
          width = 128,
          height = 74
        },
        {
          id = 282,
          image = "../img/Tiles/Tuile_gazon-47.png",
          width = 128,
          height = 74
        },
        {
          id = 97,
          image = "../img/Tiles/Tuile_herbe-1.png",
          width = 128,
          height = 74,
          probability = 0.8
        },
        {
          id = 184,
          image = "../img/Tiles/Tuile_herbe-11.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 185,
          image = "../img/Tiles/Tuile_herbe-12.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 186,
          image = "../img/Tiles/Tuile_herbe-13.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 187,
          image = "../img/Tiles/Tuile_herbe-14.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 190,
          image = "../img/Tiles/Tuile_herbe-17.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 191,
          image = "../img/Tiles/Tuile_herbe-18.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 192,
          image = "../img/Tiles/Tuile_herbe-19.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 193,
          image = "../img/Tiles/Tuile_herbe-110.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 188,
          image = "../img/Tiles/Tuile_herbe-15.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 189,
          image = "../img/Tiles/Tuile_herbe-16.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 194,
          image = "../img/Tiles/Tuile_herbe-111.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 195,
          image = "../img/Tiles/Tuile_herbe-112.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 196,
          image = "../img/Tiles/Tuile_herbe-113.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 122,
          image = "../img/Tiles/Tuile_gazon-2.png",
          width = 128,
          height = 74
        },
        {
          id = 124,
          image = "../img/Tiles/Tuile_gazon-4.png",
          width = 128,
          height = 74
        },
        {
          id = 128,
          image = "../img/Tiles/Tuile_gazon-8.png",
          width = 128,
          height = 74
        },
        {
          id = 130,
          image = "../img/Tiles/Tuile_gazon-10.png",
          width = 128,
          height = 74
        },
        {
          id = 137,
          type = "gazon_edge_C",
          image = "../img/Tiles/Tuile_gazon-17.png",
          width = 128,
          height = 74,
          probability = 0.5
        },
        {
          id = 123,
          type = "gazon_edge_C",
          image = "../img/Tiles/Tuile_gazon-3.png",
          width = 128,
          height = 74,
          probability = 0.5
        },
        {
          id = 127,
          type = "gazon_edge_A",
          image = "../img/Tiles/Tuile_gazon-7.png",
          width = 128,
          height = 74,
          probability = 0.5
        },
        {
          id = 134,
          type = "gazon_edge_A",
          image = "../img/Tiles/Tuile_gazon-14.png",
          width = 128,
          height = 74,
          probability = 0.5
        },
        {
          id = 132,
          type = "gazon_edge_B",
          image = "../img/Tiles/Tuile_gazon-12.png",
          width = 128,
          height = 74,
          probability = 0.5
        },
        {
          id = 129,
          type = "gazon_edge_B",
          image = "../img/Tiles/Tuile_gazon-9.png",
          width = 128,
          height = 74,
          probability = 0.5
        },
        {
          id = 135,
          type = "gazon_edge_D",
          image = "../img/Tiles/Tuile_gazon-15.png",
          width = 128,
          height = 74,
          probability = 0.5
        },
        {
          id = 125,
          type = "gazon_edge_D",
          image = "../img/Tiles/Tuile_gazon-5.png",
          width = 128,
          height = 74,
          probability = 0.5
        },
        {
          id = 131,
          image = "../img/Tiles/Tuile_gazon-11.png",
          width = 128,
          height = 74
        },
        {
          id = 133,
          image = "../img/Tiles/Tuile_gazon-13.png",
          width = 128,
          height = 74
        },
        {
          id = 136,
          image = "../img/Tiles/Tuile_gazon-16.png",
          width = 128,
          height = 74
        },
        {
          id = 138,
          image = "../img/Tiles/Tuile_gazon-18.png",
          width = 128,
          height = 74
        },
        {
          id = 162,
          image = "../img/Tiles/Tuile_chemin-40.png",
          width = 128,
          height = 74,
          probability = 0.75
        },
        {
          id = 160,
          image = "../img/Tiles/Tuile_chemin-38.png",
          width = 128,
          height = 74,
          probability = 0.036
        },
        {
          id = 161,
          image = "../img/Tiles/Tuile_chemin-39.png",
          width = 128,
          height = 74,
          probability = 0.036
        },
        {
          id = 155,
          image = "../img/Tiles/Tuile_chemin-33.png",
          width = 128,
          height = 74,
          probability = 0.036
        },
        {
          id = 156,
          image = "../img/Tiles/Tuile_chemin-34.png",
          width = 128,
          height = 74,
          probability = 0.036
        },
        {
          id = 157,
          image = "../img/Tiles/Tuile_chemin-35.png",
          width = 128,
          height = 74,
          probability = 0.036
        },
        {
          id = 158,
          image = "../img/Tiles/Tuile_chemin-36.png",
          width = 128,
          height = 74,
          probability = 0.036
        },
        {
          id = 159,
          image = "../img/Tiles/Tuile_chemin-37.png",
          width = 128,
          height = 74,
          probability = 0.036
        },
        {
          id = 154,
          image = "../img/Tiles/Tuile_chemin-32.png",
          width = 128,
          height = 74,
          probability = 0.8
        },
        {
          id = 153,
          image = "../img/Tiles/Tuile_chemin-31.png",
          width = 128,
          height = 74,
          probability = 0.2
        },
        {
          id = 30,
          image = "../img/Tiles/Tuile_chemin-30.png",
          width = 128,
          height = 74,
          probability = 0.8
        },
        {
          id = 29,
          image = "../img/Tiles/Tuile_chemin-29.png",
          width = 128,
          height = 74,
          probability = 0.2
        },
        {
          id = 28,
          image = "../img/Tiles/Tuile_chemin-28.png",
          width = 128,
          height = 74,
          probability = 0.8
        },
        {
          id = 27,
          image = "../img/Tiles/Tuile_chemin-27.png",
          width = 128,
          height = 74,
          probability = 0.2
        },
        {
          id = 26,
          image = "../img/Tiles/Tuile_chemin-26.png",
          width = 128,
          height = 74,
          probability = 0.8
        },
        {
          id = 25,
          image = "../img/Tiles/Tuile_chemin-25.png",
          width = 128,
          height = 74,
          probability = 0.2
        },
        {
          id = 24,
          image = "../img/Tiles/Tuile_chemin-24.png",
          width = 128,
          height = 74,
          probability = 0.5
        },
        {
          id = 21,
          image = "../img/Tiles/Tuile_chemin-21.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 20,
          image = "../img/Tiles/Tuile_chemin-20.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 22,
          image = "../img/Tiles/Tuile_chemin-22.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 23,
          image = "../img/Tiles/Tuile_chemin-23.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 19,
          image = "../img/Tiles/Tuile_chemin-19.png",
          width = 128,
          height = 74,
          probability = 0.5
        },
        {
          id = 15,
          image = "../img/Tiles/Tuile_chemin-15.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 18,
          image = "../img/Tiles/Tuile_chemin-18.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 16,
          image = "../img/Tiles/Tuile_chemin-16.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 17,
          image = "../img/Tiles/Tuile_chemin-17.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 14,
          image = "../img/Tiles/Tuile_chemin-14.png",
          width = 128,
          height = 74,
          probability = 0.5
        },
        {
          id = 12,
          image = "../img/Tiles/Tuile_chemin-12.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 13,
          image = "../img/Tiles/Tuile_chemin-13.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 10,
          image = "../img/Tiles/Tuile_chemin-10.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 11,
          image = "../img/Tiles/Tuile_chemin-11.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 9,
          image = "../img/Tiles/Tuile_chemin-9.png",
          width = 128,
          height = 74,
          probability = 0.5
        },
        {
          id = 7,
          image = "../img/Tiles/Tuile_chemin-7.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 5,
          image = "../img/Tiles/Tuile_chemin-5.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 6,
          image = "../img/Tiles/Tuile_chemin-6.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 8,
          image = "../img/Tiles/Tuile_chemin-8.png",
          width = 128,
          height = 74,
          probability = 0.125
        },
        {
          id = 1,
          image = "../img/Tiles/Tuile_chemin-1.png",
          width = 128,
          height = 74
        },
        {
          id = 2,
          image = "../img/Tiles/Tuile_chemin-2.png",
          width = 128,
          height = 74
        },
        {
          id = 3,
          image = "../img/Tiles/Tuile_chemin-3.png",
          width = 128,
          height = 74
        },
        {
          id = 4,
          image = "../img/Tiles/Tuile_chemin-4.png",
          width = 128,
          height = 74
        },
        {
          id = 167,
          image = "../img/Tiles/Tuile_chemin_courbe-1.png",
          width = 256,
          height = 74
        },
        {
          id = 168,
          image = "../img/Tiles/Tuile_chemin_courbe-2.png",
          width = 128,
          height = 148
        },
        {
          id = 169,
          image = "../img/Tiles/Tuile_chemin_courbe-3.png",
          width = 256,
          height = 74
        },
        {
          id = 170,
          image = "../img/Tiles/Tuile_chemin_courbe-4.png",
          width = 128,
          height = 148
        },
        {
          id = 197,
          image = "../img/Tiles/Tuile_chemin_courbe-5.png",
          width = 256,
          height = 74
        },
        {
          id = 198,
          image = "../img/Tiles/Tuile_chemin_courbe-6.png",
          width = 256,
          height = 74
        },
        {
          id = 199,
          image = "../img/Tiles/Tuile_chemin_courbe-7.png",
          width = 128,
          height = 148
        },
        {
          id = 200,
          image = "../img/Tiles/Tuile_chemin_courbe-8.png",
          width = 128,
          height = 148
        },
        {
          id = 95,
          properties = {
            ["anim"] = "center",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-1.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 0,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = 37 },
                  { x = 0, y = 74 },
                  { x = -64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 75,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-21.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 3,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 6,
                y = 42.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 75, y = -15 },
                  { x = 117.333, y = -1.66667 },
                  { x = 58.3333, y = 33 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 60,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-6.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 61.6667,
                y = -2.66667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 4.33333, y = 45 },
                  { x = -2, y = 76.3333 },
                  { x = -70.6667, y = 36.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 70,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-16.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 71.3333,
                y = -2,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -17.3333, y = 37.3333 },
                  { x = -0.333333, y = 75.3333 },
                  { x = 64.6667, y = 36.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 65,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-11.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 4.33333,
                y = 33.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -3, y = 0.333333 },
                  { x = 52, y = 1.33333 },
                  { x = 126.333, y = 2.33333 },
                  { x = 59, y = -37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 44,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-14.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 51,
                y = 0.333333,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 73.6667, y = 40.3333 },
                  { x = 10.6667, y = 77.3333 },
                  { x = -57, y = 35.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 76,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-22.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 56.3333,
                y = -2.66667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0.666667, y = 2.66667 },
                  { x = 19.3333, y = 34.6667 },
                  { x = 68.6667, y = 44 },
                  { x = 7, y = 80 },
                  { x = -61.6667, y = 38.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 77,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-23.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 56.6667,
                y = -0.666667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 1, y = 2.66667 },
                  { x = 22.3333, y = 27 },
                  { x = 67.6667, y = 42 },
                  { x = 7, y = 77.3333 },
                  { x = -61.6667, y = 36.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 78,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-24.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 55.6667,
                y = -0.333333,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -61.6667, y = 37.3333 },
                  { x = 9.33333, y = 76.6667 },
                  { x = 70.3333, y = 42.3333 },
                  { x = 20, y = 17.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 79,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-25.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 55.3333,
                y = -1.66667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 23, y = 28.3333 },
                  { x = 69, y = 43.3333 },
                  { x = 8.66667, y = 78.6667 },
                  { x = -61.6667, y = 37.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 40,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-10.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 55.3333,
                y = 71,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 68.3333, y = -41 },
                  { x = 7, y = -73.6667 },
                  { x = -58.6667, y = -34.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 62,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-8.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 56,
                y = 72,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 36, y = -26.6667 },
                  { x = 70, y = -40.3333 },
                  { x = 7, y = -76 },
                  { x = -62, y = -34.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 61,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-7.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 56,
                y = 73.3333,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 31.3333, y = -32.3333 },
                  { x = 71.3333, y = -41.3333 },
                  { x = 6.33333, y = -77.3333 },
                  { x = -60.6667, y = -36.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 64,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-10.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 55.3333,
                y = 73.3333,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 37, y = -29.3333 },
                  { x = 70.6667, y = -41.3333 },
                  { x = 8.33333, y = -77.3333 },
                  { x = -60.3333, y = -36 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 63,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-9.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 55.3333,
                y = 73,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 33.3333, y = -24.3333 },
                  { x = 70.6667, y = -41.6667 },
                  { x = 8, y = -77.6667 },
                  { x = -60.6667, y = -36 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 66,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-12.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 1.66667,
                y = 32.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 44.3333, y = 13 },
                  { x = 70, y = 40 },
                  { x = 134, y = 4 },
                  { x = 61, y = -37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 36,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-6.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 3.33333,
                y = 30.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 46, y = 15.3333 },
                  { x = 67.3333, y = 41.6667 },
                  { x = 132, y = 4.66667 },
                  { x = 60, y = -35 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 67,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-13.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = -0.333333,
                y = 30.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 1.66667, y = 1.33333 },
                  { x = 42, y = 16.6667 },
                  { x = 72.6667, y = 42 },
                  { x = 134, y = 5.66667 },
                  { x = 63, y = -34.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 68,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-14.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 2.66667,
                y = 30.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 37.6667, y = 18.3333 },
                  { x = 69.3333, y = 42.3333 },
                  { x = 131, y = 6 },
                  { x = 59, y = -34 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 69,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-15.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 4.66667,
                y = 28,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 45.3333, y = 14 },
                  { x = 65.6667, y = 44.6667 },
                  { x = 131.667, y = 8 },
                  { x = 57, y = -33.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 32,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-2.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 3.5,
                y = 42.5,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 69.5, y = -41.5 },
                  { x = 129, y = -6.5 },
                  { x = 60.5, y = 34.5 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 73,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-19.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 1.66667,
                y = 42.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 44, y = -20.3333 },
                  { x = 68.6667, y = -42.3333 },
                  { x = 132.333, y = -5.33333 },
                  { x = 63.6667, y = 33.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 74,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-20.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 4,
                y = 42.3333,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 44.3333, y = -13 },
                  { x = 67.3333, y = -43.3333 },
                  { x = 128.333, y = -6 },
                  { x = 59, y = 35.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 71,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-17.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 2.66667,
                y = 43,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 2, y = -1 },
                  { x = 47.6667, y = -17 },
                  { x = 68.3333, y = -41.3333 },
                  { x = 130.333, y = -6.66667 },
                  { x = 60.6667, y = 33.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 72,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-18.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 4.33333,
                y = 42.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 40.3333, y = -14 },
                  { x = 67, y = -42.3333 },
                  { x = 129, y = -6 },
                  { x = 57.6667, y = 34.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 59,
          properties = {
            ["anim"] = "center",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-5.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 53,
                y = 70.3333,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 23.6667, y = 0.333333 },
                  { x = 82.3333, y = -34.6667 },
                  { x = 8.66667, y = -75.6667 },
                  { x = -58.3333, y = -33.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 56,
          properties = {
            ["anim"] = "center",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-2.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 4,
                y = 30,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 0, y = 13.3333 },
                  { x = 60, y = 46.6667 },
                  { x = 132.667, y = 5 },
                  { x = 58.3333, y = -35 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 58,
          properties = {
            ["anim"] = "center",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-4.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 123,
                y = 30.3333,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 0.666667, y = 13.3333 },
                  { x = -60, y = 47.3333 },
                  { x = -130, y = 6 },
                  { x = -59.3333, y = -34 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 57,
          properties = {
            ["anim"] = "center",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau-3.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 55.6667,
                y = 2.33333,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 18.6667, y = -0.333333 },
                  { x = 78.6667, y = 34.3333 },
                  { x = 8, y = 76.6667 },
                  { x = -63, y = 34.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 52,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-22.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 4,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 3,
                name = "",
                type = "",
                shape = "polygon",
                x = 62,
                y = -3.66667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -66, y = 40.3333 },
                  { x = 4, y = 80 },
                  { x = -17, y = 42.3333 },
                  { x = -6.66667, y = 12 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 54,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-24.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = -6,
                y = 34.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 65.6667, y = 13.3333 },
                  { x = 138.667, y = -3 },
                  { x = 105, y = 46.3333 },
                  { x = 48.3333, y = 45.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 50,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-20.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = -3.66667,
                y = 36.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 61, y = -9.33333 },
                  { x = 138, y = 4.33333 },
                  { x = 99, y = -40.3333 },
                  { x = 48, y = -39 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 48,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-18.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 3,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 62.3333,
                y = -5.66667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = -0.333333, y = 2 },
                  { x = 27, y = 35.3333 },
                  { x = 21.6667, y = 60 },
                  { x = -0.333333, y = 81.6667 },
                  { x = 70.3333, y = 41.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 51,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-21.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = -1.33333,
                y = 43.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 77.3333, y = -45.6667 },
                  { x = 4.66667, y = -43.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 53,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-23.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 3,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = -9.66667,
                y = 34,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 40.3333, y = 11.3333 },
                  { x = 82.3333, y = 45.3333 },
                  { x = 28.3333, y = 23 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 47,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-17.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 49.3333,
                y = 76.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 83, y = -47.3333 },
                  { x = 85.3333, y = 1.66667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 49,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-19.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 61.6667,
                y = -10,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 21, y = 33.6667 },
                  { x = 80, y = 50.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 31,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-1.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 3,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 1.5,
                y = 41.5,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 103.5, y = -22.5 },
                  { x = 133.5, y = -6 },
                  { x = 61, y = 36.5 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 46,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-16.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 25.3333,
                y = 55,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 82.6667, y = -4.33333 },
                  { x = 38.3333, y = 22 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 45,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-15.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 36,
                y = 11.3333,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 31.3333, y = 17 },
                  { x = 89.3333, y = 29.3333 },
                  { x = 27, y = 65.3333 },
                  { x = -42, y = 25.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 43,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-13.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 57,
                y = 0.333333,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 9.33333, y = 14.3333 },
                  { x = 45, y = 54.3333 },
                  { x = 5.66667, y = 77.3333 },
                  { x = -62, y = 36.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 42,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-12.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 37,
                y = 12.3333,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -2, y = 21 },
                  { x = -17.3333, y = 38.3333 },
                  { x = -42.3333, y = 24.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 41,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-11.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 84.6667,
                y = 8.66667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 5, y = 32.6667 },
                  { x = -26.3333, y = 65 },
                  { x = -90.3333, y = 28.3333 },
                  { x = -20.6667, y = -12 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 39,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-9.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 20.3333,
                y = 52,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 36.6667, y = -2.66667 },
                  { x = 69.6667, y = -18.3333 },
                  { x = 105, y = -19.6667 },
                  { x = 41.6667, y = -56.3333 },
                  { x = -23.6667, y = -15.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 38,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-8.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 28,
                y = 17.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 65.3333, y = -5 },
                  { x = 37.6667, y = -21.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 37,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-7.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 7,
                y = 28.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 33.3333, y = 17.3333 },
                  { x = 50.3333, y = 10.6667 },
                  { x = 92.6667, y = 27.6667 },
                  { x = 126.333, y = 7.33333 },
                  { x = 54.6667, y = -32.6667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 35,
          properties = {
            ["anim"] = "tlbr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-5.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 33.6667,
                y = 14.6667,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 34.6667, y = 58.6667 },
                  { x = 100.667, y = 21.3333 },
                  { x = 28, y = -18.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 34,
          properties = {
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-4.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 104,
                y = 16.5,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 0.5, y = 38 },
                  { x = 28, y = 20 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 33,
          properties = {
            ["anim"] = "bltr",
            ["type"] = "water"
          },
          image = "../img/Tiles/Tuile_eau_courbe-3.png",
          width = 128,
          height = 74,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 68,
                y = 0,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -37, y = 59.5 },
                  { x = -4, y = 77.5 },
                  { x = 67, y = 34.5 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 233,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-33.png",
          width = 128,
          height = 148,
          probability = 0.6,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 3,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 74,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = 37 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 229,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-29.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 231,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-31.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 232,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-32.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 230,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-30.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 228,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-28.png",
          width = 128,
          height = 148,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 3,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 2,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 35.3333, y = -20.6667 },
                  { x = 90.3333, y = -20 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 227,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-27.png",
          width = 128,
          height = 148,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 35.3333, y = -20.6667 },
                  { x = 90.3333, y = -20 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 226,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-26.png",
          width = 128,
          height = 148,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 89, y = -14.3333 },
                  { x = 90, y = 9.33333 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 225,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-25.png",
          width = 128,
          height = 148,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 89.6667, y = -8.66667 },
                  { x = 89.6667, y = 10.6667 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 224,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-24.png",
          width = 128,
          height = 148,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 148,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 0, y = -74 },
                  { x = -19, y = -56.3333 },
                  { x = -19, y = -29.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 223,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-23.png",
          width = 128,
          height = 148,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 74,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -19.6667, y = 18.6667 },
                  { x = -19.3333, y = 46 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 222,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-22.png",
          width = 128,
          height = 148,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 85.6667, y = 13.6667 },
                  { x = 39, y = 15.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 221,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-21.png",
          width = 128,
          height = 148,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 38.3333, y = 16.6667 },
                  { x = 81.6667, y = 16 },
                  { x = 128, y = 0 },
                  { x = 64, y = -37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 220,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-20.png",
          width = 128,
          height = 148,
          probability = 0.7,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 74,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = 37 },
                  { x = 0, y = 74 },
                  { x = -64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 218,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-18.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 74,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = 37 },
                  { x = 0, y = 74 },
                  { x = -64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 219,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-19.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 74,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = 37 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 217,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-17.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 74,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = 37 },
                  { x = 0, y = 74 },
                  { x = -64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 216,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-16.png",
          width = 128,
          height = 148,
          probability = 0.7,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 121.796,
                y = 108.855,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 1.52245, y = 1.42109e-14 },
                  { x = -60.898, y = 35.7776 },
                  { x = -121.796, y = 0.761225 },
                  { x = -59.3756, y = -33.4939 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 213,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-13.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 74,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = 37 },
                  { x = 0, y = 74 },
                  { x = -64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 214,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-14.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 215,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-15.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 74,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = 37 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 212,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-12.png",
          width = 128,
          height = 148,
          probability = 0.7,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 74,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = 37 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 211,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-11.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 148,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 0, y = -74 },
                  { x = -64, y = -37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 209,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-9.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 210,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-10.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 208,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-8.png",
          width = 128,
          height = 148,
          probability = 0.7,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 206,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-6.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 205,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-5.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 207,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-7.png",
          width = 128,
          height = 148,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 204,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-4.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 202,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-2.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 203,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-3.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 201,
          properties = {
            ["height"] = 75
          },
          image = "../img/Tiles/Niveau1-1.png",
          width = 128,
          height = 148,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 111,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 234,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-1.png",
          width = 128,
          height = 222,
          probability = 0.6,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 235,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-2.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 236,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-3.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 237,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-4.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 238,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-5.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 239,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-6.png",
          width = 128,
          height = 222,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 35.3333, y = -20.6667 },
                  { x = 90.3333, y = -20 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 240,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-7.png",
          width = 128,
          height = 222,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 35.3333, y = -20.6667 },
                  { x = 90.3333, y = -20 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 241,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-8.png",
          width = 128,
          height = 222,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 89.6667, y = -8.66667 },
                  { x = 89.6667, y = 10.6667 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 242,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-9.png",
          width = 128,
          height = 222,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 89.6667, y = -8.66667 },
                  { x = 89.6667, y = 10.6667 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 243,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-10.png",
          width = 128,
          height = 222,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 222,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 0, y = -74 },
                  { x = -19, y = -56.3333 },
                  { x = -19, y = -29.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 244,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-11.png",
          width = 128,
          height = 222,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 222,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 0, y = -74 },
                  { x = -19, y = -56.3333 },
                  { x = -19, y = -29.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 245,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-12.png",
          width = 128,
          height = 222,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 85.6667, y = 13.6667 },
                  { x = 39, y = 15.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 246,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-13.png",
          width = 128,
          height = 222,
          probability = 0.5,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 85.6667, y = 13.6667 },
                  { x = 39, y = 15.3333 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 247,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-14.png",
          width = 128,
          height = 222,
          probability = 0.7,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 148,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = 37 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 248,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-15.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 148,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = 37 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 249,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-16.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 148,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = 37 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 250,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-17.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 148,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = 37 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 251,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-18.png",
          width = 128,
          height = 222,
          probability = 0.7,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 148,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = 37 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 252,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-19.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 148,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = 37 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 253,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-20.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 148,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = 37 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 254,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-21.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 148,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = 37 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 255,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-22.png",
          width = 128,
          height = 222,
          probability = 0.7,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 256,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-23.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 258,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-25.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 257,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-24.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 259,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-26.png",
          width = 128,
          height = 222,
          probability = 0.7,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 262,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-29.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 148,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = 37 },
                  { x = 0, y = 74 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 260,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-27.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 261,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-28.png",
          width = 128,
          height = 222,
          probability = 0.1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 64,
                y = 222,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = -64, y = -37 },
                  { x = 0, y = -74 },
                  { x = 64, y = -37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 263,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-30.png",
          width = 128,
          height = 222,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 264,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-31.png",
          width = 128,
          height = 222,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 265,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-32.png",
          width = 128,
          height = 222,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = -37 },
                  { x = 128, y = 0 },
                  { x = 64, y = 37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 266,
          properties = {
            ["height"] = 150
          },
          image = "../img/Tiles/Niveau2-33.png",
          width = 128,
          height = 222,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
            class = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            parallaxx = 1,
            parallaxy = 1,
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "polygon",
                x = 0,
                y = 185,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 64, y = 37 },
                  { x = 128, y = 0 },
                  { x = 64, y = -37 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 87,
          properties = {
            ["animDef"] = "tlbr",
            ["prob"] = 0.5
          },
          image = "../img/Tiles/Tuile_eau-33.png",
          width = 128,
          height = 74,
          animation = {
            {
              tileid = 87,
              duration = 200
            },
            {
              tileid = 86,
              duration = 200
            },
            {
              tileid = 85,
              duration = 200
            },
            {
              tileid = 84,
              duration = 200
            },
            {
              tileid = 85,
              duration = 200
            },
            {
              tileid = 86,
              duration = 200
            }
          }
        },
        {
          id = 83,
          properties = {
            ["animDef"] = "bltr",
            ["prob"] = 0.5
          },
          image = "../img/Tiles/Tuile_eau-29.png",
          width = 128,
          height = 74,
          animation = {
            {
              tileid = 83,
              duration = 200
            },
            {
              tileid = 82,
              duration = 200
            },
            {
              tileid = 81,
              duration = 200
            },
            {
              tileid = 80,
              duration = 200
            },
            {
              tileid = 81,
              duration = 200
            },
            {
              tileid = 82,
              duration = 200
            }
          }
        },
        {
          id = 90,
          properties = {
            ["animDef"] = "center",
            ["prob"] = 0.075
          },
          image = "../img/Tiles/Tuile_eau-36.png",
          width = 128,
          height = 74,
          animation = {
            {
              tileid = 88,
              duration = 200
            },
            {
              tileid = 89,
              duration = 200
            },
            {
              tileid = 90,
              duration = 200
            }
          }
        },
        {
          id = 93,
          properties = {
            ["animDef"] = "center",
            ["prob"] = 0.075
          },
          image = "../img/Tiles/Tuile_eau-39.png",
          width = 128,
          height = 74,
          animation = {
            {
              tileid = 91,
              duration = 200
            },
            {
              tileid = 92,
              duration = 200
            },
            {
              tileid = 93,
              duration = 200
            }
          }
        },
        {
          id = 80,
          image = "../img/Tiles/Tuile_eau-26.png",
          width = 128,
          height = 74
        },
        {
          id = 81,
          image = "../img/Tiles/Tuile_eau-27.png",
          width = 128,
          height = 74
        },
        {
          id = 82,
          image = "../img/Tiles/Tuile_eau-28.png",
          width = 128,
          height = 74
        },
        {
          id = 84,
          image = "../img/Tiles/Tuile_eau-30.png",
          width = 128,
          height = 74
        },
        {
          id = 85,
          image = "../img/Tiles/Tuile_eau-31.png",
          width = 128,
          height = 74
        },
        {
          id = 86,
          image = "../img/Tiles/Tuile_eau-32.png",
          width = 128,
          height = 74
        },
        {
          id = 88,
          image = "../img/Tiles/Tuile_eau-34.png",
          width = 128,
          height = 74
        },
        {
          id = 89,
          image = "../img/Tiles/Tuile_eau-35.png",
          width = 128,
          height = 74
        },
        {
          id = 91,
          image = "../img/Tiles/Tuile_eau-37.png",
          width = 128,
          height = 74
        },
        {
          id = 92,
          image = "../img/Tiles/Tuile_eau-38.png",
          width = 128,
          height = 74
        },
        {
          id = 145,
          type = "ligne_gazon",
          image = "../img/Tiles/Tuile_gazon-25.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 139,
          type = "ligne_gazon",
          image = "../img/Tiles/Tuile_gazon-19.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 147,
          type = "ligne_gazon",
          image = "../img/Tiles/Tuile_gazon-27.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 142,
          type = "ligne_gazon",
          image = "../img/Tiles/Tuile_gazon-22.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 140,
          type = "ligne_gazon",
          image = "../img/Tiles/Tuile_gazon-20.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 144,
          type = "ligne_gazon",
          image = "../img/Tiles/Tuile_gazon-24.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 143,
          type = "ligne_gazon",
          image = "../img/Tiles/Tuile_gazon-23.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 148,
          type = "ligne_gazon",
          image = "../img/Tiles/Tuile_gazon-28.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 149,
          type = "ligne_gazon",
          image = "../img/Tiles/Tuile_gazon-29.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 150,
          type = "ligne_gazon",
          image = "../img/Tiles/Tuile_gazon-30.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 151,
          type = "ligne_gazon",
          image = "../img/Tiles/Tuile_gazon-31.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 146,
          type = "ligne_gazon",
          image = "../img/Tiles/Tuile_gazon-26.png",
          width = 128,
          height = 74,
          probability = 0.015
        },
        {
          id = 141,
          type = "ligne_gazon",
          image = "../img/Tiles/Tuile_gazon-21.png",
          width = 128,
          height = 74,
          probability = 0.015
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 11,
      name = "Gazon",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = 16, y = -32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 366, 380,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 378, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 378, 374,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 366, 381, 379
          }
        },
        {
          x = 32, y = -32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            380, 367, 380, 380, 367, 367, 380, 368, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 280, 195, 195, 270, 195, 370, 0, 0, 0, 0, 0, 0, 0, 0,
            376, 195, 195, 195, 195, 271, 195, 379, 368, 0, 0, 0, 0, 0, 0, 0,
            381, 195, 195, 195, 195, 195, 195, 195, 370, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 366, 368, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 379, 368, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 366, 368, 369, 272, 379, 368,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 366, 381, 379, 381, 374, 376, 377,
            0, 0, 0, 0, 0, 0, 0, 0, 366, 381, 195, 195, 195, 379, 381, 379,
            0, 0, 0, 0, 0, 0, 366, 380, 381, 272, 195, 374, 376, 271, 278, 195,
            0, 0, 0, 0, 0, 0, 378, 195, 195, 281, 195, 379, 381, 195, 195, 276,
            0, 0, 0, 0, 0, 0, 371, 376, 374, 376, 195, 195, 195, 195, 195, 195
          }
        },
        {
          x = 16, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 378, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 378, 273, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 366, 381, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 366, 381, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 195, 276, 195, 276,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 378, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 366, 381, 270, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 366, 381, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 195, 195, 195, 278, 195, 374,
            0, 0, 0, 0, 0, 366, 368, 0, 0, 378, 195, 195, 195, 374, 376, 379,
            0, 0, 0, 0, 0, 378, 379, 380, 380, 381, 195, 374, 376, 379, 381, 195,
            0, 366, 367, 380, 380, 381, 195, 195, 195, 195, 195, 370, 378, 195, 195, 195,
            367, 381, 195, 195, 195, 195, 195, 195, 195, 195, 282, 379, 381, 195, 195, 195,
            195, 274, 277, 276, 195, 195, 195, 195, 195, 195, 195, 275, 195, 278, 195, 195,
            195, 281, 195, 195, 195, 195, 271, 195, 374, 376, 195, 195, 195, 195, 271, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 379, 381, 195, 280, 195, 195, 271, 195
          }
        },
        {
          x = 32, y = -16, width = 16, height = 16,
          data = {
            195, 195, 195, 195, 195, 274, 195, 195, 370, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 195, 271, 379, 368, 0, 0, 0, 0, 0, 0,
            278, 195, 276, 275, 374, 376, 195, 374, 376, 377, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 379, 381, 195, 379, 381, 379, 368, 0, 0, 0, 0, 0,
            195, 195, 195, 374, 376, 270, 195, 195, 195, 195, 370, 0, 0, 0, 0, 0,
            195, 277, 195, 379, 381, 195, 195, 276, 195, 195, 379, 368, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 379, 368, 0, 0, 0,
            195, 195, 195, 195, 276, 195, 195, 195, 281, 275, 195, 195, 379, 368, 0, 0,
            376, 282, 195, 195, 281, 280, 195, 195, 195, 195, 195, 374, 376, 377, 0, 0,
            381, 195, 195, 195, 195, 271, 270, 195, 195, 195, 195, 379, 381, 379, 368, 0,
            195, 273, 195, 195, 195, 277, 195, 195, 195, 195, 195, 195, 195, 195, 379, 367,
            195, 271, 272, 195, 195, 195, 195, 195, 270, 195, 195, 195, 195, 276, 374, 376,
            195, 195, 195, 195, 195, 195, 282, 281, 270, 195, 195, 195, 195, 195, 379, 381,
            272, 272, 195, 279, 195, 195, 195, 195, 195, 195, 195, 195, 276, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 275, 195, 195, 195, 195, 195, 374, 376, 195,
            195, 281, 272, 195, 195, 278, 195, 195, 281, 279, 195, 195, 195, 379, 381, 195
          }
        },
        {
          x = 48, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            379, 368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 379, 368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 377, 366, 367, 367, 367, 380, 367, 367, 367, 380, 367, 380, 367, 367,
            195, 278, 379, 381, 195, 271, 195, 195, 195, 278, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 374, 376, 195, 374, 375, 372, 376, 195, 195, 195, 195, 195
          }
        },
        {
          x = 64, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            367, 380, 368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            282, 272, 379, 380, 368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 274, 195, 374, 373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 378, 379, 381, 195, 195, 195, 195, 195, 282,
            0, 0, 0, 0, 0, 0, 366, 381, 195, 195, 195, 195, 274, 195, 195, 277,
            0, 0, 0, 366, 367, 380, 381, 195, 278, 195, 195, 195, 195, 195, 195, 272,
            0, 0, 0, 369, 195, 374, 376, 195, 277, 195, 195, 279, 195, 272, 195, 195,
            0, 0, 0, 371, 376, 379, 381, 278, 195, 374, 376, 195, 271, 195, 195, 275,
            0, 0, 0, 366, 381, 195, 195, 195, 195, 379, 381, 195, 195, 195, 271, 195,
            0, 0, 0, 378, 195, 278, 282, 270, 195, 195, 195, 195, 195, 276, 195, 271,
            0, 0, 0, 369, 273, 195, 195, 195, 195, 281, 280, 195, 195, 195, 195, 195,
            0, 0, 0, 378, 195, 273, 195, 195, 195, 195, 278, 195, 195, 195, 195, 195,
            0, 0, 0, 369, 195, 195, 195, 276, 374, 375, 376, 195, 195, 195, 195, 270,
            0, 0, 0, 371, 376, 195, 274, 195, 370, 366, 381, 195, 282, 274, 195, 195,
            0, 0, 0, 0, 369, 195, 195, 195, 370, 371, 376, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 371, 375, 376, 195, 370, 0, 195, 195, 195, 282, 195, 195,
            0, 0, 0, 0, 0, 0, 378, 374, 373, 0, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 378, 370, 0, 371, 376, 195, 195, 195, 195, 270,
            0, 0, 0, 0, 0, 0, 378, 379, 368, 0, 378, 278, 195, 195, 279, 195
          }
        },
        {
          x = 16, y = 0, width = 16, height = 16,
          data = {
            195, 195, 195, 195, 195, 195, 195, 195, 195, 278, 275, 277, 277, 195, 277, 195,
            195, 195, 195, 195, 195, 195, 281, 270, 270, 195, 195, 195, 272, 279, 195, 195,
            195, 195, 195, 270, 279, 270, 195, 195, 195, 195, 270, 273, 195, 274, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 273, 277,
            195, 195, 195, 270, 195, 195, 195, 195, 195, 278, 195, 195, 195, 195, 195, 270,
            270, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 270,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 270,
            195, 195, 195, 195, 277, 195, 195, 195, 274, 270, 195, 281, 272, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 272, 195, 195, 273, 195, 195, 195, 270, 195,
            279, 195, 195, 276, 195, 195, 195, 195, 195, 274, 195, 275, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 270, 195, 270, 195, 195, 195, 195, 195, 195, 272,
            195, 195, 278, 195, 195, 195, 279, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            277, 195, 195, 195, 195, 195, 195, 272, 195, 195, 275, 195, 195, 195, 195, 281,
            195, 195, 195, 195, 195, 271, 195, 272, 195, 195, 195, 195, 195, 195, 195, 270,
            195, 273, 195, 195, 275, 195, 195, 274, 195, 195, 281, 195, 195, 195, 279, 195
          }
        },
        {
          x = 32, y = 0, width = 16, height = 16,
          data = {
            195, 195, 270, 195, 195, 195, 195, 195, 195, 271, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 278, 195, 195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 278,
            195, 281, 195, 195, 195, 195, 195, 195, 195, 273, 195, 195, 270, 195, 195, 275,
            195, 195, 195, 195, 195, 278, 195, 195, 281, 195, 195, 271, 195, 195, 195, 195,
            279, 195, 195, 195, 277, 195, 195, 195, 279, 195, 195, 270, 276, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 281, 274, 271, 273, 270, 270, 279, 278,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 270, 195, 270, 271, 195, 195, 195, 271, 195, 270, 195, 273, 195, 195,
            195, 195, 195, 276, 195, 281, 195, 195, 195, 195, 195, 195, 195, 272, 282, 270,
            195, 276, 195, 195, 195, 271, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 277, 195, 195, 195, 195, 195, 195, 195, 195, 272, 270, 195, 195, 195,
            195, 195, 270, 195, 276, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            279, 195, 195, 195, 195, 195, 195, 195, 195, 195, 282, 195, 279, 282, 195, 195,
            195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 195,
            270, 272, 195, 195, 195, 270, 195, 195, 273, 195, 282, 195, 195, 195, 195, 195,
            195, 195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 274, 195, 195
          }
        },
        {
          x = 48, y = 0, width = 16, height = 16,
          data = {
            195, 195, 195, 195, 379, 381, 195, 379, 367, 367, 381, 195, 276, 273, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 281, 195, 195, 195, 195, 277, 195, 279, 274,
            195, 281, 195, 195, 195, 279, 272, 195, 195, 195, 195, 274, 195, 281, 195, 271,
            195, 276, 195, 195, 270, 195, 195, 195, 276, 195, 270, 195, 195, 195, 195, 195,
            277, 195, 195, 195, 195, 273, 282, 281, 195, 195, 271, 270, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 271, 195, 195, 195,
            195, 195, 195, 272, 195, 270, 281, 195, 270, 278, 195, 195, 195, 270, 270, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 274, 195,
            195, 195, 195, 195, 276, 272, 195, 282, 195, 195, 275, 195, 276, 195, 195, 195,
            270, 195, 195, 195, 195, 195, 195, 270, 195, 278, 282, 195, 282, 275, 195, 195,
            195, 195, 195, 270, 195, 195, 195, 195, 195, 195, 195, 277, 278, 195, 195, 195,
            273, 195, 277, 277, 195, 195, 195, 270, 270, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 275,
            195, 195, 195, 195, 195, 195, 281, 195, 195, 195, 195, 195, 195, 195, 275, 195,
            195, 195, 195, 195, 195, 195, 271, 279, 195, 270, 270, 195, 195, 195, 195, 195,
            270, 272, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195
          }
        },
        {
          x = 64, y = 0, width = 16, height = 16,
          data = {
            195, 195, 195, 379, 380, 368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 374, 376, 379, 368, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 379, 381, 195, 379, 368, 0, 0, 0, 0, 0, 0, 0, 0,
            270, 195, 195, 195, 195, 195, 195, 370, 0, 0, 0, 0, 0, 0, 0, 0,
            275, 272, 195, 271, 270, 374, 376, 370, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 379, 381, 370, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 274, 195, 271, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 271, 195, 195, 195, 370, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 273, 195, 276, 279, 195, 272, 370, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 271, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0,
            270, 195, 195, 195, 195, 374, 376, 377, 0, 0, 0, 0, 0, 0, 0, 0,
            270, 195, 195, 277, 195, 379, 381, 377, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 281, 195, 195, 195, 195, 370, 0, 0, 0, 0, 0, 0, 0, 0,
            279, 195, 276, 278, 195, 195, 374, 373, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 277, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 274, 281, 195, 195, 276, 370, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 371, 376, 379, 368, 369, 273, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 378, 195, 377, 378, 195, 195, 195, 270, 274,
            0, 0, 0, 0, 0, 0, 0, 378, 374, 373, 378, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 378, 377, 366, 381, 195, 270, 195, 195, 270,
            0, 0, 0, 0, 0, 0, 0, 378, 377, 378, 278, 195, 195, 278, 195, 195,
            0, 0, 0, 0, 0, 0, 366, 381, 370, 371, 376, 276, 195, 195, 273, 271,
            0, 0, 0, 0, 0, 366, 381, 374, 373, 366, 381, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 371, 376, 370, 0, 369, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 369, 379, 368, 378, 270, 195, 270, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 371, 376, 379, 381, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 371, 376, 195, 195, 195, 195, 195, 274, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 369, 271, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 369, 280, 195, 272, 195, 278, 195, 276,
            0, 0, 0, 0, 0, 0, 0, 0, 378, 195, 195, 274, 195, 273, 270, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 378, 195, 195, 195, 195, 272, 270, 276,
            0, 0, 0, 0, 0, 0, 0, 0, 371, 376, 195, 195, 195, 270, 195, 277
          }
        },
        {
          x = 16, y = 16, width = 16, height = 16,
          data = {
            195, 195, 195, 195, 195, 195, 195, 273, 195, 195, 195, 195, 195, 195, 270, 195,
            195, 195, 195, 195, 195, 195, 277, 270, 195, 282, 275, 195, 195, 195, 282, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 275,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 273, 270, 195, 279, 273, 195,
            195, 195, 282, 195, 195, 195, 275, 270, 195, 195, 195, 195, 195, 195, 195, 195,
            270, 195, 195, 195, 270, 195, 195, 195, 195, 274, 195, 195, 195, 195, 195, 195,
            195, 270, 195, 195, 195, 195, 274, 195, 195, 195, 195, 195, 275, 195, 195, 195,
            195, 195, 276, 195, 195, 195, 195, 195, 195, 270, 195, 278, 195, 195, 195, 195,
            276, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 279, 195, 195,
            195, 195, 195, 277, 195, 195, 195, 272, 195, 275, 195, 195, 195, 195, 195, 195,
            274, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 279, 195, 277,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 277, 195, 270, 270, 195, 275, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 195, 195, 195, 195, 195, 195
          }
        },
        {
          x = 32, y = 16, width = 16, height = 16,
          data = {
            195, 276, 195, 195, 195, 195, 195, 195, 195, 195, 273, 195, 195, 270, 195, 195,
            270, 276, 273, 195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195, 278, 195,
            195, 195, 195, 195, 195, 195, 270, 195, 195, 195, 195, 195, 273, 195, 195, 195,
            272, 195, 195, 195, 270, 195, 272, 195, 282, 195, 195, 195, 195, 270, 195, 277,
            270, 195, 195, 270, 195, 195, 195, 195, 270, 195, 278, 272, 270, 195, 195, 195,
            195, 274, 195, 270, 195, 195, 195, 195, 274, 195, 195, 274, 275, 195, 195, 195,
            195, 195, 195, 195, 282, 195, 195, 195, 195, 195, 274, 195, 195, 195, 270, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 282, 195, 195, 195, 195, 282, 272, 195, 195, 195, 274, 195,
            195, 195, 195, 270, 195, 277, 195, 195, 195, 195, 195, 270, 275, 195, 273, 195,
            195, 195, 274, 275, 195, 195, 276, 195, 195, 272, 278, 272, 195, 195, 195, 195,
            270, 195, 278, 195, 195, 281, 195, 195, 195, 195, 195, 195, 275, 195, 195, 195,
            195, 270, 195, 272, 195, 195, 195, 195, 195, 195, 195, 277, 272, 270, 195, 271,
            195, 195, 271, 195, 195, 195, 272, 282, 195, 195, 195, 195, 273, 195, 271, 195,
            281, 195, 270, 282, 195, 195, 195, 276, 195, 195, 195, 195, 195, 195, 195, 195,
            276, 281, 195, 195, 195, 195, 270, 279, 195, 195, 195, 281, 195, 195, 195, 195
          }
        },
        {
          x = 48, y = 16, width = 16, height = 16,
          data = {
            195, 195, 195, 195, 270, 195, 195, 195, 195, 270, 270, 195, 278, 195, 195, 195,
            195, 195, 195, 273, 195, 195, 195, 195, 195, 277, 195, 195, 195, 195, 277, 195,
            195, 195, 195, 271, 195, 195, 272, 195, 195, 195, 195, 195, 195, 271, 270, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 273, 195, 195, 195,
            195, 195, 274, 195, 195, 195, 273, 195, 195, 270, 195, 195, 195, 195, 195, 270,
            270, 195, 195, 195, 195, 270, 195, 279, 195, 195, 195, 278, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 277, 195, 195, 195, 270, 195, 195, 195, 195, 195, 195,
            195, 282, 195, 282, 276, 195, 195, 271, 195, 195, 195, 282, 281, 195, 195, 195,
            195, 195, 270, 195, 195, 279, 195, 274, 195, 195, 278, 278, 195, 195, 195, 195,
            195, 195, 195, 195, 276, 195, 273, 195, 195, 195, 195, 282, 195, 195, 270, 195,
            195, 195, 195, 270, 270, 195, 195, 270, 195, 195, 195, 195, 195, 270, 195, 195,
            271, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 271, 271, 195, 195, 195,
            195, 195, 195, 272, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 279, 195, 195, 195, 195, 275, 274, 195, 195, 195, 195, 282, 195, 195, 195,
            195, 195, 270, 277, 195, 195, 195, 195, 195, 277, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 274, 195, 195, 195, 195, 195, 195, 195
          }
        },
        {
          x = 64, y = 16, width = 16, height = 16,
          data = {
            277, 195, 195, 195, 195, 274, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 270, 270, 281, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 281, 195, 374, 373, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 272, 195, 277, 377, 366, 368, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 270, 195, 195, 195, 370, 371, 373, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 274, 195, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 374, 373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 374, 373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            277, 195, 195, 379, 367, 368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 274, 195, 195, 195, 370, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 370, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 379, 368, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 281, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 371, 376, 195, 274, 195, 195, 277,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 378, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 366, 381, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 195, 195, 195, 195, 270, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 195, 195, 279, 195, 270, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 195, 195, 274, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 281, 195, 195, 272, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 195, 195, 195, 195, 195, 271,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 195, 195, 279, 195, 270, 270,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 195, 279, 277, 277, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 366, 381, 195, 195, 270, 195, 195, 281,
            0, 0, 0, 0, 0, 0, 0, 0, 378, 195, 279, 195, 195, 270, 195, 281,
            0, 0, 0, 0, 0, 0, 0, 0, 378, 275, 279, 195, 195, 195, 272, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 371, 376, 195, 195, 195, 195, 272, 195
          }
        },
        {
          x = 16, y = 32, width = 16, height = 16,
          data = {
            270, 195, 195, 195, 195, 195, 195, 195, 195, 271, 195, 195, 195, 195, 195, 195,
            271, 195, 195, 279, 195, 275, 195, 195, 195, 195, 195, 195, 195, 270, 195, 277,
            270, 195, 195, 195, 195, 195, 195, 278, 195, 270, 277, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 271, 279, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 278, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 195, 195, 277, 274,
            195, 195, 195, 195, 195, 195, 271, 195, 279, 270, 195, 282, 195, 195, 195, 195,
            195, 272, 195, 195, 195, 195, 195, 195, 195, 195, 273, 195, 195, 270, 195, 195,
            195, 195, 195, 195, 273, 195, 195, 195, 270, 195, 282, 195, 195, 195, 195, 195,
            195, 195, 277, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 195, 195, 195,
            195, 278, 195, 195, 270, 195, 195, 195, 195, 195, 195, 273, 276, 195, 195, 195,
            270, 282, 271, 195, 195, 195, 195, 278, 275, 270, 195, 270, 195, 275, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 276, 195, 274, 195, 195, 195, 270,
            195, 195, 276, 195, 195, 195, 195, 281, 274, 195, 270, 195, 195, 195, 281, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 276, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 270, 281, 195, 195, 195, 274, 195, 279
          }
        },
        {
          x = 32, y = 32, width = 16, height = 16,
          data = {
            277, 195, 277, 195, 195, 195, 195, 195, 270, 277, 195, 195, 195, 195, 195, 270,
            277, 195, 195, 195, 195, 195, 270, 275, 270, 195, 272, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 278, 195,
            195, 195, 195, 195, 195, 195, 195, 271, 276, 195, 195, 195, 195, 195, 195, 195,
            195, 272, 195, 195, 195, 195, 195, 195, 195, 195, 195, 273, 277, 195, 195, 195,
            275, 195, 195, 195, 195, 278, 195, 195, 195, 195, 195, 195, 270, 272, 273, 195,
            195, 281, 195, 195, 195, 270, 195, 195, 195, 195, 270, 195, 195, 195, 195, 195,
            274, 195, 279, 195, 195, 270, 270, 195, 195, 278, 195, 195, 195, 195, 281, 277,
            195, 195, 275, 195, 195, 195, 195, 282, 195, 195, 195, 195, 195, 195, 273, 195,
            195, 279, 270, 195, 270, 195, 195, 195, 195, 270, 195, 195, 270, 275, 195, 275,
            195, 274, 195, 195, 274, 195, 195, 276, 270, 270, 195, 195, 195, 195, 270, 195,
            195, 270, 195, 270, 195, 195, 195, 195, 270, 273, 195, 195, 195, 282, 195, 195,
            195, 195, 195, 195, 272, 275, 195, 195, 195, 195, 195, 273, 195, 195, 195, 195,
            195, 195, 195, 276, 195, 195, 195, 195, 273, 274, 195, 195, 195, 195, 195, 195,
            195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 278, 276, 195,
            195, 195, 278, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 277, 195
          }
        },
        {
          x = 48, y = 32, width = 16, height = 16,
          data = {
            195, 270, 195, 195, 195, 195, 270, 281, 270, 195, 195, 282, 195, 195, 195, 195,
            282, 195, 277, 276, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 276,
            278, 195, 195, 270, 272, 195, 195, 195, 195, 195, 195, 270, 195, 195, 195, 195,
            195, 195, 275, 195, 195, 195, 195, 195, 270, 195, 270, 195, 195, 275, 279, 272,
            195, 195, 195, 270, 195, 195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 277,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 282, 195, 270, 195, 272, 270,
            195, 195, 195, 195, 195, 195, 195, 275, 195, 195, 195, 195, 195, 195, 195, 270,
            195, 195, 195, 195, 195, 281, 195, 282, 274, 276, 195, 195, 195, 195, 195, 195,
            195, 271, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            277, 275, 275, 271, 277, 195, 278, 195, 195, 279, 195, 195, 195, 195, 195, 195,
            195, 270, 195, 195, 195, 270, 281, 195, 195, 195, 195, 195, 270, 195, 195, 195,
            195, 270, 272, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 281, 195, 279,
            195, 195, 195, 195, 195, 275, 195, 195, 195, 195, 195, 195, 195, 195, 281, 195,
            195, 277, 195, 195, 195, 270, 195, 270, 195, 195, 195, 195, 195, 195, 195, 275,
            195, 195, 195, 195, 195, 195, 195, 277, 195, 195, 195, 195, 195, 195, 270, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 281, 195, 275, 195, 195, 195, 195, 195
          }
        },
        {
          x = 64, y = 32, width = 16, height = 16,
          data = {
            374, 376, 195, 195, 374, 372, 373, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            379, 381, 195, 195, 379, 368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            278, 195, 195, 195, 275, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 274, 195, 195, 195, 370, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 374, 373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 274, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 271, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 270, 195, 379, 368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            271, 277, 195, 277, 195, 379, 368, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 277, 195, 195, 195, 195, 370, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 270, 195, 195, 370, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 370, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 278, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 366, 381, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 371, 376, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 195, 195, 272, 195, 195, 275,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 378, 195, 195, 195, 195, 270, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 371, 376, 195, 195, 374, 376, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 366, 381, 195, 195, 379, 381, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 195, 195, 195, 195, 274, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 371, 376, 195, 278, 195, 273, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 366, 381, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 371, 376, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 371, 376, 374, 376, 282, 274,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 371, 373, 371, 375, 372,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = 48, width = 16, height = 16,
          data = {
            195, 195, 195, 277, 195, 270, 195, 195, 272, 195, 273, 195, 271, 273, 195, 195,
            195, 195, 195, 195, 195, 276, 195, 195, 195, 195, 270, 195, 195, 195, 195, 195,
            195, 195, 195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 272,
            195, 195, 195, 270, 195, 195, 195, 195, 195, 272, 195, 195, 195, 195, 195, 272,
            272, 195, 195, 195, 195, 195, 195, 195, 275, 195, 272, 195, 195, 195, 195, 195,
            274, 195, 195, 195, 195, 195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 270, 195, 195, 195, 195, 270, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 276, 195, 195, 270, 195,
            374, 376, 195, 270, 195, 195, 282, 195, 195, 195, 195, 282, 195, 195, 195, 272,
            379, 381, 195, 195, 195, 195, 195, 195, 374, 375, 375, 376, 195, 281, 195, 195,
            195, 195, 195, 195, 195, 272, 374, 375, 373, 366, 368, 371, 375, 376, 195, 195,
            375, 375, 376, 195, 195, 374, 373, 0, 0, 371, 373, 0, 0, 369, 282, 195,
            0, 0, 371, 375, 375, 373, 0, 0, 0, 0, 0, 0, 0, 371, 372, 376,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 371,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = 48, width = 16, height = 16,
          data = {
            195, 195, 195, 270, 195, 195, 271, 195, 275, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 275, 195, 195, 281, 195, 271, 195, 195, 195, 195, 281, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 277, 195, 195,
            195, 195, 195, 277, 195, 195, 195, 195, 195, 270, 271, 195, 195, 195, 195, 374,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 374, 376, 379,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 374, 373, 371, 375,
            195, 275, 195, 195, 195, 195, 195, 270, 195, 270, 195, 195, 377, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 374, 373, 0, 366, 368,
            195, 275, 195, 270, 195, 279, 195, 195, 195, 195, 374, 373, 0, 0, 371, 373,
            195, 195, 195, 195, 195, 282, 277, 195, 278, 195, 370, 0, 0, 0, 0, 0,
            195, 278, 195, 195, 281, 195, 195, 195, 374, 372, 373, 0, 0, 0, 0, 0,
            376, 374, 376, 195, 374, 376, 279, 195, 377, 0, 0, 0, 0, 0, 0, 0,
            369, 379, 381, 280, 379, 381, 374, 375, 373, 0, 0, 0, 0, 0, 0, 0,
            371, 372, 375, 372, 372, 375, 373, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 48, width = 16, height = 16,
          data = {
            195, 195, 195, 282, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 273, 195, 195, 195, 195, 274, 195, 195, 195, 195, 195, 272,
            195, 195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 270, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 195, 270, 195,
            376, 195, 195, 195, 270, 270, 195, 195, 277, 195, 195, 270, 270, 195, 195, 195,
            381, 374, 376, 195, 195, 195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            376, 379, 381, 279, 271, 195, 195, 195, 270, 195, 195, 195, 195, 195, 195, 195,
            371, 372, 376, 274, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 272,
            0, 0, 371, 372, 376, 195, 275, 195, 272, 195, 195, 195, 195, 272, 195, 195,
            0, 0, 0, 0, 371, 376, 273, 195, 272, 195, 195, 195, 195, 195, 195, 273,
            0, 0, 0, 0, 0, 371, 375, 375, 376, 195, 277, 282, 195, 279, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 371, 376, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 371, 375, 372, 375, 375, 372, 372,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 64, y = 48, width = 16, height = 16,
          data = {
            195, 281, 274, 195, 195, 195, 370, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 270, 195, 195, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 272, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 370, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 374, 373, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 270, 195, 195, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 374, 376, 274, 195, 377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            278, 379, 381, 195, 374, 373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 278, 374, 373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 281, 374, 373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 374, 373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            372, 373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 81,
      name = "Fruits cachés",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 2461,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3996,
          y = 444,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 41,
          visible = true,
          properties = {
            ["posZ"] = 0
          }
        },
        {
          id = 2500,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3922,
          y = 2812,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 38,
          visible = true,
          properties = {
            ["poZ "] = 500
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 86,
      name = "Arche",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 2499,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3478,
          y = 2220,
          width = 1152,
          height = 1024,
          rotation = 0,
          gid = 90,
          visible = true,
          properties = {
            ["posZ"] = 0
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 84,
      name = "Chemins",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = 16, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 253, 123, 123, 122, 129, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 107, 258, 261, 259, 102, 123, 120
          }
        },
        {
          x = 32, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            252, 123, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            108, 261, 102, 121, 129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            107, 261, 260, 261, 102, 123, 129, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            127, 109, 101, 261, 257, 256, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 127, 109, 101, 261, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 108, 255, 102, 123, 122, 123, 119, 119, 123, 129, 0, 0,
            0, 0, 0, 253, 103, 259, 261, 261, 261, 261, 259, 261, 261, 115, 0, 0,
            0, 0, 0, 107, 261, 261, 261, 260, 255, 261, 261, 261, 261, 118, 0, 253,
            120, 122, 129, 108, 261, 261, 261, 261, 261, 261, 261, 100, 110, 125, 0, 127
          }
        },
        {
          x = 48, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 253, 129, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 108, 118, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 105, 118, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 107, 118, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 107, 116, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 108, 118, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 106, 118, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 108, 102, 129, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 101, 116, 0, 0
          }
        },
        {
          x = 16, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 113, 113, 101, 261, 261, 261,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 110, 113, 113,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = 0, width = 16, height = 16,
          data = {
            261, 261, 102, 103, 261, 261, 261, 261, 100, 113, 113, 125, 0, 0, 0, 0,
            101, 261, 261, 261, 261, 260, 260, 261, 116, 0, 0, 0, 0, 0, 0, 0,
            127, 109, 113, 101, 261, 100, 101, 261, 102, 129, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 108, 261, 102, 103, 261, 261, 118, 0, 63, 0, 0, 72, 0,
            0, 0, 0, 107, 254, 261, 261, 261, 261, 116, 0, 0, 71, 0, 0, 0,
            0, 0, 0, 127, 113, 110, 109, 113, 113, 125, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 253, 123, 119, 123, 129, 0, 0, 0, 0, 0, 0,
            0, 0, 253, 129, 0, 104, 256, 260, 261, 118, 0, 0, 0, 0, 0, 0,
            0, 0, 126, 125, 0, 127, 101, 261, 261, 118, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 127, 109, 101, 118, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 104, 102, 129, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 101, 115, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 108, 118, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 104, 118, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 104, 118, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 108, 102, 129,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 113, 125,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 127, 125, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 253, 129, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 106, 114, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 252, 129, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 127, 125, 0, 253, 120, 129, 253, 123, 123, 121,
            0, 0, 0, 0, 253, 121, 123, 128, 0, 108, 261, 115, 108, 261, 261, 261,
            0, 0, 0, 253, 103, 100, 113, 125, 0, 127, 113, 125, 127, 109, 113, 101,
            0, 0, 0, 127, 110, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 106, 115, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 107, 102, 121, 129, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 253, 129, 108, 100, 101, 118, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 127, 125, 108, 102, 103, 118, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 107, 100, 109, 125, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 253, 120, 103, 118, 0, 0, 0, 0,
            119, 120, 129, 0, 0, 0, 0, 253, 103, 100, 109, 125, 0, 0, 0, 0,
            260, 261, 114, 0, 72, 0, 71, 126, 113, 125, 0, 0, 0, 0, 0, 0,
            100, 113, 125, 0, 71, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            125, 0, 0, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 78,
      name = "Falaises 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = 32, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 326, 319, 319, 325, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 323, 311, 311, 321, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 326,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 327, 300,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 332,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 304, 303,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 326, 300, 302,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 306, 329, 332,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 338, 340, 0, 306, 332, 332,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 350, 0, 304, 329, 331,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 360, 350, 0, 307, 332, 332,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 360, 350, 0, 307, 329, 330,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 350, 0, 305, 332, 329,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 359, 350, 0, 307, 330, 331,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 351, 0, 323, 301, 332
          }
        },
        {
          x = 16, y = 0, width = 16, height = 16,
          data = {
            319, 325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            332, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            330, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            332, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            332, 302, 325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            328, 332, 302, 324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            301, 331, 330, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            300, 332, 332, 314, 0, 326, 325, 0, 327, 319, 325, 0, 326, 319, 318, 319,
            331, 332, 329, 302, 319, 300, 315, 0, 323, 311, 320, 0, 323, 310, 311, 301,
            329, 332, 331, 332, 303, 311, 320, 0, 0, 0, 0, 0, 0, 0, 0, 323,
            332, 332, 330, 332, 313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            332, 332, 303, 311, 321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            332, 328, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            332, 332, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            303, 301, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            302, 300, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            315, 0, 0, 0, 0, 0, 0, 327, 318, 317, 325, 0, 0, 0, 0, 0,
            320, 0, 0, 0, 0, 0, 0, 323, 310, 301, 302, 319, 325, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 322, 309, 301, 302, 324, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 322, 301, 302, 325, 338,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 323, 311, 320, 343,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 339,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 338, 346, 348, 346, 346, 346, 346, 341, 0, 0, 0, 0, 0,
            0, 0, 338, 365, 362, 356, 354, 354, 357, 363, 350, 0, 0, 0, 0, 0,
            0, 0, 359, 333, 350, 0, 0, 0, 0, 358, 353, 0, 0, 0, 0, 0,
            0, 0, 343, 363, 350, 0, 0, 0, 0, 358, 351, 0, 0, 0, 0, 0,
            0, 0, 0, 342, 345, 0, 0, 0, 339, 365, 352, 338, 346, 340, 0, 327,
            0, 0, 0, 0, 0, 0, 0, 0, 358, 333, 364, 365, 334, 364, 341, 323,
            0, 0, 0, 0, 0, 0, 0, 0, 358, 333, 333, 336, 336, 333, 350, 339,
            339, 346, 347, 346, 346, 346, 346, 349, 365, 333, 334, 335, 333, 333, 364, 365,
            365, 362, 356, 354, 354, 363, 333, 362, 363, 333, 333, 333, 336, 335, 333, 362,
            354, 345, 0, 0, 0, 343, 354, 345, 343, 354, 363, 335, 333, 333, 336, 364,
            341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343, 363, 334, 333, 334, 333,
            345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 334, 336, 337, 333,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343, 363, 336, 333, 333
          }
        },
        {
          x = 64, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 327, 319, 324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 323, 301, 313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 307, 302, 325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 307, 332, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 326, 300, 303, 320, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            319, 300, 303, 320, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            311, 311, 321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            364, 341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            363, 350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            365, 353, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            334, 350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            362, 344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 364, 340, 0, 322, 308,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343, 363, 350, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 350, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 350, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 339, 365, 353, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 362, 345, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 350, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 350, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 353, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 364, 341, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 342, 363, 364, 348, 340, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343, 354, 363, 364, 346,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 342, 355, 354,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = 16, width = 16, height = 16,
          data = {
            301, 303, 321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            304, 313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            307, 302, 324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            323, 301, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 307, 302, 319, 317, 325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 323, 311, 310, 311, 320, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 326, 319, 318, 319, 319, 318, 319, 325, 0, 0, 0, 0,
            0, 0, 0, 0, 322, 309, 311, 311, 311, 301, 331, 302, 324, 0, 0, 0,
            346, 340, 0, 0, 0, 0, 0, 0, 0, 323, 311, 311, 320, 0, 0, 0,
            355, 344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 338, 340, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 343, 344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 342, 363, 362, 363,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 364, 365,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343, 363, 333,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 333,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 333,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 339, 365, 334,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 333, 362,
            327, 319, 316, 319, 319, 324, 0, 0, 0, 0, 0, 0, 339, 365, 336, 350,
            307, 332, 332, 332, 328, 315, 0, 0, 0, 0, 0, 0, 358, 333, 362, 344,
            307, 328, 330, 303, 301, 315, 0, 0, 0, 0, 0, 0, 359, 362, 344, 0,
            307, 331, 330, 302, 300, 313, 0, 0, 0, 0, 0, 0, 343, 345, 0, 0,
            307, 332, 328, 332, 303, 321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            307, 332, 303, 310, 320, 0, 0, 0, 0, 327, 325, 0, 0, 0, 0, 0,
            323, 301, 315, 0, 0, 0, 0, 0, 0, 323, 320, 0, 0, 0, 0, 0,
            0, 305, 313, 0, 0, 0, 0, 326, 319, 319, 318, 325, 0, 0, 0, 0,
            327, 300, 315, 0, 0, 0, 0, 307, 330, 332, 332, 314, 0, 0, 0, 0
          }
        },
        {
          x = 64, y = 16, width = 16, height = 16,
          data = {
            350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 326,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 327, 319, 300,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 332, 332,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 327, 319, 300, 328, 328,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 306, 332, 332, 332, 328,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 332, 332, 332, 328,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 329, 332, 332, 332,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 303, 301, 332, 303,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 302, 300, 332, 302,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 331, 332, 328, 328,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 332, 330, 332, 303,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 303, 301, 331, 302,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 322, 321, 322, 311, 311
          }
        },
        {
          x = 16, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 327, 324, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 327, 318, 319, 319, 300, 302, 319, 318, 319, 319, 316, 316, 324, 0, 0,
            319, 300, 328, 331, 303, 311, 311, 308, 311, 309, 311, 311, 311, 321, 0, 0,
            329, 331, 332, 303, 320, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            332, 332, 330, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            332, 332, 328, 302, 324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            330, 331, 303, 311, 321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            303, 301, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            302, 300, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            329, 303, 320, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            301, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            300, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            332, 302, 325, 0, 0, 0, 0, 0, 0, 0, 0, 326, 324, 0, 0, 0,
            301, 332, 302, 324, 0, 0, 0, 0, 0, 0, 0, 322, 320, 0, 0, 0,
            300, 303, 301, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            309, 321, 323, 320, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 327, 319
          }
        },
        {
          x = 32, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            316, 319, 319, 319, 319, 325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 32, width = 16, height = 16,
          data = {
            307, 303, 321, 0, 0, 0, 0, 307, 331, 303, 301, 315, 0, 0, 0, 0,
            323, 321, 0, 0, 0, 0, 0, 307, 332, 302, 300, 315, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 322, 311, 311, 301, 302, 325, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 330, 312, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 332, 315, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 305, 303, 321, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 302, 325, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 326, 300, 331, 302, 324, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 328, 332, 328, 315, 0, 327,
            0, 0, 0, 0, 0, 0, 0, 0, 326, 300, 331, 332, 331, 302, 319, 300,
            0, 0, 0, 0, 0, 0, 326, 317, 300, 332, 332, 332, 332, 303, 301, 303,
            0, 0, 0, 0, 0, 0, 307, 332, 332, 329, 332, 330, 332, 302, 300, 315,
            0, 0, 0, 0, 0, 0, 307, 332, 332, 332, 328, 332, 332, 331, 329, 302,
            0, 0, 0, 0, 0, 0, 307, 303, 301, 332, 332, 332, 329, 332, 332, 328,
            0, 0, 0, 0, 0, 0, 307, 302, 300, 332, 332, 328, 330, 332, 332, 331,
            0, 0, 0, 0, 0, 0, 307, 332, 328, 330, 330, 328, 331, 303, 311, 311
          }
        },
        {
          x = 64, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            316, 325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            303, 321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            317, 324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            330, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            332, 302, 319, 319, 325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            308, 311, 311, 311, 321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = 48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 303,
            0, 0, 0, 0, 0, 0, 327, 319, 325, 0, 0, 0, 0, 327, 300, 314,
            0, 0, 0, 326, 324, 0, 323, 301, 315, 0, 0, 0, 0, 307, 303, 320,
            0, 0, 0, 307, 314, 0, 0, 304, 302, 319, 325, 0, 0, 306, 315, 0,
            0, 0, 0, 305, 312, 0, 0, 323, 301, 332, 302, 325, 0, 307, 314, 0,
            0, 0, 0, 322, 321, 0, 0, 0, 323, 311, 301, 302, 319, 300, 315, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 322, 311, 311, 301, 302, 324,
            0, 327, 325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 322, 301, 302,
            0, 322, 320, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 322, 301,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 322,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = 48, width = 16, height = 16,
          data = {
            311, 311, 311, 311, 301, 302, 324, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 323, 301, 312, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 305, 302, 324, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 322, 301, 313, 0, 0, 0, 326, 318, 325, 0, 0,
            0, 0, 0, 0, 0, 0, 307, 302, 319, 319, 318, 300, 303, 321, 0, 0,
            0, 0, 0, 0, 0, 0, 323, 301, 332, 303, 311, 311, 320, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 307, 328, 314, 0, 0, 0, 0, 0, 0,
            325, 0, 0, 0, 0, 0, 326, 300, 303, 320, 0, 0, 0, 0, 0, 0,
            314, 0, 0, 0, 0, 326, 300, 332, 314, 0, 0, 0, 0, 0, 0, 0,
            302, 319, 319, 317, 319, 300, 329, 332, 312, 0, 0, 0, 0, 0, 0, 0,
            332, 303, 301, 332, 332, 332, 332, 303, 320, 0, 0, 0, 0, 0, 0, 0,
            301, 302, 300, 332, 328, 332, 303, 320, 0, 0, 0, 0, 0, 0, 0, 0,
            307, 332, 332, 332, 332, 332, 313, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            322, 309, 311, 311, 311, 311, 321, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 306, 332, 332, 332, 332, 329, 303, 320, 0, 0,
            0, 0, 0, 0, 327, 319, 300, 330, 329, 332, 332, 303, 321, 0, 0, 0,
            327, 319, 319, 319, 300, 328, 332, 332, 329, 332, 303, 321, 0, 0, 0, 0,
            323, 311, 310, 311, 311, 301, 303, 309, 308, 311, 321, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 327, 300, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 307, 303, 320, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 322, 321, 0, 0, 0, 0, 0, 0, 0, 0, 327, 319,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 303,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 323, 321,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 64, y = 48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            326, 324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            306, 313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            300, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            311, 321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 92,
      name = "Details Gazon 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = 0, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 236
          }
        },
        {
          x = 16, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 222, 236, 223, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 231, 231, 229, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 237, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 196, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 196, 289,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 237, 196, 289,
            0, 0, 0, 0, 0, 0, 0, 0, 221, 223, 0, 0, 234, 291, 196, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 224, 233, 0, 0, 224, 196, 196, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 224, 226, 0, 0, 224, 196, 230, 232,
            0, 0, 0, 0, 0, 0, 0, 0, 224, 226, 0, 0, 224, 196, 235, 237,
            0, 0, 0, 0, 0, 0, 0, 0, 234, 226, 0, 0, 234, 196, 196, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 224, 226, 0, 0, 234, 196, 196, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 234, 233, 0, 0, 224, 196, 196, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 234, 235, 223, 0, 227, 231, 228, 232,
            0, 0, 0, 0, 0, 0, 0, 0, 227, 232, 233, 0, 0, 0, 0, 224
          }
        },
        {
          x = 16, y = 0, width = 16, height = 16,
          data = {
            233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            235, 236, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 196, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 196, 235, 223, 0, 0, 0, 221, 222, 223, 0, 221, 222, 222, 222, 223,
            196, 196, 196, 235, 236, 223, 0, 227, 228, 229, 0, 227, 228, 228, 232, 233,
            230, 232, 196, 230, 228, 229, 0, 0, 0, 0, 0, 0, 0, 0, 227, 229,
            235, 237, 196, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 230, 228, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            230, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 221, 222, 236, 223, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 227, 228, 232, 235, 236, 223, 0, 0, 221, 222,
            0, 0, 0, 0, 0, 0, 0, 0, 227, 228, 232, 235, 223, 221, 237, 230,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 232, 233, 227, 231, 229,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 229, 221, 223, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 229, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 221, 222, 236, 236, 222, 236, 222, 223, 0, 0, 0, 0, 0, 0, 0,
            221, 237, 230, 228, 228, 231, 228, 232, 226, 0, 0, 0, 0, 0, 0, 0,
            234, 196, 226, 0, 0, 0, 0, 224, 226, 0, 0, 0, 0, 0, 0, 0,
            227, 232, 233, 0, 0, 0, 0, 224, 233, 0, 0, 0, 0, 0, 0, 0,
            0, 227, 229, 0, 0, 0, 221, 237, 233, 221, 236, 223, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 224, 196, 235, 237, 196, 235, 223, 0, 0, 221,
            0, 0, 0, 0, 0, 0, 234, 293, 196, 196, 196, 196, 233, 221, 223, 227,
            236, 236, 236, 222, 236, 236, 237, 196, 196, 230, 232, 196, 235, 237, 235, 223,
            228, 231, 231, 228, 232, 196, 196, 196, 196, 235, 237, 284, 196, 196, 196, 233,
            0, 0, 0, 0, 227, 228, 228, 228, 232, 196, 196, 289, 288, 230, 232, 233,
            0, 0, 0, 0, 0, 0, 0, 0, 227, 232, 196, 196, 288, 235, 237, 226,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 196, 196, 286, 294, 230, 229,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 232, 196, 196, 196, 233, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 232, 196, 196, 226, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 196, 196, 226, 0
          }
        },
        {
          x = 64, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            221, 236, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            227, 232, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 234, 235, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 234, 196, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            221, 237, 230, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            237, 230, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            228, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 226, 0, 0, 0, 0, 234,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 226, 0, 0, 0, 0, 234,
            0, 0, 0, 0, 0, 0, 0, 0, 221, 237, 226, 0, 0, 0, 0, 227,
            0, 0, 0, 0, 0, 0, 0, 0, 224, 230, 229, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 234, 233, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 234, 226, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 234, 233, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 224, 235, 223, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 227, 232, 235, 236, 223, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 231, 232, 235, 236, 236, 223,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 228, 231, 228, 229,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = 16, width = 16, height = 16,
          data = {
            233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            235, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            232, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            234, 235, 236, 222, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            227, 231, 228, 228, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 221, 236, 222, 222, 222, 236, 222, 222, 223, 0, 0, 0, 221,
            0, 0, 0, 227, 231, 228, 231, 228, 232, 196, 196, 226, 0, 0, 0, 227,
            0, 0, 0, 0, 0, 0, 0, 0, 227, 231, 231, 229, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 221, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234,
            223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234,
            229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234
          }
        },
        {
          x = 48, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 232, 196, 233, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 232, 226, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 233, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 236, 237, 233, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 291, 230, 229, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 237, 196, 226, 0, 0,
            222, 236, 222, 236, 223, 0, 0, 0, 0, 0, 234, 196, 230, 229, 0, 0,
            196, 230, 232, 196, 233, 0, 0, 0, 0, 0, 224, 230, 229, 0, 0, 0,
            196, 235, 237, 196, 226, 0, 0, 0, 0, 0, 227, 229, 0, 0, 0, 0,
            196, 196, 196, 196, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 196, 196, 230, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 196, 230, 229, 0, 0, 0, 0, 221, 223, 0, 0, 0, 0, 0, 0,
            196, 230, 229, 0, 0, 0, 0, 0, 227, 229, 0, 0, 0, 0, 0, 0,
            232, 233, 0, 0, 0, 0, 221, 222, 236, 222, 223, 0, 0, 0, 0, 0,
            237, 226, 0, 0, 0, 0, 234, 196, 196, 196, 233, 0, 0, 0, 0, 0,
            230, 229, 0, 0, 0, 0, 234, 196, 196, 196, 233, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 222, 222, 237,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 286, 196, 295,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 222, 237, 196, 196, 288,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 196, 287, 196, 287, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 196, 295, 196, 196, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 230, 232, 196, 295, 288,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 233, 224, 289, 291, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 226, 234, 196, 286, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 235, 237, 196, 196, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 196, 290, 196, 196, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 230, 232, 196, 196, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 229, 227, 228, 228, 231,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = 32, width = 16, height = 16,
          data = {
            221, 222, 222, 222, 237, 235, 236, 222, 222, 236, 222, 236, 223, 0, 0, 0,
            234, 196, 196, 230, 228, 231, 228, 228, 231, 228, 231, 228, 229, 0, 0, 0,
            237, 230, 231, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 235, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 196, 235, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 230, 231, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            230, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            235, 223, 0, 0, 0, 0, 0, 0, 0, 0, 221, 223, 0, 0, 0, 0,
            196, 235, 223, 0, 0, 0, 0, 0, 0, 0, 227, 229, 0, 0, 0, 0,
            230, 232, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            229, 227, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 236, 236,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 230, 231
          }
        },
        {
          x = 32, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            222, 222, 236, 222, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            228, 228, 231, 232, 235, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 32, width = 16, height = 16,
          data = {
            229, 0, 0, 0, 0, 0, 224, 196, 230, 232, 235, 223, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 227, 231, 229, 224, 196, 233, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 196, 233, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 196, 233, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 196, 226, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 294, 233, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 221, 237, 196, 235, 223, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 224, 196, 196, 196, 233, 0, 221, 222,
            0, 0, 0, 0, 0, 0, 0, 221, 237, 196, 196, 196, 235, 236, 237, 230,
            0, 0, 0, 0, 0, 221, 222, 237, 196, 196, 230, 232, 196, 196, 230, 229,
            0, 0, 0, 0, 0, 234, 196, 196, 196, 196, 235, 237, 196, 230, 229, 0,
            0, 0, 0, 0, 0, 234, 196, 295, 289, 196, 196, 196, 196, 235, 236, 236,
            0, 0, 0, 0, 0, 224, 287, 196, 196, 196, 288, 294, 196, 196, 196, 196,
            0, 0, 0, 0, 0, 234, 196, 196, 196, 196, 230, 232, 196, 196, 196, 293,
            0, 0, 0, 0, 0, 224, 286, 196, 196, 196, 235, 237, 230, 228, 228, 228,
            0, 0, 0, 0, 0, 224, 196, 196, 196, 196, 196, 230, 229, 0, 0, 0
          }
        },
        {
          x = 64, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            235, 222, 236, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            228, 231, 228, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = 48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 221, 222, 223, 0, 0, 0, 0, 221, 237, 233, 0,
            0, 0, 221, 223, 0, 227, 232, 233, 0, 0, 0, 0, 234, 230, 229, 0,
            0, 0, 234, 226, 0, 0, 234, 235, 222, 223, 0, 0, 224, 226, 0, 0,
            0, 0, 234, 233, 0, 0, 227, 232, 196, 235, 223, 0, 234, 233, 0, 0,
            0, 0, 227, 229, 0, 0, 0, 227, 228, 232, 235, 236, 237, 233, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 228, 228, 232, 235, 223, 0,
            221, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 232, 235, 223,
            227, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 232, 235,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 288,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 232,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = 48, width = 16, height = 16,
          data = {
            0, 0, 0, 227, 232, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 234, 235, 223, 0, 0, 0, 0, 0, 0, 0, 0, 221,
            0, 0, 0, 0, 227, 232, 233, 0, 0, 0, 221, 236, 223, 0, 0, 227,
            0, 0, 0, 0, 0, 234, 235, 222, 222, 236, 237, 230, 229, 0, 0, 0,
            0, 0, 0, 0, 0, 227, 232, 196, 230, 231, 231, 229, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 224, 295, 233, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 221, 237, 230, 229, 0, 0, 0, 0, 0, 0, 0,
            223, 0, 0, 0, 221, 237, 196, 226, 0, 0, 0, 0, 0, 0, 0, 0,
            235, 236, 236, 236, 237, 289, 196, 233, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 196, 196, 196, 196, 196, 230, 229, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 196, 196, 196, 293, 230, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            196, 196, 196, 196, 196, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            228, 228, 231, 231, 228, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 48, width = 16, height = 16,
          data = {
            0, 0, 0, 221, 222, 237, 196, 196, 295, 196, 230, 229, 0, 0, 0, 0,
            236, 236, 222, 237, 196, 196, 196, 196, 288, 230, 229, 0, 0, 0, 0, 0,
            228, 228, 228, 231, 232, 230, 228, 231, 228, 229, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 221, 237, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221,
            0, 0, 0, 224, 230, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234,
            0, 0, 0, 227, 229, 0, 0, 0, 0, 0, 0, 0, 0, 221, 222, 237,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 230, 228,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 229, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 64, y = 48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 87,
      name = "Falaises 2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = 0, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 326, 325
          }
        },
        {
          x = 16, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 338, 341, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343, 344, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 338, 341, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343, 345, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 322, 320,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 327, 319,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 322, 309,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 338, 346, 348, 346, 341, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 358, 334, 333, 333, 364, 340, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 358, 333, 334, 362, 363, 350, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 358, 335, 334, 364, 365, 350, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 343, 356, 354, 354, 363, 350, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 350, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 364, 341, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 361, 335, 350, 0
          }
        },
        {
          x = 32, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 339,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 342,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343, 357, 344, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 327, 317, 324, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 305, 332, 313, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 303, 320, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 322, 320, 0, 0,
            349, 349, 341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            333, 334, 350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            337, 333, 350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            333, 333, 353, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            355, 355, 344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 338, 346, 346,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 333, 333,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 333, 335,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343, 354, 354,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 339, 346, 347, 341, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 336, 333, 350, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 336, 333, 350, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 333, 334, 350, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343, 354, 354, 345, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            347, 340, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            333, 350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            362, 344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 338, 346, 346, 346, 349, 346, 340, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 358, 333, 335, 333, 335, 334, 364, 341, 0, 0, 0,
            0, 0, 0, 0, 0, 358, 337, 334, 336, 362, 363, 333, 364, 340, 0, 0,
            0, 0, 0, 0, 0, 358, 333, 333, 333, 364, 365, 333, 336, 350, 0, 0,
            0, 0, 0, 0, 0, 342, 357, 354, 363, 333, 337, 337, 333, 350, 0, 0,
            0, 0, 0, 0, 0, 0, 338, 346, 365, 336, 335, 333, 362, 345, 0, 0,
            0, 0, 0, 0, 0, 0, 343, 363, 333, 334, 333, 362, 344, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 342, 354, 354, 354, 345, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = 48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 338, 347, 340, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 342, 363, 364, 340,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 342, 363, 364,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 361, 333,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 342, 363,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = 48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            350, 0, 0, 0, 339, 341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            364, 347, 348, 346, 365, 350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            354, 354, 355, 354, 354, 345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 91,
      name = "Details Gazon 2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = 0, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 223, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 229, 0
          }
        },
        {
          x = 16, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 221, 223, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 227, 229, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 223, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 229, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 222, 223,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 231, 229,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 221, 236, 236, 236, 223, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 234, 196, 196, 196, 235, 223, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 234, 196, 196, 196, 196, 233, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 224, 196, 196, 284, 196, 226, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 227, 231, 231, 228, 232, 226, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 226, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 235, 223, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 196, 233, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 231, 229, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 236, 236,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 196, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 196, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 196, 196,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 228, 228,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 236, 223, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 196, 233, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 231, 229, 0, 0,
            223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 236, 236, 222, 223,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 196, 196, 196, 233,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 196, 288, 230, 229,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 228, 228, 229, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 236, 236, 223, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 290, 196, 226, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 196, 196, 226, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 293, 196, 226, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 228, 228, 229, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 48, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 221, 222, 236, 222, 222, 236, 223, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 234, 290, 289, 291, 291, 196, 235, 223, 0, 0, 0, 0, 0,
            0, 0, 0, 224, 196, 295, 196, 196, 196, 196, 235, 223, 0, 0, 0, 0,
            0, 0, 0, 234, 196, 196, 196, 196, 196, 196, 196, 233, 0, 0, 0, 0,
            0, 0, 0, 227, 228, 232, 196, 284, 290, 196, 196, 233, 0, 0, 0, 0,
            0, 0, 0, 0, 221, 237, 295, 196, 287, 196, 230, 229, 0, 0, 0, 0,
            0, 0, 0, 0, 227, 232, 196, 196, 196, 230, 229, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 227, 231, 231, 228, 229, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 16, y = 48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 222, 223, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 232, 235, 223, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 232, 235, 223, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 196, 233, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 232, 235, 236,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 231, 231,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 32, y = 48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 221, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            222, 222, 237, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            231, 231, 231, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 90,
      name = "Falaises 3",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = 48, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 339, 346, 346, 340, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 358, 333, 333, 352, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 358, 333, 333, 350, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 358, 333, 333, 350, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 358, 333, 333, 350, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 342, 354, 354, 345, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 93,
      name = "Details Gazon 3",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = 48, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 221, 236, 222, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 224, 196, 196, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 224, 196, 196, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 234, 196, 295, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 224, 196, 196, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 227, 228, 228, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 43,
      name = "Pic-nic/Blonde a Cossin Lette",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 2276,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2812,
          y = -740,
          width = 605,
          height = 459,
          rotation = 0,
          gid = 74,
          visible = true,
          properties = {}
        },
        {
          id = 2277,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2812,
          y = -592,
          width = 240,
          height = 370,
          rotation = 0,
          gid = 92,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 89,
      name = "Cossin Lette",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 2513,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2590,
          y = 3922,
          width = 192,
          height = 256,
          rotation = 0,
          gid = 25,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 80,
      name = "Objets",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 2478,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4662,
          y = 444,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2481,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1850,
          y = 444,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2482,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2294,
          y = -222,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2483,
          name = "",
          type = "",
          shape = "rectangle",
          x = 888,
          y = 2368,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2484,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2294,
          y = 2072,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2485,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4884,
          y = 2664,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2488,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1184,
          y = 3996,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2491,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4292,
          y = 4292,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2492,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1258,
          y = 1332,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2517,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2812,
          y = -1258,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2528,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1184,
          y = 4144,
          width = 384,
          height = 216,
          rotation = 0,
          gid = 11,
          visible = true,
          properties = {}
        },
        {
          id = 2529,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3256,
          y = 4218,
          width = 384,
          height = 216,
          rotation = 0,
          gid = 2147483660,
          visible = true,
          properties = {}
        },
        {
          id = 2530,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3182,
          y = 4292,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 2531,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2368,
          y = 2368,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 20,
          visible = true,
          properties = {}
        },
        {
          id = 2532,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2738,
          y = 2442,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 21,
          visible = true,
          properties = {}
        },
        {
          id = 2533,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2590,
          y = 2664,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 22,
          visible = true,
          properties = {}
        },
        {
          id = 2534,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2146,
          y = 2368,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 2147483671,
          visible = true,
          properties = {}
        },
        {
          id = 2538,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2294,
          y = 2146,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 48,
          visible = true,
          properties = {}
        },
        {
          id = 2540,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2368,
          y = 2072,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 53,
          visible = true,
          properties = {}
        },
        {
          id = 2541,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2516,
          y = 2146,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 47,
          visible = true,
          properties = {}
        },
        {
          id = 2542,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1258,
          y = 3848,
          width = 313,
          height = 321,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 2543,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4440,
          y = 4292,
          width = 313,
          height = 321,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 2544,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4662,
          y = 4440,
          width = 313,
          height = 321,
          rotation = 0,
          gid = 79,
          visible = true,
          properties = {}
        },
        {
          id = 2545,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4810,
          y = 4366,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 47,
          visible = true,
          properties = {}
        },
        {
          id = 2546,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4366,
          y = 4070,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 47,
          visible = true,
          properties = {}
        },
        {
          id = 2547,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4440,
          y = 4366,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 46,
          visible = true,
          properties = {}
        },
        {
          id = 2548,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2220,
          y = -518,
          width = 313,
          height = 321,
          rotation = 0,
          gid = 2147483729,
          visible = true,
          properties = {}
        },
        {
          id = 2549,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2294,
          y = -370,
          width = 313,
          height = 321,
          rotation = 0,
          gid = 79,
          visible = true,
          properties = {}
        },
        {
          id = 2550,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1554,
          y = 296,
          width = 313,
          height = 321,
          rotation = 0,
          gid = 2147483726,
          visible = true,
          properties = {}
        },
        {
          id = 2551,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1628,
          y = 370,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 55,
          visible = true,
          properties = {}
        },
        {
          id = 2553,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1998,
          y = 296,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 57,
          visible = true,
          properties = {}
        },
        {
          id = 2554,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1924,
          y = 444,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 2555,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1850,
          y = 296,
          width = 256,
          height = 148,
          rotation = 0,
          gid = 13,
          visible = true,
          properties = {}
        },
        {
          id = 2562,
          name = "",
          type = "",
          shape = "rectangle",
          x = 888,
          y = 0,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 47,
          visible = true,
          properties = {}
        },
        {
          id = 2570,
          name = "",
          type = "",
          shape = "rectangle",
          x = 592,
          y = 962,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 49,
          visible = true,
          properties = {}
        },
        {
          id = 2573,
          name = "",
          type = "",
          shape = "rectangle",
          x = 962,
          y = 2294,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 2147483700,
          visible = true,
          properties = {}
        },
        {
          id = 2575,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1258,
          y = 2368,
          width = 384,
          height = 216,
          rotation = 0,
          gid = 2147483660,
          visible = true,
          properties = {}
        },
        {
          id = 2576,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1258,
          y = 3996,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 17,
          visible = true,
          properties = {}
        },
        {
          id = 2578,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1480,
          y = 4218,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 2579,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1628,
          y = 4218,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 47,
          visible = true,
          properties = {}
        },
        {
          id = 2581,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3552,
          y = 2220,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 2147483700,
          visible = true,
          properties = {}
        },
        {
          id = 2583,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2886,
          y = 2220,
          width = 322,
          height = 319,
          rotation = 0,
          gid = 86,
          visible = true,
          properties = {}
        },
        {
          id = 2584,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2960,
          y = 2368,
          width = 313,
          height = 321,
          rotation = 0,
          gid = 81,
          visible = true,
          properties = {}
        },
        {
          id = 2585,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3848,
          y = 2368,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 2586,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3774,
          y = 2664,
          width = 384,
          height = 216,
          rotation = 0,
          gid = 12,
          visible = true,
          properties = {}
        },
        {
          id = 2587,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3256,
          y = 1332,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 21,
          visible = true,
          properties = {}
        },
        {
          id = 2588,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3478,
          y = 1406,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 22,
          visible = true,
          properties = {}
        },
        {
          id = 2589,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3774,
          y = 1258,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 23,
          visible = true,
          properties = {}
        },
        {
          id = 2590,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3552,
          y = 518,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 23,
          visible = true,
          properties = {}
        },
        {
          id = 2591,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4958,
          y = 1036,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 22,
          visible = true,
          properties = {}
        },
        {
          id = 2592,
          name = "",
          type = "",
          shape = "rectangle",
          x = 5032,
          y = 1184,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 23,
          visible = true,
          properties = {}
        },
        {
          id = 2593,
          name = "",
          type = "",
          shape = "rectangle",
          x = 814,
          y = 2146,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 2594,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1702,
          y = 2146,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 17,
          visible = true,
          properties = {}
        },
        {
          id = 2595,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3774,
          y = 1036,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 57,
          visible = true,
          properties = {}
        },
        {
          id = 2597,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2072,
          y = 1702,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 55,
          visible = true,
          properties = {}
        },
        {
          id = 2599,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2146,
          y = 1850,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 46,
          visible = true,
          properties = {}
        },
        {
          id = 2600,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2146,
          y = -222,
          width = 322,
          height = 319,
          rotation = 0,
          gid = 88,
          visible = true,
          properties = {}
        },
        {
          id = 2601,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4736,
          y = 370,
          width = 322,
          height = 319,
          rotation = 0,
          gid = 83,
          visible = true,
          properties = {}
        },
        {
          id = 2602,
          name = "",
          type = "",
          shape = "rectangle",
          x = 5032,
          y = 814,
          width = 313,
          height = 321,
          rotation = 0,
          gid = 79,
          visible = true,
          properties = {}
        },
        {
          id = 2603,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4810,
          y = 2738,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 19,
          visible = true,
          properties = {}
        },
        {
          id = 2604,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4884,
          y = 2516,
          width = 256,
          height = 148,
          rotation = 0,
          gid = 14,
          visible = true,
          properties = {}
        },
        {
          id = 2607,
          name = "",
          type = "",
          shape = "rectangle",
          x = 5032,
          y = 3256,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 16,
          visible = true,
          properties = {}
        },
        {
          id = 2608,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2886,
          y = -1258,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 19,
          visible = true,
          properties = {}
        },
        {
          id = 2609,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2664,
          y = -1258,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 18,
          visible = true,
          properties = {}
        },
        {
          id = 2610,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2368,
          y = -222,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 20,
          visible = true,
          properties = {}
        },
        {
          id = 2611,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2294,
          y = -148,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 23,
          visible = true,
          properties = {}
        },
        {
          id = 2614,
          name = "",
          type = "",
          shape = "rectangle",
          x = 592,
          y = 0,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 2147483671,
          visible = true,
          properties = {}
        },
        {
          id = 2615,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1998,
          y = 2664,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 54,
          visible = true,
          properties = {}
        },
        {
          id = 2616,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2220,
          y = 2738,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 49,
          visible = true,
          properties = {}
        },
        {
          id = 2619,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3108,
          y = 3700,
          width = 322,
          height = 319,
          rotation = 0,
          gid = 84,
          visible = true,
          properties = {}
        },
        {
          id = 2620,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1998,
          y = 3700,
          width = 322,
          height = 319,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 2621,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2072,
          y = 3552,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 55,
          visible = true,
          properties = {}
        },
        {
          id = 2622,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2146,
          y = 3478,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 47,
          visible = true,
          properties = {}
        },
        {
          id = 2623,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3552,
          y = 4070,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 47,
          visible = true,
          properties = {}
        },
        {
          id = 2624,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3774,
          y = 4070,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 49,
          visible = true,
          properties = {}
        },
        {
          id = 2625,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3626,
          y = 4144,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {}
        },
        {
          id = 2626,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4810,
          y = 1998,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 49,
          visible = true,
          properties = {}
        },
        {
          id = 2630,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4736,
          y = 2590,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 2147483701,
          visible = true,
          properties = {}
        },
        {
          id = 2631,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4958,
          y = 962,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 52,
          visible = true,
          properties = {}
        },
        {
          id = 2632,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4366,
          y = -148,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 55,
          visible = true,
          properties = {}
        },
        {
          id = 2633,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4514,
          y = -74,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 56,
          visible = true,
          properties = {}
        },
        {
          id = 2634,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3182,
          y = -370,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 56,
          visible = true,
          properties = {}
        },
        {
          id = 2635,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1924,
          y = -222,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 49,
          visible = true,
          properties = {}
        },
        {
          id = 2636,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1776,
          y = -370,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 54,
          visible = true,
          properties = {}
        },
        {
          id = 2637,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2590,
          y = -1332,
          width = 313,
          height = 321,
          rotation = 0,
          gid = 79,
          visible = true,
          properties = {}
        },
        {
          id = 2638,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2294,
          y = -592,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 47,
          visible = true,
          properties = {}
        },
        {
          id = 2639,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3108,
          y = -444,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 44,
          visible = true,
          properties = {}
        },
        {
          id = 2640,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2442,
          y = -1332,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 44,
          visible = true,
          properties = {}
        },
        {
          id = 2641,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4292,
          y = -74,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 44,
          visible = true,
          properties = {}
        },
        {
          id = 2643,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1554,
          y = 3330,
          width = 128,
          height = 148,
          rotation = 0,
          gid = 53,
          visible = true,
          properties = {}
        },
        {
          id = 2644,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1554,
          y = 3478,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 2147483706,
          visible = true,
          properties = {}
        },
        {
          id = 2645,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1628,
          y = 3404,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 47,
          visible = true,
          properties = {}
        },
        {
          id = 2652,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1702,
          y = 888,
          width = 313,
          height = 321,
          rotation = 0,
          gid = 2147483728,
          visible = true,
          properties = {}
        },
        {
          id = 2653,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1776,
          y = 1110,
          width = 322,
          height = 319,
          rotation = 0,
          gid = 83,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 79,
      name = "Fruits",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 2467,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2738,
          y = 1480,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {
            ["posZ"] = 480
          }
        },
        {
          id = 2469,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2146,
          y = 1110,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 2475,
          name = "",
          type = "",
          shape = "rectangle",
          x = 888,
          y = 148,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 34,
          visible = true,
          properties = {}
        },
        {
          id = 2502,
          name = "",
          type = "",
          shape = "rectangle",
          x = 814,
          y = 3034,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 42,
          visible = true,
          properties = {}
        },
        {
          id = 2512,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4514,
          y = 1406,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 36,
          visible = true,
          properties = {}
        },
        {
          id = 2521,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4884,
          y = 0,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 34,
          visible = true,
          properties = {}
        },
        {
          id = 2527,
          name = "",
          type = "",
          shape = "rectangle",
          x = 962,
          y = 1924,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 35,
          visible = true,
          properties = {}
        },
        {
          id = 2537,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1036,
          y = 2516,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 33,
          visible = true,
          properties = {}
        },
        {
          id = 2642,
          name = "",
          type = "",
          shape = "rectangle",
          x = 888,
          y = 3108,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 44,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
