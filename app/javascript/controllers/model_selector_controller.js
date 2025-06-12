import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["model", "selectedList"]

  connect() {
    this.selectedIds = []
    this.renderSelected()

    document.addEventListener("turbo:frame-render", this.resetIfFormChanged)
  }

  disconnect() {
    document.removeEventListener("turbo:frame-render", this.resetIfFormChanged)
  }

  select(event) {
    const element = event.currentTarget
    const id = element.dataset.modelId

    if (this.selectedIds.includes(id)) {
      this.selectedIds = this.selectedIds.filter(x => x !== id)
      element.classList.remove("selected")
    } else {
      this.selectedIds.push(id)
      element.classList.add("selected")
    }
    this.renderSelected()
    window.dispatchEvent(new CustomEvent("models:selected", { detail: { ids: this.selectedIds } }))
  }

  renderSelected() {
    if (this.hasSelectedListTarget) {
      this.selectedListTarget.innerHTML = this.selectedIds.map(id => {
        const el = this.modelTargets.find(m => m.dataset.modelId === id)
        return el ? el.dataset.modelName : ""
      }).filter(Boolean).join(", ")
    }
  }


  resetIfFormChanged = (event) => {
    if (event.target.id === "create_panel") {
      this.selectedIds = []
      this.modelTargets.forEach(el => el.classList.remove("selected"))
      this.renderSelected()
      window.dispatchEvent(new CustomEvent("models:selected", { detail: { ids: this.selectedIds } }))
    }
  }
}
