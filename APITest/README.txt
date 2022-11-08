NOTES:

- I chose the API described here: https://metmuseum.github.io

- There are no tests involving network calls. This is intentional, as networking calls may fail for a variety of reasons, including but not limited to issues such as network availability, server availability, changes in APIs.

- Some Decodable objects have all of their member variables optional. This is due to the fact that there's lots of them and I could not possibly test them all with the API. In a real world situation, this would have to be done with tests on the server side, and a specification would be needed for the client side

- I did not implement all the possible API calls due to not having enough time for this

- Code coverage for tests is far from ideal but again this is just an example project

- I did not put any effort in making the app beautifully designed

