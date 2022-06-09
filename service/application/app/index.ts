import * as express from 'express';
import 'express-async-errors';

const client = require('prom-client');
const express = require('express');
const app = express();

// Create a registry and pull default metrics
const register = new client.Registry();

client.collectDefaultMetrics({
    app: 'node-application-monitoring-app',
    prefix: 'node_',
    timeout: 10000,
    gcDurationBuckets: [0.001, 0.01, 0.1, 1, 2, 5],
    register
});

app.get('/metrics', async (req, res) => {
    res.setHeader('Content-Type', register.contentType);
    res.send(await register.metrics());
});

//////////////////////////////////////////////////////////////
// Other get responce info

app.get('*', (req: express.Request, res: express.Response) => {
  const response = {
    hostname: req.hostname,
    uptime: process.uptime(),
    podname: process.env.HOSTNAME,
  };

  res.status(200).send(response);
});

app.listen(3000, () => console.log('Server is running on http://localhost:3000, metrics are exposed on http://localhost:3000/metrics'));
