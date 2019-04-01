---
layout: default
---

A collection of source code and examples from Pieter Hintjens and iMatix Corporation
used to build their products such as OpenAMQ and ZeroMQ. The primary motivation is
archeological and a suspicion that there's a lot to be learned.

Check out the [Links post]({{ site.baseurl }}{% post_url 2019-02-12-links %}) for
background reading on Model Oriented Programming.

For now, all the activity is on the blog:

{% for post in site.posts %}
* [{{ post.title }} by {{ post.author }} on {{ post.date | date_to_string }}]({{ post.url | relative_url }})
{% endfor %}
