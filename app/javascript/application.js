import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import { createRoot } from "react-dom/client"
import Hello from "./components/Hello"

document.addEventListener("turbo:load", () => {
  const container = document.getElementById("react-root")
  if (container && !container.dataset.reactMounted) {
    container.dataset.reactMounted = "true"
    const root = createRoot(container)
    root.render(<Hello name="React" />)
  }
})
