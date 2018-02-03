// const request = new XMLHttpRequest();
// request.open('GET', '/api/cards', true);
// request.onload = function() {
//   if (request.status >= 200 && request.status < 400) {
//     const data = JSON.parse(request.responseText);
//   } else {
//     // reached target server but it returned an error
//   }
// }
// request.onerror = function() {
//   // connection error
// }

// request.send();

// async function fetchCards () {
//   return await (await fetch('/api/cards')).json();
// }

export const fetchCards = async () => (
  await (await fetch('/api/cards')).json()
);

// async function fetchCards (searchParam) {
//   // const response = await fetch('/api/cards');
//   return await (await fetch('/api/cards')).json();
// }

// class NoteAPI {
//   constructor() {

//   }

//   async fetchCards(url) {
//     const data = await (
//       await (fetch(url)
//         .then(res => res.json())
//         .catch(err => err)
//       )
//     );
//     return data;
//   }
// }