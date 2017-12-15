# OmniAuth Visma

This gem contains the unofficial Visma eAccounting strategy for OmniAuth.

See the [authorization documentation](https://developer.vismaonline.com/#eAccountingApiAuthorization) for Visma eAccounting.

For more information about the API see https://developer.vismaonline.com/.

To easily use the API from Ruby see [VismaEaccounting](https://github.com/espen/visma_eaccounting).

## Basic Usage

    use OmniAuth::Builder do
      provider "visma", ENV['VISMA_CLIENT_ID'], ENV['VISMA_CLIENT_SECRET'], scope: 'offline_access ea:api'
    end

The default environment is ```:production```. For testing you can use the sandbox environment by specifying ```:sandbox``` as ```environment``` in the provider setup. If changing environment after initalizing then call ```change_environment```.

## Credits

Based on [omniauth-37signals](https://github.com/tallgreentree/omniauth-37signals) by [Will Barrett](https://github.com/willbarrett).

## License

Copyright (c) 2017 by Espen Antonsen. [MIT License](LICENSE)