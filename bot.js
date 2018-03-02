console.log("bot is starting")

var Twit = require('twit'); //(https://github.com/ttezel/twit)
var config = require('./config'); //config.js containing acces codes (need to be saved in same folder)
var exec = require('child_process').exec; //to enable bot starting processing-java in terminal
var fs = require('fs'); //required to acces local filesystem in processing function
var T = new Twit(config); //creating new Twit object with acces codes from config.js file

//setInterval(tweetDrawing,1000*60*24);

tweetDrawing()

function tweetDrawing(){
//running processing sketch with processing-java commandline 
var cmd = 'processing-java --sketch=`pwd`/totweet --run'
exec(cmd,processing);
function processing(){
	var filename = 'totweet/output.png'; //name of file processing saves img
	var b64content = fs.readFileSync(filename, {encoding: 'base64'}); //contains all information about file
	T.post('media/upload', { media_data: b64content}, uploaded) //uploads image (not tweets yet)
	console.log('finished');

function uploaded(err, data, response){
	//actually tweets image
	var id = data.media_id_string;
	var tweet = {
		status:'another beautiful image generated for more #creativecoding',
		media_ids: [id]
	}
	T.post('statuses/update', tweet, function(err, data, response) {
  	console.log(data)});
}
}
}

//post Thank you to every follower with user stream
 var stream = T.stream('user');
 stream.on('follow',followed); //anytime someone follows the bot 'followed' is called
 
 function followed(eventMsg) {
 	var name = eventMsg.source.screen_name;
 	tweetWelcome(name);
 } 

 function tweetWelcome(name){
 	var cmd = 'processing-java --sketch=`pwd`/totweet --run'
 	exec(cmd,processing);

 function processing(){
	var filename = 'totweet/output.png'; //name of file processing saves img
	var b64content = fs.readFileSync(filename, {encoding: 'base64'}); //contains all information about file
	T.post('media/upload', { media_data: b64content}, response_uploaded) //uploads image (not tweets yet)
	console.log('finished');

 function response_uploaded(err,data,response){
 	var id = data.media_id_string;
 	var response_tweet= {
 		status: '@'+name+ ' thanks for following. This is a super unique welcome drawing for you!',
 		media_ids: [id],
 	}

	T.post('statuses/update', response_tweet, function(err, data, response) {
  	console.log(data)});
}
}
}
