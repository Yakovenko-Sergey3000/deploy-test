const listDiv = document.querySelector(".list")
const form = document.querySelector(".form")


document.addEventListener("DOMContentLoaded", () => {
  let namesList = []

  const changeList = (list) => {

    listDiv.innerHTML = `
      <ui>
        ${list.reduce((acc, el) => acc += `<li>${el}</li>`, "")}
      </ui>
    `
  }

  namesList = new Proxy(namesList, {
    set(target, p, newValue) {
      if (p !== "length") {
        target.push(newValue)
        changeList(target)
      }

      return true
    }
  })

  form.addEventListener("submit", (e) => {
    e.preventDefault()

    const fd = new FormData(e.target)
    namesList.push(fd.get("name"))
    e.target.reset()
  })

})