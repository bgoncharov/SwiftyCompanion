# SwiftyCompanion
IOS application that retrieve the information of 42 student, using the [42 API](https://api.intra.42.fr/apidoc). 42 Silicon Valley project.

![First screen](https://github.com/bgoncharov/Images/blob/master/SwiftyCompanion/gif/1.gif | width=100)
![First screen](https://github.com/bgoncharov/Images/blob/master/SwiftyCompanion/gif/2.gif)

I spent about 6 days for this project. Actyaly it was one of my first IOS apllications. 
`SwiftyCompanion` have 2 Views: first View uses for login input and second View shows student information. Second View uses `ScrollView` and two `TableViews` to display student skills and finished projects. Also at this project I used three Pods: [Alamofire](https://github.com/Alamofire/Alamofire), [Locksmith](https://github.com/Alamofire/Alamofire), [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON).

## Installation

```bash
git clone https://github.com/bgoncharov/SwiftyCompanion.git
cd ~/SwiftyCompanion
open SwiftyCompanion.xcworkspace
```

## Requirements

Mandatory Part :

- [x] Must have at least 2 Views
- [x] The first View must contain a field to put text to search 42 logins
- [x] Display the profile picture and at least 4 other details of the student
- [x] Display the skills with level and percentage
- [x] Display the projects that user has done
- [x] Must be able to go back to the first view
- [x] Must use Auto Layout
- [x] Do not create a token for each query
 
Bonus :

- [x] Use of OAuth 2.0
- [x] Use of custom cells
- [x] Recreate token at expire date
- [x] Design
- [x] Srcollview

## Examples

Try searching bogoncha, kdenisov, vlazuka.

Made @ 42SV
