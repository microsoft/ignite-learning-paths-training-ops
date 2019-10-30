from azure.cosmosdb.table.tableservice import TableService
from azure.cosmosdb.table.models import Entity, EntityProperty, EdmType
import os

# Azure Storage
AZURE_STORAGE_ACCT = os.environ['AZURE_STORAGE_ACCT']
AZURE_STORAGE_KEY = os.environ['AZURE_STORAGE_KEY']

# Oncall engineer
EMAIL = os.environ['EMAIL']

# Table Name
table_name="oncall"
status_table_name="statuses"

table_service = TableService(account_name=AZURE_STORAGE_ACCT, account_key=AZURE_STORAGE_KEY)
table_service.create_table(table_name)
table_service.create_table(status_table_name)

first = {'PartitionKey': '1', 'RowKey': '1',
        'email': EMAIL, 'oncall': True}

second = {'PartitionKey': '1', 'RowKey': '2',
        'email': 'rebecca@microsoft.com', 'oncall': False}

table_service.insert_entity(table_name, first)
table_service.insert_entity(table_name, second)