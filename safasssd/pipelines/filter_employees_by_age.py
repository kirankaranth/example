from prophecy_pipeline_sdk.graph import *
from prophecy_pipeline_sdk.properties import *
args = PipelineArgs(
    label = "filter_employees_by_age",
    version = 1,
    auto_layout = False,
    params = Parameters(min_age_threshold = 30)
)

with Pipeline(args) as pipeline:
    filter_employees_by_age__filter_by_age = Process(
        name = "filter_employees_by_age__filter_by_age",
        properties = ModelTransform(modelName = "filter_employees_by_age__filter_by_age"),
        input_ports = None
    )

