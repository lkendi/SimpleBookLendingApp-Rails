json.extract! lending, :id, :book_id, :borrower_name, :borrowed_at, :returned_at, :created_at, :updated_at
json.url lending_url(lending, format: :json)
