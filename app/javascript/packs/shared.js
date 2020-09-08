$(() => {
  const linkifyTableRow = () => {
    $("tr[data-link]").click(function() {
      window.location = $(this).data("link")
    })
  }

  linkifyTableRow()
})
