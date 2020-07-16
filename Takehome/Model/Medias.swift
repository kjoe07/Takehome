

import Foundation
struct Medias : Codable {
	let cover_photo_url : String?
	let download_url : String?
	let tracking_link : String?
	let media_type : String?

	enum CodingKeys: String, CodingKey {

		case cover_photo_url = "cover_photo_url"
		case download_url = "download_url"
		case tracking_link = "tracking_link"
		case media_type = "media_type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		cover_photo_url = try values.decodeIfPresent(String.self, forKey: .cover_photo_url)
		download_url = try values.decodeIfPresent(String.self, forKey: .download_url)
		tracking_link = try values.decodeIfPresent(String.self, forKey: .tracking_link)
		media_type = try values.decodeIfPresent(String.self, forKey: .media_type)
	}

}
