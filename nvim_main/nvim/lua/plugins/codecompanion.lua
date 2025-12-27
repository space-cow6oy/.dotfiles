return {
  "olimorris/codecompanion.nvim",
  config = function()
    require("codecompanion").setup({
      adapters = {
        giga = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://gigachat.devices.sberbank.ru/api", -- optional: default value is ollama url http://127.0.0.1:11434
              api_key = os.getenv("GIGACHAT_API_KEY"), -- optional: if your endpoint is authenticated
              chat_url = "/v1/chat/completions", -- optional: default value, override if different
              models_endpoint = "/v1/models", -- optional: attaches to the end of the URL to form the endpoint to retrieve models
            },
            schema = {
              model = {
                default = "GigaChat", -- define llm model to be used
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "giga",
        },
      },
    })
  end,
}
