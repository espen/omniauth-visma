# OmniAuth Visma

This gem contains the unofficial Visma eAccounting strategy for OmniAuth.

See the [authorization documentation](https://developer.vismaonline.com/#eAccountingApiAuthorization) for Visma eAccounting.

For more information about the API see https://developer.vismaonline.com/.

## Basic Usage

    use OmniAuth::Builder do
      provider "visma", ENV['VISMA_CLIENT_ID'], ENV['VISMA_CLIENT_SECRET'], scope: 'offline_access ea:api'
    end

## Attribution

Based on [omniauth-37signals](https://github.com/tallgreentree/omniauth-37signals) by [Will Barrett](https://github.com/willbarrett).

## License

Copyright (c) 2017 by Espen Antonsen.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

