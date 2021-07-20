// wd create-entity create-office.js "Minister for X"
module.exports = (label) => {
  return {
    type: 'item',
    labels: {
      en: label,
    },
    descriptions: {
      en: 'Welsh Cabinet position',
    },
    claims: {
      P31:   { value: 'Q294414' }, // instance of: public office
      P279:  { value: 'Q83307'  }, // subclas of: minister
      P17:   { value: 'Q145'    }, // country: UK
      P1001: { value: 'Q25'     }, // jurisdiction: Wales
      P361: {                      // part of: Cabinet of Wales
        value: 'Q32859630',
        references: {
          P854: 'https://gov.wales/cabinet-members-and-ministers'
        },
      }
    }
  }
}
