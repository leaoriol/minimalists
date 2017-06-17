json.extract! item, :id, :name, :quantity, :action, :list_id, :created_at, :updated_at
json.url item_url(item, format: :json)
