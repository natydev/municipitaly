
# 🇮🇹 Municipitaly

This gem provide various data about 🇮🇹 Italian subdivisions and municipalities. As well the entire updated list of provinces, regions and municipalities names, it provide useful codes (📯 postal code(s), 🌐 [ISTAT](https://www.istat.it/en/) codes, cadastrial code, population, ...).

## 💾 Installation

Add this line to your application's Gemfile:

```ruby
gem 'municipitaly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install municipitaly

## 👁 Scenic

These entities are present, subpoints are data attributes:

* **Zone** - NUTS 1 (it: *Zona/Ripartizione geografica*)
    * name
    * code (it: *codice zona*)
* **Region** - NUTS 2 (it: *Regione*)
    * name
    * ISTAT code (it: *codice istat*)
* **Province** - NUTS 3 (it: *Provincia*)
    * name
    * ISTAT code (it: *codice istat*)
    * acronym (it: *sigla*)
* **Municipality** (it: *Comune*)
    * name
    * ISTAT code (it: *codice istat*)
    * cadastrial code (it: *codice catastale*)
    * postal code(s) (it: *codice/i postale/i*)
    * population


## 🛠 Usage and examples


The **Municipitaly::Search** is the principal class used to search entities.  
Returned data are stored in 4 different types of entity models:

- **Municipitaly::Zone**
- **Municipitaly::Region**
- **Municipitaly::Province**
- **Municipitaly::Municipality**

Retrieve all zones (return an array of `Municipitaly::Zone` objects):

```ruby
# inside an irb or rails console:
require 'municipitaly'

zones = Municipitaly::Zone.all
# => [#<Municipitaly::Zone:0x0000...] 
```
pick a random zone:

```ruby
zone = zones.sample
# => #<Municipitaly::Zone:0x00007fb8390b9f48 @name="Centro", @code="3">
```
retrive data zone:

```ruby
zone.name
# => "Centro"

zone.code
# => "3" 
```

all regions belongs to a zone (return an array of `Municipitaly::Region` objects):

```ruby
zone.regions
# => [#<Municipitaly::Region:0x00007fb83883c550...]
```

and so for other entities:

```ruby
zone.provinces
# => [#<Municipitaly::Province:0x00007fb83a1478...]

zone.municipalities
# => [#<Municipitaly::Municipality:0x00007fb83a...]
```

### 🔎 Search

**Municipitaly::Search** is the most useful and interesting class: with that you can search single or multiple entities by the name, code or other attributes.

Search municipalities **from its name**: is case insensitive and can be partial (it returns an Array):

```ruby
municipalities = Municipitaly::Search.municipalities_from_name('ricco')
# => [#<Municipitaly::Municipality:0x00007fb839184838 @province_istat="028", @name="Borgoricco", @partial_istat="013", @cadastrial_code="B031", @postal_codes=["35010"], @population=8478>] 

municipality = municipalities.first
# => #<Municipitaly::Municipality:0x00007fb83918483..>

municipality.name
# => "Borgoricco"

municipality.postal_codes
# => ["35010"]
```

from an entity object is possible to retrieve other parent objects and its attributes:

```ruby
municipality.province_name
# => "Padova"

municipality.province_acronym
# => "PD"

municipality.province
# => #<Municipitaly::Province:0x00007fb83a12701...>

municipality.region_name
# => "Veneto"

municipality.region
# => #<Municipitaly::Region:0x00007fb83883cf28...>

municipality.zone
# => #<Municipitaly::Zone:0x00007fb8390bb938...>
```

or retrieve nested entities:

```ruby
padua = municipality.province
# => #<Municipitaly::Province:0x00007fb83a127010...>

padua.municipalities
# => [#<Municipitaly::Municipality:0x00007fb83915b730...]
```

Search municipalities **from a single postal code**:

```ruby
municipalities = Municipitaly::Search.municipalities_from_postal_code('50145')
# => [#<Municipitaly::Municipality:0x00007fb83a295938 @province_istat="048", @name="Firenze"...]

florence = municipalities.first
# => #<Municipitaly::Municipality:0x00007fb83a295938...>

florence.postal_codes
#  => ["50121", "50122", "50123", "50124", "50125", "50126", "50127", "50128", "50129", "50130", "50131", "50132", "50133", "50134", "50135", "50136", "50137", "50138", "50139", "50140", "50141", "50142", "50143", "50144", "50145"]
```

Complete list of available class and instance methods are documented inside code, is suggested to use `rdoc`, read at next point.


### 📖 Rdoc

Clone locally this repository and run
`bundle exec rdoc` to produce complete documentation inside your local directory.

## 🗄 Changelog

Complete list in [this section](CHANGELOG.md)

## 🤝 Contributing

Fells free to improve or suggest new features/ideas.
Bug reports and pull requests are welcome on GitHub at https://github.com/natydev/municipitaly. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

If you want to contribute keep these guidelines in mind:

* Despite is an Italy focused gem, I accept only PR, issues and messages **in English** lang.
* Code must be well formatted and **offences free**, use the provided `rubocop` gem.
* Use the same **coding conventions** as the rest of the project.
* Code must be **tested** (with rspec).
* Write code according to **SOLID** Principles.

Steps to submit your code:

1. Fork the repo.
2. Open your feature/namespaced branch
3. Commit your code following Github guidelines.
4. Make a PR with an exhaustive description.

## 📃 License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
