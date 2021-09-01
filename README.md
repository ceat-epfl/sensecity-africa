[![GitHub license](https://img.shields.io/github/license/martibosch/sensecity-africa.svg)](https://github.com/martibosch/sensecity-africa/blob/master/LICENSE)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/martibosch/sensecity-africa/master)

# SenseCity Africa

Crowdsensing urban data in Africa - [sensecity-africa.io](https://sensecity-africa.io)

## Instructions

### Running locally

From the root of this repository, follow the steps below:

1. Create a conda environment

```
make create_environment
```

2. Activate it

```
conda activate sensecity-africa
```

3. Register the IPython kernel for Jupyter

```
make register_ipykernel
```

4. Create a file named `.env` with the following content (to avoid disclosing your login credentials, remember to exclude such a file from version control):

```
USERNAME=<your-sensecity-africa-username>
PASSWORD=<your-sensecity-africa-password>
```

At this point, you can run the `notebooks/photos-api.ipynb` notebook to programatically download the photos and tags of the site.

### Running in the browser via myBinder

Alternatively, you can run the notebook in the browser (using myBinder):

1. Click the following badge to run a jupyter instance in the browser: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/martibosch/sensecity-africa/master)

2.Create a file named `.env` in the root of the repository with the following content:

```
USERNAME=<your-sensecity-africa-username>
PASSWORD=<your-sensecity-africa-password>
```

At this point, you can run the `notebooks/photos-api.ipynb` notebook to programatically download the photos and tags of the site.

## Acknowledgments

* Project based on [Henk Griffioen's version](https://github.com/hgrif/cookiecutter-ds-python) of the [cookiecutter data science project template](https://drivendata.github.io/cookiecutter-data-science). #cookiecutterdatascience
