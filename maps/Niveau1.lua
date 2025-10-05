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
  nextlayerid = 49,
  nextobjectid = 2326,
  properties = {
    ["vars.nextMap"] = "Niveau2",
    ["vars.targetFruits"] = 1
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
            ["height"] = 800,
            ["offsetX"] = 510,
            ["offsetY"] = 1210,
            ["replaceTo[0]"] = {
              ["flipX"] = "random",
              ["ids"] = "5,6,7"
            },
            ["replaceTo[1]"] = {
              ["flipX"] = "random",
              ["ids"] = "2,3,4",
              ["posY"] = 0
            }
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
            ["fruit"] = "apple",
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
            ["fruit"] = "banana",
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
            ["fruit"] = "pineapple",
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
            ["fruit"] = "pear",
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
            ["fruit"] = "tomato",
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
            ["fruit"] = "orange",
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
            ["fruit"] = "mushroom",
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
            ["fruit"] = "grape",
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
            ["fruit"] = "durian",
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
            ["fruit"] = "peach",
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
            ["dropRange"] = 800,
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
            ["height"] = 80,
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
            ["height"] = 80,
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
            ["height"] = 160,
            ["offsetX"] = 400,
            ["offsetY"] = 360,
            ["posZ"] = 320
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
                  { x = -148.667, y = -125.333 },
                  { x = -487, y = 75 },
                  { x = -915.333, y = -171 },
                  { x = -661.333, y = -322.667 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 0,
          properties = {
            ["height"] = 480,
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
                  { x = 164, y = 104 },
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
            ["height"] = 480,
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
                  { x = -40.3333, y = -7.66667 },
                  { x = 192, y = 99 },
                  { x = 519, y = -76 },
                  { x = 297.333, y = -200 }
                },
                properties = {}
              }
            }
          }
        },
        {
          id = 2,
          properties = {
            ["autoshadow"] = true,
            ["height"] = 230,
            ["offsetX"] = 510,
            ["offsetY"] = 620,
            ["posZ"] = 600
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
                id = 2,
                name = "",
                type = "",
                shape = "ellipse",
                x = 170.667,
                y = 214.333,
                width = 682.667,
                height = 428.667,
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
            ["autoshadow"] = true,
            ["height"] = 230,
            ["offsetX"] = 510,
            ["offsetY"] = 620,
            ["posZ"] = 600
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
                id = 1,
                name = "",
                type = "",
                shape = "ellipse",
                x = 170.667,
                y = 214.333,
                width = 682.667,
                height = 428.667,
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
            ["autoshadow"] = true,
            ["height"] = 230,
            ["offsetX"] = 510,
            ["offsetY"] = 620,
            ["posZ"] = 600
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
                x = 170.667,
                y = 214.333,
                width = 682.667,
                height = 428.667,
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
            ["height"] = 700,
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
            ["height"] = 700,
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
            ["height"] = 700,
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
            ["offsetX"] = 123,
            ["offsetY"] = 368,
            ["prefab"] = "blonde"
          },
          image = "../img/Blonde.png",
          width = 224,
          height = 404
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
            }
          }
        }
      },
      tilecount = 234,
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
          x = 0, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 278, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 274, 195, 195, 277,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 280, 195, 195, 195, 195, 272,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 279, 195, 272, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 271, 195, 195, 275,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 280, 195, 195, 271, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 276, 195, 271,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 271, 195, 195, 195, 195, 270,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 282, 274, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 273, 280, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 282, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 278, 195, 195, 279, 280
          }
        },
        {
          x = 16, y = 0, width = 16, height = 16,
          data = {
            195, 195, 195, 195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 279,
            195, 195, 195, 195, 195, 195, 281, 195, 270, 195, 195, 195, 272, 195, 195, 195,
            195, 195, 195, 195, 279, 270, 195, 195, 195, 195, 270, 273, 195, 274, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 273, 277,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 278, 195, 195, 195, 195, 195, 270,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 277, 195, 195, 195, 274, 195, 195, 281, 272, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 280, 195, 195, 195, 195, 195, 195,
            280, 195, 195, 195, 195, 195, 195, 272, 195, 195, 273, 195, 195, 195, 270, 195,
            279, 195, 195, 276, 195, 195, 195, 195, 195, 274, 195, 275, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 272,
            195, 195, 278, 195, 195, 195, 279, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            277, 195, 195, 195, 195, 195, 195, 272, 195, 195, 275, 195, 195, 195, 195, 281,
            195, 195, 195, 195, 195, 271, 195, 272, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 273, 195, 195, 275, 195, 195, 274, 195, 195, 281, 195, 195, 195, 279, 195
          }
        },
        {
          x = 32, y = 0, width = 16, height = 16,
          data = {
            195, 195, 195, 280, 195, 280, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 273, 195, 195, 270, 195, 195, 275,
            195, 195, 195, 195, 195, 278, 195, 195, 281, 195, 195, 271, 195, 195, 195, 195,
            279, 195, 195, 195, 277, 195, 195, 195, 279, 195, 195, 195, 276, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 281, 274, 271, 273, 195, 270, 279, 278,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 271, 195, 195, 195, 271, 195, 270, 195, 273, 195, 195,
            195, 195, 195, 276, 195, 281, 195, 195, 195, 195, 195, 195, 195, 272, 282, 195,
            195, 276, 195, 195, 195, 271, 270, 195, 280, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 277, 195, 195, 195, 195, 195, 195, 195, 195, 272, 195, 195, 195, 195,
            195, 195, 195, 195, 276, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            279, 195, 195, 195, 195, 195, 195, 195, 195, 195, 282, 195, 279, 282, 195, 195,
            195, 270, 195, 280, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 272, 195, 195, 195, 195, 195, 195, 273, 195, 282, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 274, 195, 195
          }
        },
        {
          x = 48, y = 0, width = 16, height = 16,
          data = {
            195, 195, 195, 195, 277, 274, 195, 195, 195, 273, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 281, 195, 195, 195, 195, 277, 195, 279, 274,
            195, 281, 195, 280, 195, 279, 272, 195, 195, 195, 195, 274, 195, 281, 195, 271,
            195, 276, 195, 195, 195, 195, 195, 195, 276, 195, 270, 195, 195, 195, 195, 195,
            277, 195, 195, 195, 195, 273, 282, 281, 195, 195, 271, 195, 195, 195, 195, 195,
            195, 280, 195, 195, 280, 195, 195, 195, 195, 195, 195, 195, 271, 195, 195, 195,
            195, 195, 195, 272, 195, 195, 281, 195, 195, 278, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 280, 195, 274, 195,
            195, 195, 195, 195, 276, 272, 195, 282, 195, 195, 275, 195, 276, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 278, 282, 195, 282, 275, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 277, 278, 195, 195, 195,
            273, 195, 277, 277, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 275,
            195, 195, 195, 195, 195, 195, 281, 195, 195, 195, 195, 195, 195, 195, 275, 195,
            195, 195, 195, 195, 195, 195, 271, 279, 195, 270, 195, 195, 195, 195, 195, 195,
            195, 272, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195
          }
        },
        {
          x = 64, y = 0, width = 16, height = 16,
          data = {
            195, 195, 195, 195, 195, 273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            275, 272, 195, 271, 195, 276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 274, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 271, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 273, 195, 276, 279, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 271, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 277, 195, 277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 281, 195, 195, 280, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            279, 195, 276, 278, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 274, 281, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 273, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 275, 195, 195, 195, 195, 274,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 276, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 270,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 273, 195, 195, 278, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 273, 276, 195, 195, 273, 271,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 276, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 280, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 279, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 270, 195, 195, 274, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 272, 195, 278, 195, 276,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 274, 195, 273, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 280, 195, 272, 195, 276,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 277
          }
        },
        {
          x = 16, y = 16, width = 16, height = 16,
          data = {
            195, 195, 195, 195, 195, 280, 195, 273, 195, 195, 195, 195, 195, 195, 270, 195,
            195, 195, 195, 195, 195, 195, 277, 195, 195, 282, 275, 195, 195, 195, 282, 195,
            195, 195, 280, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 275,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 280, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 273, 270, 195, 279, 273, 195,
            195, 195, 282, 195, 195, 195, 275, 270, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 274, 195, 195, 195, 195, 195, 195,
            195, 270, 195, 195, 195, 195, 274, 195, 195, 195, 195, 195, 275, 195, 195, 195,
            195, 195, 276, 195, 195, 195, 195, 195, 195, 270, 195, 278, 195, 195, 195, 195,
            276, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 279, 195, 195,
            195, 195, 195, 277, 195, 195, 195, 272, 195, 275, 195, 195, 195, 195, 195, 195,
            274, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 279, 195, 277,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 277, 195, 195, 195, 195, 275, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 280, 280, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195
          }
        },
        {
          x = 32, y = 16, width = 16, height = 16,
          data = {
            280, 276, 195, 195, 195, 195, 195, 195, 195, 195, 273, 195, 195, 195, 195, 195,
            195, 276, 273, 195, 195, 195, 195, 195, 280, 195, 195, 195, 280, 195, 278, 195,
            195, 280, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 273, 195, 195, 195,
            272, 195, 195, 195, 195, 195, 272, 195, 282, 195, 195, 195, 195, 195, 195, 277,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 278, 272, 195, 195, 195, 195,
            195, 274, 195, 195, 195, 195, 195, 195, 274, 195, 195, 274, 275, 195, 195, 195,
            195, 195, 195, 195, 282, 195, 195, 195, 195, 195, 274, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 280, 195, 195,
            195, 195, 195, 195, 282, 195, 195, 195, 195, 282, 272, 195, 195, 195, 274, 195,
            195, 195, 195, 195, 195, 277, 195, 195, 195, 195, 195, 195, 275, 195, 273, 195,
            195, 195, 274, 275, 195, 195, 276, 195, 195, 272, 278, 272, 195, 195, 195, 195,
            270, 195, 278, 195, 195, 281, 195, 195, 195, 195, 195, 195, 275, 280, 195, 195,
            195, 195, 195, 272, 195, 195, 195, 195, 195, 195, 195, 277, 272, 270, 195, 271,
            195, 195, 271, 195, 195, 195, 272, 282, 195, 195, 195, 195, 273, 195, 271, 195,
            281, 195, 195, 282, 195, 195, 195, 276, 195, 195, 195, 195, 195, 195, 195, 195,
            276, 281, 195, 195, 195, 195, 195, 279, 195, 195, 195, 281, 195, 195, 195, 195
          }
        },
        {
          x = 48, y = 16, width = 16, height = 16,
          data = {
            195, 195, 195, 195, 270, 195, 195, 195, 195, 195, 280, 195, 278, 195, 195, 195,
            195, 195, 195, 273, 195, 195, 195, 195, 195, 277, 195, 195, 195, 195, 277, 195,
            195, 195, 195, 271, 195, 195, 272, 195, 280, 195, 195, 195, 195, 271, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 273, 195, 195, 195,
            195, 195, 274, 195, 195, 195, 273, 195, 195, 195, 195, 280, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 270, 195, 279, 195, 195, 195, 278, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 277, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 282, 195, 282, 276, 195, 195, 271, 195, 195, 195, 282, 281, 195, 195, 195,
            195, 195, 195, 195, 195, 279, 195, 274, 195, 195, 278, 278, 195, 195, 195, 195,
            195, 195, 195, 195, 276, 195, 273, 195, 195, 195, 195, 282, 195, 195, 195, 195,
            195, 195, 195, 270, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            271, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 271, 271, 195, 195, 195,
            195, 195, 195, 272, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 279, 195, 195, 195, 195, 275, 274, 195, 195, 195, 195, 282, 195, 195, 195,
            195, 195, 195, 277, 195, 195, 195, 195, 195, 277, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 274, 195, 195, 195, 195, 195, 195, 195
          }
        },
        {
          x = 64, y = 16, width = 16, height = 16,
          data = {
            277, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 281, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 281, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 272, 195, 277, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 274, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            277, 195, 273, 273, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 279, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 273, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 277, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 278, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            275, 195, 195, 272, 195, 278, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 32, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 277,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 271, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 280,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 274, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 282, 195, 195, 272, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 271,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 281, 195, 279, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 270, 279, 277, 277, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 280, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 277, 270, 195, 195, 281,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 281,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 274, 195, 195, 195, 195
          }
        },
        {
          x = 16, y = 32, width = 16, height = 16,
          data = {
            195, 195, 195, 195, 195, 195, 195, 195, 195, 271, 195, 195, 195, 195, 195, 195,
            271, 195, 195, 279, 195, 275, 280, 195, 195, 195, 280, 195, 195, 195, 195, 277,
            195, 195, 195, 195, 195, 195, 195, 278, 195, 270, 277, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 271, 279, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 278, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 277, 274,
            195, 280, 195, 195, 195, 195, 271, 195, 279, 270, 195, 282, 195, 195, 195, 195,
            195, 272, 195, 195, 195, 195, 195, 195, 195, 195, 273, 195, 195, 195, 280, 195,
            195, 195, 195, 195, 273, 195, 195, 195, 195, 280, 282, 195, 195, 195, 195, 195,
            195, 195, 277, 195, 195, 195, 195, 195, 195, 195, 195, 270, 195, 195, 195, 195,
            195, 278, 195, 195, 195, 195, 195, 195, 195, 195, 195, 273, 276, 195, 195, 195,
            195, 282, 271, 195, 195, 195, 195, 278, 275, 195, 195, 195, 195, 275, 195, 195,
            195, 280, 195, 195, 195, 195, 195, 195, 195, 276, 195, 274, 195, 195, 195, 195,
            195, 195, 276, 195, 195, 195, 195, 281, 274, 195, 270, 195, 195, 195, 281, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 276, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 270, 281, 195, 195, 195, 274, 195, 279
          }
        },
        {
          x = 32, y = 32, width = 16, height = 16,
          data = {
            277, 195, 277, 195, 195, 195, 195, 195, 195, 277, 195, 195, 195, 195, 195, 270,
            277, 195, 195, 195, 195, 195, 270, 275, 270, 195, 272, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 278, 195,
            195, 195, 195, 195, 195, 195, 195, 271, 276, 195, 195, 195, 195, 195, 195, 195,
            195, 272, 195, 195, 195, 195, 195, 195, 195, 195, 195, 273, 277, 195, 195, 195,
            275, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 272, 273, 195,
            195, 281, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            274, 195, 279, 195, 195, 195, 270, 195, 195, 278, 195, 195, 195, 195, 281, 277,
            195, 195, 275, 195, 195, 195, 195, 282, 195, 195, 195, 195, 195, 195, 273, 195,
            195, 279, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195, 270, 275, 195, 275,
            195, 274, 195, 195, 274, 195, 195, 276, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 273, 195, 195, 195, 282, 195, 195,
            195, 195, 195, 195, 272, 275, 195, 195, 195, 195, 195, 273, 195, 195, 195, 195,
            195, 195, 195, 276, 195, 195, 195, 195, 273, 274, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 278, 276, 195,
            195, 195, 278, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 277, 195
          }
        },
        {
          x = 48, y = 32, width = 16, height = 16,
          data = {
            195, 195, 195, 195, 195, 195, 195, 281, 195, 195, 195, 282, 195, 195, 280, 195,
            282, 195, 277, 276, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            278, 195, 195, 195, 272, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 275, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 275, 279, 195,
            195, 195, 195, 270, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 277,
            195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 282, 195, 195, 195, 272, 195,
            195, 195, 195, 195, 195, 195, 195, 275, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 281, 195, 282, 274, 276, 195, 195, 195, 195, 195, 195,
            195, 271, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            277, 275, 275, 271, 277, 195, 278, 195, 195, 279, 195, 195, 280, 195, 195, 195,
            195, 195, 195, 195, 280, 195, 281, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            195, 270, 272, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 281, 195, 279,
            195, 195, 195, 195, 195, 275, 195, 195, 195, 195, 195, 195, 195, 195, 281, 195,
            195, 277, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 275,
            195, 195, 195, 195, 195, 195, 195, 277, 195, 195, 195, 195, 195, 195, 270, 195,
            195, 195, 195, 195, 195, 195, 195, 195, 281, 195, 275, 195, 195, 195, 195, 195
          }
        },
        {
          x = 64, y = 32, width = 16, height = 16,
          data = {
            272, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 279, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 280, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            273, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 275, 195, 195, 281, 272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 277, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 280, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            271, 277, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 277, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 277, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 280, 270, 195, 279, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 195, 280, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 48, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 270, 195, 195, 195, 195, 195,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195, 195, 195, 195, 195,
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
          x = 16, y = 48, width = 16, height = 16,
          data = {
            195, 195, 195, 277, 195, 195, 195, 195, 272, 195, 273, 280, 271, 273, 195, 195,
            195, 195, 195, 195, 195, 276, 195, 280, 195, 195, 195, 195, 195, 195, 195, 195,
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
          x = 32, y = 48, width = 16, height = 16,
          data = {
            273, 195, 195, 195, 195, 280, 271, 195, 275, 280, 195, 195, 195, 195, 195, 195,
            195, 195, 195, 195, 195, 195, 281, 195, 195, 195, 195, 195, 195, 281, 195, 195,
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
          x = 48, y = 48, width = 16, height = 16,
          data = {
            195, 195, 195, 282, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195,
            280, 195, 195, 195, 273, 195, 195, 195, 195, 274, 195, 195, 195, 195, 195, 275,
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
          x = 64, y = 48, width = 16, height = 16,
          data = {
            195, 281, 274, 195, 195, 273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            195, 195, 280, 195, 195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 48,
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
          x = 48, y = 16, width = 16, height = 16,
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
            0, 0, 0, 0, 0, 253, 120, 123, 121, 123, 123, 123, 120, 123, 120, 123,
            0, 0, 0, 0, 0, 107, 259, 261, 259, 256, 261, 261, 261, 255, 261, 261,
            0, 0, 0, 0, 0, 108, 261, 261, 261, 261, 261, 261, 258, 261, 261, 261,
            0, 0, 0, 0, 0, 108, 258, 255, 259, 260, 261, 261, 256, 261, 261, 261,
            0, 0, 0, 0, 0, 126, 113, 111, 110, 110, 113, 109, 113, 109, 110, 110,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 64, y = 16, width = 16, height = 16,
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
            123, 129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            261, 117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            261, 118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            261, 117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            113, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
          y = 2146,
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
          x = 2960,
          y = 2294,
          width = 224,
          height = 404,
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
      id = 44,
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
          id = 2275,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4588,
          y = 2072,
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
      id = 47,
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
          id = 2286,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4144,
          y = 2072,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 33,
          visible = true,
          properties = {}
        },
        {
          id = 2287,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1480,
          y = 2368,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 42,
          visible = true,
          properties = {}
        },
        {
          id = 2288,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3256,
          y = 666,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {}
        },
        {
          id = 2289,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1184,
          y = 666,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 2290,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3034,
          y = 3108,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 34,
          visible = true,
          properties = {
            ["vars.nextMap"] = "Niveau2",
            ["vars.targetFruits"] = 4
          }
        },
        {
          id = 2321,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4810,
          y = 962,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 38,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 46,
      name = "Objects",
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
          id = 2279,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4070,
          y = 2368,
          width = 1152,
          height = 1024,
          rotation = 0,
          gid = 2147483738,
          visible = true,
          properties = {}
        },
        {
          id = 2280,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1850,
          y = 2590,
          width = 1152,
          height = 1024,
          rotation = 0,
          gid = 90,
          visible = true,
          properties = {}
        },
        {
          id = 2281,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3330,
          y = 814,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2282,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4736,
          y = 814,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2283,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1702,
          y = 962,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2284,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1258,
          y = 3330,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 2300,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1554,
          y = 2590,
          width = 256,
          height = 148,
          rotation = 0,
          gid = 72,
          visible = true,
          properties = {}
        },
        {
          id = 2301,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1480,
          y = 2664,
          width = 128,
          height = 72,
          rotation = 0,
          gid = 64,
          visible = true,
          properties = {}
        },
        {
          id = 2302,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1628,
          y = 2886,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 71,
          visible = true,
          properties = {}
        },
        {
          id = 2303,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1776,
          y = 2886,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 70,
          visible = true,
          properties = {}
        },
        {
          id = 2306,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1554,
          y = 2812,
          width = 256,
          height = 148,
          rotation = 0,
          gid = 63,
          visible = true,
          properties = {}
        },
        {
          id = 2307,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1702,
          y = 2738,
          width = 256,
          height = 148,
          rotation = 0,
          gid = 63,
          visible = true,
          properties = {}
        },
        {
          id = 2308,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1702,
          y = 2442,
          width = 256,
          height = 148,
          rotation = 0,
          gid = 63,
          visible = true,
          properties = {}
        },
        {
          id = 2309,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1850,
          y = 2812,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 65,
          visible = true,
          properties = {}
        },
        {
          id = 2310,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1998,
          y = 2812,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 67,
          visible = true,
          properties = {}
        },
        {
          id = 2312,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1554,
          y = 1776,
          width = 256,
          height = 148,
          rotation = 0,
          gid = 72,
          visible = true,
          properties = {}
        },
        {
          id = 2313,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1480,
          y = 1628,
          width = 256,
          height = 148,
          rotation = 0,
          gid = 63,
          visible = true,
          properties = {}
        },
        {
          id = 2314,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1554,
          y = 1628,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 2147483719,
          visible = true,
          properties = {}
        },
        {
          id = 2315,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1480,
          y = 1480,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 65,
          visible = true,
          properties = {}
        },
        {
          id = 2316,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1406,
          y = 1406,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 70,
          visible = true,
          properties = {}
        },
        {
          id = 2322,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4144,
          y = 1554,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 21,
          visible = true,
          properties = {}
        },
        {
          id = 2323,
          name = "",
          type = "",
          shape = "rectangle",
          x = 4070,
          y = 1332,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 20,
          visible = true,
          properties = {}
        },
        {
          id = 2324,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3330,
          y = 888,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 23,
          visible = true,
          properties = {}
        },
        {
          id = 2325,
          name = "",
          type = "",
          shape = "rectangle",
          x = 3700,
          y = 1036,
          width = 128,
          height = 74,
          rotation = 0,
          gid = 2147483669,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
