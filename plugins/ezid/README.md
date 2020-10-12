# EZID Janeway Plugin

A plugin for [Janeway](https://janeway.systems/), enables minting of DOIs (via [EZID](https://ezid.cdlib.org/)) upon preprint acceptance to a Janeway repository.

The plugin is triggered by the `preprint_publication` event. This event happens immediately after the button to send an acceptance e-mail is clicked.

## Installation

1. copy the entire `ezid` folder to `src/plugins/` of your Janeway installation
2. run `pip install xmltodict`
3. run `python src/manage.py install_plugins`
4. configure the plugin (see below)

## Configuration

The following keys need to be added, with appropriate values, to the settings.py file you're using for your Janeway installation:

```
# EZID settings
EZID_SHOULDER = 'doi:10.15697/'
EZID_USERNAME = 'valid_username'
EZID_PASSWORD = 'valid_password'
EZID_ENDPOINT_URL = 'https://uc3-ezidx2-stg.cdlib.org'
# ezid production URL is: https://ezid.cdlib.org
# ezid staging URL is: https://uc3-ezidx2-stg.cdlib.org
```

## Usage

When installed and configured, the plugin will mint DOIs and add them to the system-created `preprint_doi` field for each newly-accepted preprint. Errors are logged.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

BSD 3-Clause