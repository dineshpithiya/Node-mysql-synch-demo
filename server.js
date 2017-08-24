var Express = require('express');
var bodyParser = require('body-parser');
var app = Express();
app.use(bodyParser.json());

var mysql = require('mysql');
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'Tbl_node_synch'
});

app.post("/getData", function(req, res) 
{
  var userId=40;
  connection.query('SELECT * FROM takes WHERE user_id = ?',[userId], function (error, results, fields) 
  {
    if(results.length >0)
    {
      for(var i = 0; i<results.length; i++) 
      {
        take_id=results[i].take_id;
        key=i.toString();
        connection.query('SELECT * FROM videos WHERE take_id =?',[take_id] ,function (error, videos, fields) 
        {
          results[key].videos=videos;
          //return res.send(results); 
        });
      }
      return res.send(results); // its alway return last array - this is wrong
    }
    else
    {
      return res.send('Opps, something went wrong!');
    }
  });  

});


app.listen(2000, function(a) {
 console.log("Listening to port 2000");
});


/*==Require output look like below==*/
/*
{
   {
        "take_id": 11,
        "user_id": 40,
        "take_name": "mp3123",
        "total_files_count": "0",
        "status": "complete",
        "created_at": "2017-08-22T15:02:16.000Z",
        "videos": [
            {
                "video_id": 14,
                "take_id": 11,
                "file_name": "tbl_product.sql",
                "created_at": "2017-08-22T15:02:15.000Z"
            },
            {
                "video_id": 15,
                "take_id": 11,
                "file_name": "tbl_product.sql",
                "created_at": "2017-08-22T15:02:16.000Z"
            }
        ]
    },
    {
        "take_id": 12,
        "user_id": 40,
        "take_name": "take_2",
        "total_files_count": "0",
        "status": "complete",
        "created_at": "2017-08-22T15:02:50.000Z",
        "videos": [
            {
                "video_id": 14,
                "take_id": 11,
                "file_name": "tbl_product.sql",
                "created_at": "2017-08-22T15:02:15.000Z"
            },
            {
                "video_id": 15,
                "take_id": 11,
                "file_name": "tbl_product.sql",
                "created_at": "2017-08-22T15:02:16.000Z"
            }
        ]
    }
    ..... so on....     
}
*/
