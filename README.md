# Puma::RuntimeEnv::K8s

Update ENV vars at runtime through k8s mounted secrets for your Puma app.

Kubernetes mounted secrets update automatically as you edit them, so with this plugin, your app will pickup any changes to your mounted secrets without a restart.

However! K8s mounted secrets currently update in long, unpredictable intervals if you don't tune the refresh cycles yourself. We've seen it take up to 60 seconds for a mounted secret to update. For more info: https://github.com/kubernetes/kubernetes/issues/30189

Learn more about Kubernetes Secrets here: https://kubernetes.io/docs/concepts/configuration/secret/#using-secrets

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'puma-runtime_env-k8s'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install puma-runtime_env-k8s

## Usage

Have the following ENV vars defined at bootup:

```ruby
ENV["PUMA_RUNTIME_ENV_ADAPTER"] = "k8s"
ENV["SECRETS_MOUNT_PATH"] = "/path/to/your/secrets/here"

# some other configs to know about:

ENV["PUMA_RUNTIME_ENV_INTERVAL"]    # how often to check for new ENV (in seconds), defaults to 10

ENV["PUMA_RUNTIME_ENV_RESTRICTED"]  # anything you don't want to be updated at runtime,
                                    # automatically restricts required ENV's like PUMA_RUNTIME_ENV_ADAPTER
```

In your `puma.rb` or similary puma config file, register your plugin:

```ruby
# other puma configs

plugin :runtime_env
```

And then you're off to the races:

```sh
$ bundle exec puma -C config/puma.rb

$ kubectl edit secrets k8sSecretName

```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shaqq/puma-runtime_env-k8s. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [Apache 2.0 License](https://opensource.org/licenses/Apache-2.0).

## Code of Conduct

Everyone interacting in the Puma::RuntimeEnv::K8s project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/puma-runtime_env-k8s/blob/master/CODE_OF_CONDUCT.md).
