```python
from rusty-forms import RustyAPI, NostrAuthApiConfig

auth = NostrAuthApiConfig()
auth.generate_keys()
auth.save()

api = RustyAPI(auth) # ... base_url, timeout
api.login()
```

_As of v0.1.0_