token = dbutils.secrets.get('${databricks_secret_scope.this.name}', '${databricks_secret.token.key}')
print(f'This should be redacted: {token}')
print(f'Hello world - today is holiday')
