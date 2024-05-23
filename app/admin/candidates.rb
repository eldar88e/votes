ActiveAdmin.register Candidate do
  remove_filter :votes, :photo_attachment, :created_at, :updated_at, :img, :photo
end
