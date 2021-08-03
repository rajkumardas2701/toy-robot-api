# Toy-Robot-API

> This is an app built using Rails API concept, provided as a challenge by one of my connection on LinkedIn.<br>
This App moves Robot on 5X5 surface ensuring it doesn't follow off the board<br>


## Features
1. You can place Robot on the 5X5 surface using PLACE key and providing co-ordinates.
2. You can also rotate Robot left or right or move one unit move in the direction robot is facing.

## Built with
1. Rails 6.1.4
2. Ruby 2.6.5
3. Postgresql in the backend

## Quick Start

### Prerequisite

1. Install Ruby (<a href="https://www.ruby-lang.org/en/documentation/installation/">installation guide</a>)
2. Install Ruby on Rails (<a href="https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails">installation guide</a>)
3. Git and Github

### Get a local copy

git clone https://github.com/rajkumardas2701/toy-robot-api.git

### Installation

After cloning the app, enter below commands in sequence,

<pre>bundle install</pre>
<pre>rails db:create</pre>
<pre>rails db:migrate</pre>
<pre>rails server</pre>

Browse http://127.0.0.1:3000/ to validate if the API is accessible

## Instructions

1. you can use Postman as a client to make a POST query in the format below,
    http://localhost:3000/api/update/:commands?commands=["place 0,1,NORTH", "MOVE"]
2. When you use PLACE key, it ignores previous co-ordinates and places your robot to the specified co-ordinates.
3. MOVE key will move your Robot by one unit in the direction it faces. In the example above, it is facing NORTH.
4. You can also use REPORT key in the place of MOVE, which will provide co-ordinates and orientatio of the report.
5. when you don't provide orientation like, NORTH in the example above, it defaults to NORTH.

## Authors

👤 **Rajkumar Das**

- Github: [@rajkumardas2701](https://github.com/rajkumardas2701)
- Twitter: [@Rajkuma58621299](https://twitter.com/Rajkuma58621299)
- Linkedin: [Rajkumar Das](https://www.linkedin.com/in/rajkumar-das-41308961/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/rajkumardas2701/toy-robot-api/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.