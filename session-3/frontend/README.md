# Frontend implementation for Reviewed!

## Overview

This is the frontend implementation for `Reviewed!`. It consists of a React application that works with a Ballerina GraphQL backend. It uses the Apollo Client on the frontend to connect to the GraphQL backend.

## Get Started

There are two ways to instantly serve up the frontend application:

1. Serve the application using NodeJS.

```bash
npx serve dist --single --listen 3000
```

2. Serve the application using Python.

```bash
python -m http.server 3000 --directory dist
```

> Note: URL rewriting is not supported when serving the production build using Python. Also, the contents of ErrorPage.jsx will not render for invalid URLs.

- Open the browser and navigate to: [http://localhost:3000](http://localhost:3000)

## Running the Application in Development Mode

### Prerequisites

Install the following software.

- [Node.js (version v20.12.0)](https://nodejs.org/en/blog/release/v20.12.0)
- [npm (version 10.5.0 or later)](https://www.npmjs.com/package/npm)

### Steps

1. Install the required project dependencies by running the following command.

```bash
npm install
```

2. To change the backend endpoints, update the environment variables in the `.env` file.

```.env
VITE_GRAPHQL_ENDPOINT_HTTP=http://localhost:9000/reviewed
VITE_GRAPHQL_ENDPOINT_WS=ws://localhost:9000/reviewed
```

3. Start the application.

```bash'
npm run dev
```

4. Open the browser and navigate to [http://localhost:3000](http://localhost:3000).

5. To deploy the application, create a production build by running the following command.

```bash
npm run build
```
