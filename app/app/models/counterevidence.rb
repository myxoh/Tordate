class Counterevidence < ActiveRecord::Base
belongs_to :article
has_many :votes, foreign_key: :evidence_id, class_name: :VoteEvidence
end
