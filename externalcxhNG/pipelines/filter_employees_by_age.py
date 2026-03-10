from prophecy_pipeline_sdk.graph import *
from prophecy_pipeline_sdk.properties import *
args = PipelineArgs(label = "filter_employees_by_age", version = 1, params = Parameters(age_group = "'18-24'"))

with Pipeline(args) as pipeline:
    filter_employees_by_age__filter = Process(
        name = "filter_employees_by_age__filter",
        properties = ModelTransform(modelName = "filter_employees_by_age__filter")
    )

