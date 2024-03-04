import pandas as pd
import boto3
import os

def clean_data(file_path):
    df = pd.read_csv(file_path)
    df['V_in'] = df['V_in'].fillna(df['V_in'].mean())
    df_cleaned = df.dropna()
    return df_cleaned

def upload_to_s3(cleaned_df, bucket_name, object_name):
    s3_client = boto3.client('s3')
    
    cleaned_df.to_csv('cleaned_data.csv', index=False)
    s3_client.upload_file('cleaned_data.csv', bucket_name, object_name)
    os.remove('cleaned_data.csv')


if __name__ == "__main__":
    df_cleaned = clean_data('~/User/Liam/Downloads/cleaned.csv')
    upload_to_s3(df_cleaned, 'liam-vibration-analysis', 's3://liam-vibration-analysis/data/cleaned_data.csv')