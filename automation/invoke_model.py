import boto3
import json

def lambda_handler(event, context):

    client = boto3.client('sagemaker-runtime')

    endpoint_name = 'your-model-endpoint-name'

    payload = {"instances": [{'features': [0.5, 1200, 0.1, 0.2, 0.3]}]}  # Example payload

    response = client.invoke_endpoint(EndpointName=endpoint_name,
                                      ContentType='application/json',
                                      Body=json.dumps(payload))

    result = json.loads(response['Body'].read().decode())
    print(result)

    return result