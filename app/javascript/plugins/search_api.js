import igdb from 'igdb-api-node';
import apicalypse from 'apicalypse';

const searchApi = () => {
  // const client = igdb('3d5164cf92d5dd00f6d364c5d713d5ab');
  // // client.games({
  // //     mode: 'no-cors',
  // //     fields: 'name', // Return all fields
  // //     limit: 10, // Limit to 5 results
  // //     // offset: 15 // Index offset for results
  // // }).then(response => {
  // //     console.log(response);
  // // }).catch(error => {
  // //     throw error;
  // // });
  // const requestOptions = {
  //     queryMethod: 'url',
  //     method: 'post', // The default is `get`
  //     baseURL: 'https://api-v3.igdb.com/games',
  //     headers: {
  //         'Accept': 'application/json',
  //         'user-key': '3d5164cf92d5dd00f6d364c5d713d5ab',
  //         'mode': 'no-cors'
  //     },
  //     responseType: 'json',
  //     timeout: 1000, // 1 second timeout
  //     // auth: { // Basic auth
  //     //     username: 'janedoe',
  //     //     password: 's00pers3cret'
  //     // }
  // };

  // const response = await apicalypse(requestOptions)
  //     .fields('name')
  //     .limit(10)
  //     // .query('age > 50 & movies != n')
  //     // After setting the baseURL in the requestOptions,
  //     // you can just use an endpoint in the request
  //     // .request('/actors');

  // console.log(response.data);
  fetch("https://api-v3.igdb.com/games",{
  method: 'GET',
  mode: 'no-cors', //here was added: mode:'no-cors '
  headers: {
    'user-key':'3d5164cf92d5dd00f6d364c5d713d5ab',
    'content_type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json'
  }
})
.then(resp => resp.json())
.then(json => {
  console.log('json',json)
})

}

export { searchApi };
