export const fetchAllPokemon = () => {
  return $.ajax({
    method: "GET",
    url: "/api/pokemon"
  })
}

export const fetchPokemon = (id) => {
  return $.ajax({
    method: "GET",
    url: `/api/pokemon/${id}`
  })
}

export const fetchItems = (id) => {
  return $.ajax({
    method: "GET",
    url: `/api/pokemon/${id}/items`
  })
}