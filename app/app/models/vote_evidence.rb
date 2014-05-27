class VoteEvidence < ActiveRecord::Base
belongs_to :counterevidence, foreign_key: :evidence_id
end
