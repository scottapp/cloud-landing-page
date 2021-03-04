# Cloud Run Landing Page

An open source react based landing page served from Google Cloud Run container

## Build and deploy

```bash
gcloud builds submit --tag gcr.io/[YOUR_PROJECT_ID]/cra-landing-page
gcloud run deploy --image gcr.io/[YOUR_PROJECT_ID]/cra-landing-page --platform managed
```

## Running
Check out the landing page by visiting the url displayed after the deployment step
