# Hobbits Worky
## Flutter / Dart proyect 

## Description
This project is using Flutter and Dart to call the Reddit API. It uses dart imports to decode the JSON file and extract the key information used to filter the post and return it in JSON format.


### Prerequisites
 - Visual Studio Code
 - Flutter [Flutter Extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
 - Dart [Dart Extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code)

Local Configuration

```bash
flutter pub get
```

### Backend

For the backend was categorized in two folders ***api*** and ***bloc***. API folder contains two DART files. 
***api_exceptions*** have possible exceotions that can occur during the HTTP Request. ***api_base_helper*** send the HTTP Request to *https://www.reddit.com/r/lotr/top/.json?limit=100&t=all* in order to get a JSON file as a response.
Reddit API posts GET *https://www.reddit.com/dev/api#GET_top*.

bloc folder includes three DART Files. 
***reddit_bloc*** call the***API_base_helper*** to call the get the HTTP response and send it to ***reddit_response*** to get the value from the JSON File. We are extracting the Title value from each post. 

![Reddit Response](/media/postman.png)

This reponse is send to ***hobbit_filter*** where this information is filter per hobbit (Frodo, Bilbo, Sam, Merry, Pippin, Gollum) using Regular Expressions. The Title posts are added to a `List<String>` for each Hoobit. 

After the posts are Filtered by hobbits they are encoded to a JSON structure and print it on the terminal. 

![Hobbit Response](/media/hobbitsJson.png)