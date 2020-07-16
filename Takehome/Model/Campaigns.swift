
import Foundation
struct Campaigns : Codable {
	let id : Int?
	let campaign_name : String?
	let campaign_icon_url : String?
	let pay_per_install : String?
	let medias : [Medias]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case campaign_name = "campaign_name"
		case campaign_icon_url = "campaign_icon_url"
		case pay_per_install = "pay_per_install"
		case medias = "medias"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		campaign_name = try values.decodeIfPresent(String.self, forKey: .campaign_name)
		campaign_icon_url = try values.decodeIfPresent(String.self, forKey: .campaign_icon_url)
		pay_per_install = try values.decodeIfPresent(String.self, forKey: .pay_per_install)
		medias = try values.decodeIfPresent([Medias].self, forKey: .medias)
	}

}
