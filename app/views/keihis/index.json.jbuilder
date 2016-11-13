json.array!(@keihis) do |keihi|
  json.extract! keihi, :id, :date, :kamoku_id_id, :tekiyou, :kingaku
  json.url keihi_url(keihi, format: :json)
end
