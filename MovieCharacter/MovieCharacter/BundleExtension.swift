///json 을 Foundation으로 변환
///json 파일을 써먹기 위한 코드
///json구조의 데이터를 메모리로 읽어와 리스트에 전달할 데이터를 준비한다.
///이를 위해 번들의 기능을 확장해야 하고, 이게 그것을 담당한다.
import Foundation
 
extension Bundle {
    
  ///1. 파일명을 전달받음
  ///2. 번들에 있는 파일로 접근
  ///3. JSON구조의 데이터를 Foundation프레임워크에서 사용할 수 있는 타입으로 변환시켜줌
  func decode<T: Decodable>(filename: String, as type: T.Type) -> T {
    guard let url = self.url(forResource: filename, withExtension: nil) else {
      fatalError("번들에 \(filename)이 없습니다.")
    }
    guard let data = try? Data(contentsOf: url) else {
      fatalError("\(url)로부터 데이터를 불러올 수 없습니다.")
    }
    guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
      fatalError("데이터 복호화에 실패했습니다.")
    }
    return decodedData
  }
}
