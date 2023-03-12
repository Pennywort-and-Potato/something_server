# helper.rb

## get_query_limit

```ruby
  def get_query_limit(chunk, page)
    procc = {}
    (!chunk || 30 < chunk) ? procc[:chunk] = 30 : procc[:chunk] = chunk
    procc[:page] = page && page - 1 || 0
    procc[:offset] = procc[:page] * procc[:chunk]
    return procc
  end
```

Constraints:

- chunk: > 0 || < 30

Return:

```ruby
{
  page: 1,
  offset: 30,
  chunk: 30
}
```

## send_response

```ruby
  def send_response(data, status = :ok)
    return render json: {
      data: data,
      success: true
    },
    status: :ok
  end
```
