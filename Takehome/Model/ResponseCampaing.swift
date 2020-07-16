
import Foundation
struct ResponseCampaing : Codable {
	let campaigns : [Campaigns]?

	enum CodingKeys: String, CodingKey {

		case campaigns = "campaigns"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		campaigns = try values.decodeIfPresent([Campaigns].self, forKey: .campaigns)
	}

}
