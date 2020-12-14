/**
 * Copyright 2018, Google, Inc.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use strict';

// [START app]
const express = require('express');
const app = express();

const pg = require('pg');
const pool = new pg.Pool({
  user: 'postgres',
  database: 'postgis_30_sample',
  password: 'password',
  port: 5433,
  max: 10
})


app.get('/', (req, res) => {
  res.send('Hello from App Engine!');
});

app.get('/help', (req, res) => {
    res.send('Help is here!');
});

app.get('/getall', (req, res) => {

  pool.query('SELECT id, address, geo FROM awtest.myarea',  (error, results) => {
    if (error) {
        throw error
      }
      res.status(200).json(results.rows)
    })

});

app.get('/gisquery/:x/:y/:distance', (req, res) => {
    var x = req.params.x;
    var y = req.params.y;
    var distance = req.params.distance;

   // For some reason this is not working. could not determine data type of parameter $1
   //pool.query('SELECT address, geo, dist FROM ( SELECT address,geo,	ST_Distance(geo, ST_GeomFromText(\'POINT($1 $2)\', 4326)) as "dist" from  awtest.myarea) as nested where dist > $3' ,[x, y, distance],  (error, results) => {
   //  if (error) {
   //       throw error
   //     }
   //    res.status(200).json(results.rows)
   //  })
  
  var sql = 'SELECT address, geo, dist FROM ( SELECT address,geo,	ST_Distance(geo, ST_GeomFromText(\'POINT(' + req.params.x +' ' + req.params.y + ')\', 4326)) as "dist" from  awtest.myarea) as nested where dist > ' + req.params.distance ;

  pool.query(sql ,  (error, results) => {
    if (error) {
        throw error
      }
     res.status(200).json(results.rows)
   })

});


app.get('/logdata/:userid/:logdata', (req,res) => {

  var userid= req.params.userid;
  var logdata = req.params.logdata;
 
  var sql =  'INSERT INTO awtest.logtable(userid, logdata, timestamp) VALUES('+ userid + ',\'' + logdata + '\', current_timestamp);'

  pool.query(sql,  (error, results) => {
    if (error) {
        res.status(200).json(error.message)
      }
      res.send('Insert OK')
    })

})

// Listen to the App Engine-specified port, or 8080 otherwise
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}...`);
});
// [END app]

module.exports = app;