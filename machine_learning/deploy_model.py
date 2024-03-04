import sagemaker
from sagemaker.sklearn.model import SKLearnModel

def deploy_model(model_artifact, role, entry_point):
    sklearn_model = SKLearnModel(model_data=model_artifact,
                                 role=role,
                                 framework_version='0.23-1',
                                 entry_point=entry_point)
    predictor = sklearn_model.deploy(instance_type='ml.t2.medium', initial_instance_count=1)
    return predictor

if __name__ == "__main__":
    model_artifact = 's3://liam-vibration-analysis/model.tar.gz'
    #role = needs role configured#
    entry_point = 'inference.py'
    deploy_model(model_artifact, role, entry_point)