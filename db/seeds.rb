users = User.create([
  { first_name: 'John', last_name: 'Doe', email: 'john.doe@gmail.com', picture: 'beard1.jpg', description: 'Nulla vitae elit libero, a pharetra augue. Sed posuere consectetur est at lobortis.' },
  { first_name: 'Will', last_name: 'Miths', email: 'will.miths@gmail.com', picture: 'beard2.jpg', description: 'Aenean lacinia bibendum nulla sed consectetur.'},
  { first_name: 'Tommy', last_name: 'Bollock', email: 'tommy.bollock@gmail.com', picture: 'beard3.jpg', description: 'Nullam id dolor id nibh ultricies vehicula ut id elit. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.' },
  { first_name: 'Kevin', last_name: 'Bridges', email: 'kevin.bridges@gmail.Com', picture: 'beard4.jpg', description: 'Donec sed odio dui. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.'}
])
accomodations = Accomodation.create([
  { description: 'Nicest flat ever', night_rate: '40', accomodates: '20', address: '18 Passage Montmartre, 75018 Paris'},
  { description: 'Worst flat ever', night_rate: '50', accomodates: '6', address: '10 Passage Lathuille, 75018 Paris'},
  { description: 'Flowery ceiling', night_rate: '20', accomodates: '4', address: '20 Rue de la Paix, 75016 Paris'},
  { description: "David's Hairy Flat", night_rate: '200', accomodates: '2', address: '3 rue du Delta, 75009 Paris'}
])
#[{ first_name: '' }, { last_name: '' }, { email: '' }, { picture: '' }, { description: '' }]
