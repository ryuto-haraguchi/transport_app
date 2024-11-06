Rails.application.config.session_store :cookie_store, key: '_company_session', domain: :all, tld_length: 2, expire_after: 30.minutes

Rails.application.config.session_store :cookie_store, key: '_employee_session', domain: :all, tld_length: 2, expire_after: 30.minutes