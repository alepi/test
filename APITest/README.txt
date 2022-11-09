NOTES:

- I chose the API described here: https://metmuseum.github.io

- the API itself is a bit weird, in that for departments one can get a list of object IDs, not the objects themselves directly. This complicates the design of ItemListViewController

- THIS IS AN API ISSUE, NOT AN ISSUE OF MY APP!!! I discovered that the API returns different values for the same call, or the same values but in a different order. Try multiple times from a web browser the folloowing call: https://collectionapi.metmuseum.org/public/collection/v1/objects?departmentIds=1
    Unfortunately, fixing this in the app will require more investigation and more time than what I can spend here.

- I have mixed different techniques just to try different things

- I did not add caching nor offline storage

- Loading of data is slow as there is a lot of data. In a real app I would use pagination. Also, there is no spinning wheel to indicate loading

- There are no tests involving network calls. This is intentional, as networking calls may fail for a variety of reasons, including but not limited to issues such as network availability, server availability, changes in APIs.

- Some Decodable objects have all of their member variables optional. This is due to the fact that there's lots of them and I could not possibly test them all with the API. In a real world situation, this would have to be done with tests on the server side, and a specification would be needed for the client side

- I did not implement all the possible API calls due to not having enough time for this

- Code coverage for tests is far from ideal but again this is just an example project. I did not implement any UITests

- I did not put any effort in making the app beautifully designed

