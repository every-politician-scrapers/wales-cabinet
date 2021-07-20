module.exports = (id, position) => ({
  id,
  claims: {
    P39: {
      value: position,
      qualifiers: {
        P580: '2021-05-13'
      },
      references: {
        P854: 'https://gov.wales/cabinet-members-and-ministers'
      },
    }
  }
})
