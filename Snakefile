from os import path

PROJECT_NAME = "sensecity-africa"
PYTHON_VERSION = 3.9

CODE_DIR = "sensecity_africa"

NOTEBOOKS_DIR = "notebooks"
NOTEBOOKS_OUTPUT_DIR = f"{NOTEBOOKS_DIR}/output"
PHOTOS_GDF_IPYNB = f"{NOTEBOOKS_DIR}/01-photos-gdf.ipynb"

DATA_DIR = "data"
DATA_RAW_DIR = f"{DATA_DIR}/raw"


# 0. conda/mamba environment -----------------------------------------------------------
rule create_environment:
    # input:
    #     rules.logs_dir.output
    # log:
    #     "logs/create-environment.txt"
    run:
        shell(
            f"mamba create -n {PROJECT_NAME} -c conda-forge python={PYTHON_VERSION} -y"
        )
        shell(f"mamba env update -n {PROJECT_NAME} --file environment.yml")


rule register_ipykernel:
    # input:
    #     rules.logs_dir.output
    # log:
    #     "logs/register-ipykernel.txt"
    shell:
        f"python -m ipykernel install --user --name {PROJECT_NAME} --display-name"
        f" 'Python ({PROJECT_NAME})'"


# 1. photos geo-data frame -------------------------------------------------------------
rule photos_gdf:
    input:
        notebook=PHOTOS_GDF_IPYNB,
    output:
        photos_gdf=f"{DATA_RAW_DIR}/photos.gpkg",
        notebook=f"{NOTEBOOKS_OUTPUT_DIR}/{path.basename(PHOTOS_GDF_IPYNB)}",
    shell:
        "papermill {input.notebook} {output.notebook} -p dst_filepath "
        "{output.photos_gdf}"
