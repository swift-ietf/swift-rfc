import IETF_RFC
import Testing

extension IETF.RFC {
    @Suite
    struct Tests {
        @Test
        func namespace() {
            #expect(IETF.RFC.self == IETF.RFC.self)
        }
    }
}
