PROJECT_NAME = "sensecity-africa"
PYTHON_VERSION = 3.9

CODE_DIR = "sensecity_africa"

NOTEBOOKS_DIR = "notebooks"
NOTEBOOKS_OUTPUT_DIR = f"{NOTEBOOKS_DIR}/output"

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
