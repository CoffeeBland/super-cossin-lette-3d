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
  nextlayerid = 14,
  nextobjectid = 72,
  properties = {
    ["name"] = "TUTORIEL",
    ["vars.nextMap"] = "Niveau1",
    ["vars.targetFruits"] = 1,
    ["vars.timer"] = 15
  },
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      filename = "../tiled/tileset.tsx",
      exportfilename = "../data/tileset.lua"
    },
    {
      name = "objects",
      firstgid = 284,
      filename = "../tiled/objects.tsx",
      exportfilename = "../data/objects.lua"
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 10,
      name = "O",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 59,
          name = "",
          type = "",
          shape = "rectangle",
          x = -209.667,
          y = -801.667,
          width = 192,
          height = 256,
          rotation = 0,
          gid = 308,
          visible = true,
          properties = {}
        },
        {
          id = 60,
          name = "",
          type = "",
          shape = "rectangle",
          x = -740,
          y = 1245.67,
          width = 605,
          height = 459,
          rotation = 0,
          gid = 357,
          visible = true,
          properties = {
            ["disabled"] = true
          }
        },
        {
          id = 61,
          name = "",
          type = "",
          shape = "rectangle",
          x = -1850,
          y = -3034,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 316,
          visible = true,
          properties = {
            ["disabled"] = true,
            ["name"] = "fruit1"
          }
        },
        {
          id = 62,
          name = "",
          type = "",
          shape = "rectangle",
          x = -2207.67,
          y = -3034,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 325,
          visible = true,
          properties = {
            ["disabled"] = true,
            ["name"] = "fruit2"
          }
        },
        {
          id = 63,
          name = "",
          type = "",
          shape = "rectangle",
          x = -2553,
          y = -3021.67,
          width = 128,
          height = 192,
          rotation = 0,
          gid = 321,
          visible = true,
          properties = {
            ["disabled"] = true,
            ["name"] = "fruit3"
          }
        },
        {
          id = 65,
          name = "",
          type = "",
          shape = "rectangle",
          x = -3379.33,
          y = -727.667,
          width = 1152,
          height = 1024,
          rotation = 0,
          gid = 373,
          visible = true,
          properties = {
            ["name"] = "arch"
          }
        },
        {
          id = 66,
          name = "",
          type = "",
          shape = "rectangle",
          x = -2762.67,
          y = 1221,
          width = 1024,
          height = 1286,
          rotation = 0,
          gid = 376,
          visible = true,
          properties = {
            ["name"] = "tree",
            ["truncateHeight"] = 230
          }
        }
      }
    }
  }
}
