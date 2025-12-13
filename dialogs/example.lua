return {
  { id = 1, speaker = "Guide", text = "Welcome to Cosmic Cities!" },
  { id = 2, speaker = "Guide", text = "Do you want a quick tour?",
    choices = {
      { text = "Yes, please.", next = 3 },
      { text = "No thanks.", next = 4 }
    }
  },
  { id = 3, speaker = "Guide", text = "Great! Use WASD to move and ESC to pause.", choices = { { text = "Got it.", next = 0 } } },
  { id = 4, speaker = "Guide", text = "Okay. You can start exploring right away!", choices = { { text = "Cool.", next = 0 } } },
}
