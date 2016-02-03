# OptinnowApi

API wrapper for OptINnow.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'optinnow_api', git: 'git@github.com:OpportunityIntl/optinnow_api.git'
```

And then execute:

    $ bundle

## Usage

Initialize a new OptINnow API client:

```ruby
client = OptINnow::Client.new(api_endpoint, api_key)
```

Execute API commands:

```ruby
# find donors by attributes
client.find_donors({first_name: 'Joe'})

# get donor
client.get_donor(123456)

# update donor
client.update_donor(123456, {first_name: 'Joseph'})

# create donor
client.create_donor({
  first_name: 'Joe',
  last_name: 'Schmoe',
  ...
})

# and so on and so forth
```

An `OptINnow::Response::Wrapper` object will be returned. The response will contain the HTTP status code returned by OptINnow, whether or not the API call was successful, and the resource(s) returned by OptINnow. The resource(s) are available with a class method named after the resource and quantity being requested.

For example, when dealing with donor records:

```ruby
response = client.find_donors({first_name: 'Joe'})
if response.success?
  # will return an array of OptINnow::Response::Object
  # objects containing the donors' attributes
  donors = response.donors
end

response = client.get_donor(donor_id)
if response.success?
  # will return a single OptINnow::Response::Object object
  donor = response.donor
end
```

Likewise, when dealing with fundraiser records:

```ruby
response = client.find_fundraisers({leader_id: donor_id})
if response.success?
  # will return an array of OptINnow::Response::Object
  # objects containing the fundraisers' attributes
  fundraisers = response.fundraisers
end

response = client.get_fundraiser(fundraiser_id)
if response.success?
  # will return a single OptINnow::Response::Object object
  fundraiser = response.fundraiser
end
```

Note that the class method name is pluralized (`response.donors`) for the `find_donors` method because it returns an array of resources, whereas the class method name is singular (`response.donor`) for the `get_donor`, `update_donor`, and `create_donor` methods because they return a single resource.

The `OptINnow::Response::Object` objects will contain the attributes returned by OptINnow, accessible via class methods matching the attribute names. For example:

```ruby
response = client.get_donor(donor_id)
if response.success?
  donor = response.donor
  first_name = donor.first_name
  email = donor.email
end
```

## Contributing

1. Fork it ( https://github.com/opportunityintl/optinnow_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
